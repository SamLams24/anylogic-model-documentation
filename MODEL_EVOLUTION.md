# MODEL_EVOLUTION.md

## Objet
Ce fichier décrit les évolutions fonctionnelles du modèle consolidé qui doivent être prises en compte dans la rédaction finale. Il complète le document source historique. Une fonctionnalité importante du modèle ne doit pas disparaître du rapport au seul motif qu'elle n'était pas développée dans l'ancienne version documentaire.

La rédaction doit toujours distinguer trois niveaux :

1. fonctionnalité implémentée dans le modèle ;
2. fonctionnalité observée dans une exécution ou un export ;
3. fonctionnalité seulement disponible pour expérimentation, sans résultat final suffisant pour une conclusion quantitative.

Ne jamais transformer le niveau 1 ou 3 en preuve expérimentale de niveau 2.

## 1. Base fonctionnelle issue de la consolidation

Le modèle consolidé a pris comme base fonctionnelle la version enrichie du modèle, puis a réintégré les invariants techniques de la branche précédente. La garde de non-régression ISA-95 doit rester cohérente avec la structure autoritative : 190 noeuds et 71 affectations.

La rédaction finale ne doit pas raconter l'historique de fusion des fichiers. Elle doit simplement décrire le fonctionnement consolidé lorsqu'il est pertinent.

## 2. Politique autonome de stock

### 2.1 Produit fini
Le modèle dispose d'une politique autonome de reconstitution du stock de produit fini. Une commande cliente peut constater un stock insuffisant et attendre la reconstitution. La décision de production est portée par la politique de stock et non par une transformation directe de la commande cliente en ordre de fabrication.

Les paramètres structurants sont :

- stock de sécurité ;
- point de commande ;
- demande observée ou estimée pendant le délai de reconstitution ;
- coût de lancement de production ;
- coût annuel de possession ;
- quantité économique calculée selon Wilson, avec bornage de stabilité dans le modèle.

Les ordres internes de reconstitution sont identifiés par `REAPPRO_*`. Ils doivent être distingués des commandes clientes `CMD_*` dans toute explication des KPI de service, de ponctualité ou de quantité commandée.

### 2.2 Matières premières
Chaque matière peut être pilotée par une logique de stock projeté : stock disponible, réceptions attendues, point de commande et quantité économique. Lorsque la matière manque, Source est sollicité avant Make.

Le rapport doit expliquer la logique générale sans surcharger le corps principal avec le détail algorithmique. Les paramètres ou équations utiles peuvent apparaître dans le chapitre de validation expérimentale ou en annexe.

## 3. Chaîne contrôlée Source, Make, Deliver

La version consolidée corrige le chemin complet lorsqu'une commande rencontre simultanément un stock de produit fini insuffisant et une matière manquante. Le comportement attendu et observé sur les runs contrôlés est :

`CMD_* -> diagnostic stock -> REAPPRO_* -> analyse matière -> Source -> MaterialReceived -> MaterialAvailable -> Make -> crédit stock produit fini -> réveil de CMD_* -> Deliver -> clôture client`.

Le poste de transfert vers le magasin produit fini doit effectivement créditer le stock physique. La rédaction doit présenter cette chaîne comme une continuité métier, et non comme une conversion de la commande cliente en ordre interne.

## 4. Initialisation reproductible des stocks

Les valeurs détaillées par matière du scénario chargé sont la référence de démarrage, sauf choix explicite d'un profil ou d'une configuration de test. Le rapport final doit donc documenter les conditions initiales de chaque expérimentation retenue et éviter toute formulation laissant penser qu'un stock caché ou une valeur codée en dur intervient.

Pour les scénarios contrôlés, les conditions initiales doivent être présentées avec les valeurs réellement chargées dans le JSON ou observées dans l'export.

## 5. Perturbation fournisseur déterministe

Le modèle consolidé permet de forcer un retard fournisseur reproductible sur une matière ciblée. Le mécanisme distingue :

- délai nominal utilisé pour la planification ;
- délai effectif subi ;
- retard additionnel ;
- matière et fournisseur concernés ;
- première réception seulement ou réceptions ciblées selon la configuration.

La propagation informationnelle mise en place est :

`SupplierDelayAlert -> OperationalException -> ProcessDeviationReport -> RevisedMaterialAvailability -> RevisedProductionCompletionDate -> RevisedDeliveryPlan`.

Cette fonctionnalité a été validée sur un run contrôlé GPL avec délai nominal de 6 h et délai effectif de 12 h. L'écart simulé observé sur Source est cohérent avec le retard injecté compte tenu de l'échelle temporelle. Les valeurs quantitatives finales doivent être reprises uniquement depuis les exports retenus comme preuves.

## 6. Gestion de l'échelle temporelle

Le modèle distingue les durées de simulation et certaines durées réelles reconstruites par l'échelle configurée. Les chaînes Source et Deliver utilisent cette conversion pour les délais réels, tandis que Make conserve sa dynamique propre dans la simulation.

La rédaction doit éviter de comparer directement deux durées exprimées dans des référentiels temporels différents sans expliciter la conversion. Les délais fournisseurs incluent la logique de réception et de contrôle lorsqu'elle est présente dans le calcul effectif.

## 7. Mesure VSM et KPI du périmètre ZENER

Le modèle dispose d'une consolidation spécifique au périmètre de l'entreprise focale afin de calculer notamment :

- Process Time ;
- Waiting Time ;
- PCE ;
- Lead Time ;
- débit de production ;
- WIP physique ;
- taux de service ;
- commandes en retard ;
- commandes servies uniquement depuis le stock ;
- stock matière ;
- délai fournisseur ;
- taux de rebut ;
- taux de reprise.

Les jetons purement visuels doivent être exclus des mesures de WIP et d'occupation lorsqu'ils ne représentent pas une entité physique métier.

## 8. Corrections qualité et comptage

La logique consolidée corrige plusieurs points de comptage :

- le taux de remplissage ou conformité ne doit pas utiliser un dénominateur basé sur le nombre de commandes lorsqu'il s'agit d'unités produites ;
- les rebuts doivent permettre la clôture correcte d'un lot une fois toutes les unités traitées ;
- les taux de rebut et de reprise sont distingués ;
- les ordres `REAPPRO_*` ne doivent pas dégrader les KPI clients ;
- le stock produit fini doit être décrémenté lors de la satisfaction effective d'une commande, y compris après reconstitution par production.

Toute valeur qualité publiée dans le rapport doit provenir d'un run dont les probabilités de défaut sont explicitement connues.

## 9. Perturbations de demande

Le modèle contient des déclencheurs de perturbation de demande, notamment :

- pic ponctuel de quantité ;
- rafale de plusieurs commandes espacées dans le temps.

Ces fonctions peuvent être décrites comme capacités d'expérimentation du modèle. Elles ne doivent être accompagnées de conclusions quantitatives que si un export dédié est disponible.

## 10. Pannes, goulots et boucle holonique

Le modèle conserve une logique de panne machine, de détection de goulot et de remontée AER. Les états opérationnels ont été rapprochés de l'état instantané des files et occupations plutôt que d'une lecture uniquement cumulative.

La boucle d'adaptation peut impliquer :

- rapport d'incident ;
- Blackboard ;
- pilotage opérationnel ;
- coordinateur ;
- tactique ;
- arbitrage local AHP ;
- instruction opérationnelle ;
- accusé de réalisation.

Le score AHP local et le Performance Index sont deux mécanismes distincts. L'AHP sert à l'arbitrage local ; le PI sert à l'évaluation multicritère globale.

Si le document reprend une panne observée dans un ancien run, il doit identifier clairement cette exécution comme source de preuve et ne pas la mélanger aux résultats du run fournisseur contrôlé.

## 11. Flux informationnels et visualisation

La version consolidée améliore la représentation des échanges bidirectionnels liés aux contrôles de stock et à la planification. La propagation automatique de branches uniquement visuelles a été limitée pour éviter d'augmenter artificiellement les compteurs de passage.

Les flux de retour client et certaines traces Source ont également été rapprochés d'événements temporisés réellement observables.

Le rapport doit séparer clairement :

- flux physique ;
- communication inter-agent ;
- animation visuelle ;
- mesure enregistrée.

Une animation ne constitue pas à elle seule une preuve quantitative.

## 12. Interface et tableaux de bord

Des indicateurs complémentaires sont disponibles dans le modèle et les exports, notamment :

- Supplier Lead Time ;
- Scrap Rate ;
- Rework Rate ;
- Delayed Orders ;
- Stock-Only Orders ;
- Raw Material Stock ;
- Service ;
- informations de perturbation fournisseur lorsque le test est actif.

Ils doivent être utilisés lorsque cela enrichit réellement l'analyse et non recopiés sous forme de catalogue.

## 13. ABox et exports synchronisés

La rédaction finale doit traiter les exports Excel et l'ABox comme des preuves complémentaires. Lorsque le runId et l'instant de clôture correspondent, ils peuvent être présentés comme un snapshot synchronisé de la même exécution.

Les commandes clientes et les ordres internes doivent être distingués dans l'ABox lorsque cette distinction est disponible. Les annexes sont l'emplacement privilégié pour les références de fichiers, feuilles, runId et preuves détaillées.

## 14. Fonctionnalités à ne pas suraffirmer

### 14.1 Comparaison centralisé, décentralisé, hybride
Aucun mode expérimental complet et commutable permettant une comparaison rigoureuse des trois stratégies ne doit être présenté comme validé tant qu'une preuve de son implémentation et de runs comparables n'est pas disponible.

### 14.2 Optimisation de stock
La présence du point de commande et de Wilson démontre une capacité de paramétrage et d'expérimentation. Une optimisation au sens de résultat optimal démontré nécessite des runs comparatifs. Employer les termes `politique de stock`, `aide à la décision` ou `analyse de sensibilité` lorsque les preuves ne permettent pas d'affirmer un optimum.

### 14.3 Scénarios non rejoués
Une fonctionnalité présente dans le code peut être expliquée comme capacité du simulateur. Elle ne doit pas être présentée comme validation expérimentale si aucun run final ne l'a démontrée.

## 15. Placement conseillé dans le document final

- Chapitre 2 : conditions initiales reproductibles, politique de stock et paramètres utiles.
- Chapitre 3 : architecture multi-agents, distinction commande client / ordre interne, niveaux de décision.
- Chapitre 4 : chaîne Source, Make, Deliver et réveil de la commande après reconstitution.
- Chapitre 5 : perturbations fournisseur, panne, goulot, Blackboard et AHP local.
- Chapitre 6 : KPI VSM, WIP physique, qualité, Lead Time et attente.
- Chapitre 7 : transformation des mesures vers SCOR et PI, sans confondre AHP et PI.
- Chapitre 8 : scénarios expérimentaux, politique de stock, retard fournisseur, pics de demande et autres capacités réellement démontrées ou clairement marquées comme disponibles.
- Chapitre 9 : discussion des mécanismes, apports de la politique autonome et limites de validation.
- Annexes : détails algorithmiques, tableaux complets, ABox, fichiers de preuve, communications exhaustives.

## 16. Règle de migration

Lors de la migration de l'ancien document, Codex doit vérifier explicitement que les fonctionnalités de ce fichier ont une destination dans le document final. Une fonctionnalité ne peut être supprimée comme répétition que si son contenu est déjà conservé ailleurs avec un niveau de précision suffisant.
