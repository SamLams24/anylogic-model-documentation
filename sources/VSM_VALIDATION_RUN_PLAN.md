# Plan du run minimal de validation VSM

## Objectif

Un seul run sera exécuté avec `sources/model/SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp`. Il doit vérifier la continuité temporelle entre `CMD_1`, `REAPPRO_1`, Source, Make et Deliver, puis contrôler que VSM, Responsiveness et le PI utilisent les mêmes définitions dans Excel et dans l'ABox.

Ce document prépare la procédure. Il ne demande pas encore le lancement du run.

## Configuration à figer

Le scénario reprend le cas contrôlé de reconstitution avec retard fournisseur:

* une seule commande cliente `CMD_1` de 20 unités;
* stock initial de produit fini égal à 0;
* stock GPL initial égal à 0;
* 250 bouteilles vides et 300 kits d'accessoires disponibles au démarrage;
* nomenclature de 12,5 unités de GPL, une bouteille et un kit par produit fini;
* un seul ordre interne attendu, `REAPPRO_1`, de 20 unités;
* retard déterministe sur la première réception de GPL;
* délai nominal GPL de 6 h et délai effectif de 12 h;
* échelle temporelle, graine aléatoire et profils de normalisation enregistrés dans le manifeste du run;
* export Excel et ABox déclenché à la clôture de `CMD_1` avec le même `runId`.

Tout écart de configuration doit annuler la comparaison avec le run antérieur.

## Observations obligatoires

La trace doit permettre de relier la création de `CMD_1`, son entrée en attente de stock, la création de `REAPPRO_1`, le lancement et la réception Source, le début et la fin de Make, le crédit du stock fini, le réveil de `CMD_1`, Deliver et la clôture client.

Pour chaque segment temporel, l'export doit indiquer l'identifiant de commande ou d'ordre, le début, la fin, l'unité, la catégorie traitement ou attente et la méthode de conversion. Le lien entre `REAPPRO_1` et `CMD_1` doit être explicite. Une durée ne doit pas être reconstituée par rapprochement manuel de libellés.

## Feuilles Excel à contrôler

`Execution Brute` doit contenir les événements temporels de `CMD_1` et `REAPPRO_1`, les passages Source, Make et Deliver, les temps de files et la clôture globale.

`Propagation agents et flux` doit confirmer le retard GPL, la disponibilité matière, la fin de reconstitution et le réveil de la commande cliente.

`Flux Supply Chain` doit conserver l'ordre Source, Make, crédit stock et Deliver sans confondre quantité traversante et quantité cumulée.

`Dashboard Micro` doit exposer les temps observés par poste, leur poids et le taux VA configuré. Les étapes purement visuelles ne doivent pas contribuer.

`Dashboard Macro` doit fournir les cycles et attentes Source, Make et Deliver avec un compteur interprété comme nombre d'observations.

`Dashboard Global` doit exposer séparément `Order Processing Time`, `Order Waiting / Dwell Time`, `Order Fulfillment Lead Time`, `ZENER Process Time`, `ZENER Waiting Time` et `ZENER Estimated PCE`. Il faut vérifier `Order Fulfillment Lead Time = Order Processing Time + Order Waiting / Dwell Time`. Le PCE ZENER doit provenir de `kpiZener` et de la valeur ajoutée estimée, sans alimenter l'attente de commande.

`Manifeste Run` doit contenir le `runId`, le scénario, la quantité fixe, le nombre de commandes, `simToRealSeconds`, le retard fournisseur actif, la matière ciblée, le facteur, l'application à la première réception, l'état d'accès à la graine, le timestamp de clôture, le preset JSON et le nom du modèle candidate.

Dans l'ABox, les propriétés correspondantes du `SimulationRun` sont `run:runId`, `run:scenarioName`, `run:fixedOrderQuantity`, `run:configuredOrderCount`, `run:simToRealSeconds`, `run:supplierDelayActive`, `run:supplierDelayTarget`, `run:supplierDelayFactor`, `run:firstReceiptOnly`, `run:randomSeed`, `run:closureTimestamp`, `run:jsonPresetName` et `run:modelArtifact`.

`Pipeline SCOR vers PI` doit contenir au minimum `RS.1.1`, `RS.3.94`, `RS.2.1`, `RS.2.2`, `RS.2.3`, le score RS et le PI recalculé.

`Traçabilité performance` doit préciser les valeurs sources, les profils bottom et perfect, les scores, les poids et les contributions floues de ces métriques.

`Performance par produit` doit confirmer une commande cliente, 20 unités commandées et 20 livrées, sans compter `REAPPRO_1` comme seconde commande.

`Validation C13-C14` doit confirmer les garde-fous de distinction entre commandes clientes et ordres internes.

## Individus ABox à contrôler

L'ABox doit contenir le `SimulationRun` du nouveau `runId`, `order_CMD_1`, `order_REAPPRO_1` et un lien explicite indiquant que l'ordre interne contribue à la satisfaction de la commande cliente.

Les événements à contrôler sont la création de la commande, le début et la fin de son attente de stock, la réception GPL, la fin de Make, le crédit stock, le réveil de `CMD_1`, Deliver et `COMMANDE_CLOSE`.

Les individus de commande à contrôler sont `vsm_order_processing_time`, `vsm_order_waiting_time` et `vsm_order_fulfillment_lead_time`. Les individus VSM ZENER sont `vsm_zener_process_time`, `vsm_zener_waiting_time` et `vsm_zener_estimated_pce`. Chaque indicateur doit porter l'unité, un libellé explicite et le contexte `CUSTOMER_ORDER_CMD_ONLY` ou `ZENER_ACT_4_ONLY`.

`order_REAPPRO_1` doit porter `run:contributesToCustomerOrderFulfillment order_CMD_1`. La relation inverse `run:dependsOnInternalReplenishmentOrder` doit être présente sur `order_CMD_1`. Le `SimulationRun` doit exposer le même manifeste que la feuille Excel.

`order_CMD_1` doit aussi porter `run:orderProcessingTimeSeconds`, `run:orderWaitingTimeSeconds`, `run:orderFulfillmentLeadTimeSeconds`, `run:replenishmentImputedTimeSeconds`, `run:stockWaitStartedAtSimulationSecond` et `run:stockWaitEndedAtSimulationSecond`. `order_REAPPRO_1` doit porter `run:replenishmentBusinessDurationSeconds`.

Les individus de performance à contrôler sont `metric_RS_1_1_RS`, `metric_RS_3_94_RS`, les métriques `RS.2.1`, `RS.2.2` et `RS.2.3`, `attr_RS` et `evaluation_PI_*`. Les règles d'agrégation de `RS.1.1` et `RS.3.94` doivent pointer vers les individus VSM qui portent exactement les mêmes valeurs.

## Critères d'acceptation

Le run est accepté si les conditions suivantes sont toutes satisfaites:

1. `CMD_1` et `REAPPRO_1` restent deux objets distincts et reliés.
2. Le Lead Time client inclut le segment de reconstitution selon la définition retenue.
3. L'attente globale provient de l'état explicite de dépendance au stock et de la durée métier du `REAPPRO_*` lié, sans reconstruction par PCE.
4. Process Time, Waiting Time et Lead Time partagent la même unité et vérifient leur identité additive.
5. Le PCE ZENER est recalculé depuis `kpiZener` et la valeur ajoutée est explicitement qualifiée d'estimée, avec `VA_SOURCE` égale à `CONFIGUREE` ou `FALLBACK` selon le poste.
6. Excel et ABox donnent les mêmes valeurs globales à la précision d'export près.
7. `RS.1.1` et `RS.3.94` reprennent les valeurs VSM correspondantes sans contradiction RDF.
8. Le score RS et le PI peuvent être reproduits depuis les valeurs, profils et poids exportés.
9. Les jalons Source, Make et Deliver conservent l'ordre causal du scénario.
10. Aucun jeton visuel ni ordre `REAPPRO_*` n'augmente les KPI de service client.

## Procédure exacte du prochain run

1. Ouvrir `SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp` dans AnyLogic 8.9.8 et effectuer le build. En cas d'erreur, conserver le journal complet et ne pas lancer l'expérience.
2. Charger le même preset ZENER que pour le Run B, puis sélectionner le scénario nominal `SCENARIO DISTRIBUTION`.
3. Activer la limitation à une commande, fixer la quantité à 20 et conserver le mode MTS autonome.
4. Régler le stock initial de produit fini à 0, le GPL à 0, les bouteilles vides à 250 et les accessoires à 300.
5. Vérifier la nomenclature de 12,5 unités de GPL, une bouteille vide et un accessoire par produit fini.
6. Conserver `simToRealSeconds = 600` et enregistrer la graine depuis l'expérience AnyLogic si elle est exposée.
7. Activer le retard fournisseur déterministe sur `GPL_VRAC`, avec un facteur 2 et l'option première réception seulement. Le délai nominal doit rester 6 h et le délai effectif doit être 12 h.
8. Activer l'export ABox à la clôture et l'export Excel synchronisé. Réinitialiser le modèle avant le lancement afin d'obtenir un nouveau `runId`.
9. Lancer une seule exécution et l'arrêter après la clôture de `CMD_1` et la génération des deux artefacts.
10. Copier le classeur, l'ABox et le journal dans un nouveau dossier sous `sources/runs/supplier_delay/`, sans remplacer les preuves du Run B.
11. Calculer le SHA-256 de chaque artefact et inscrire le nouveau run dans `sources/SOURCE_REGISTER.md` avant toute promotion au statut `VALIDE_EXPERIMENTALEMENT`.
12. Appliquer tous les critères d'acceptation ci-dessus. Tout écart d'identité entre Excel, ABox, `RS.1.1` et `RS.3.94` invalide le run.

## Comparaison avant et après correction

La comparaison doit conserver les valeurs antérieures uniquement comme diagnostic de régression. Les références sont 15 018,85274794 s pour le Lead Time reconstruit, 0 s pour l'attente ABox, 5 256,59846178 s pour l'attente reconstruite, 65 pour cent pour le PCE imposé, 6,48470653 pour RS et 6,22653408 pour le PI.

Les nouvelles valeurs ne sont pas tenues de rester proches de ces références. Elles doivent respecter la définition retenue, être cohérentes entre les exports et être recalculables.
