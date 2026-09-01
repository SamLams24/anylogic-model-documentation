# Vérification du run de validation VSM

## Décision probatoire

Le run est accepté. La paire Excel et ABox décrit la même exécution, les définitions temporelles corrigées sont concordantes et le pipeline RS utilise les nouveaux indicateurs de commande. Le statut retenu est `VALIDE_EXPERIMENTALEMENT` pour les faits directement listés dans ce rapport.

`VALIDATION_TEMPORELLE = OUI`

`STATUT_PCE = PCE_ESTIME`

`STATUT_PI = VALIDE_EXPERIMENTALEMENT_DANS_LE_CADRE_DU_MODELE`

## Identification et intégrité

- Run: `RUN_1773129600000_1788264883846`.
- Scénario: `SCENARIO DISTRIBUTION`.
- Motif d'export: `ORDER_CLOSED_CMD_1`.
- Instant de clôture simulé: 2 343 s.
- Timestamp de clôture: `2026-03-25T12:53:30`.
- Échelle: `simToRealSeconds = 600`.
- Commande configurée: une commande de 20 unités.
- Retard déterministe: actif sur `GPL_VRAC`, facteur 2, première réception seulement.
- Classeur: `results_final.xlsx`, SHA-256 `A4D598CEF238FC91D9DA4C69AC1BB2119A498D1F33692E02A4948D079F7723B5`.
- ABox: `abox_final.ttl`, SHA-256 `E22251A49E6851FB21868AF4C622D830209399CC8167B628931009D98F608052`.

La feuille `Manifeste Run` et l'individu `SimulationRun` donnent le même `runId`, le même scénario, la même configuration de commande, la même échelle, la même perturbation et le même timestamp de clôture. L'instant T=2 343 s apparaît dans l'ABox et dans la trace de clôture Excel.

## Commande, ordre interne et stocks

La feuille `Performance par produit` compte une commande cliente, 20 unités commandées, 20 unités livrées, une commande en retard et un stock fini final nul. `Validation C13-C14` compte séparément une commande cliente et un ordre de stock.

L'ABox qualifie `order_CMD_1` comme `CustomerOrder`, origine `CUSTOMER`, quantité 20 et statut `EN_RETARD`. Elle qualifie `order_REAPPRO_1` comme `InternalStockReplenishmentOrder`, origine `STOCK_AUTONOMOUS`, quantité 20 et statut `SERVIE`.

Les deux relations RDF sont présentes:

- `order_REAPPRO_1 contributesToCustomerOrderFulfillment order_CMD_1`;
- `order_CMD_1 dependsOnInternalReplenishmentOrder order_REAPPRO_1`.

Le profil chargé fixe le stock initial de produit fini à 0, le GPL à 0, les bouteilles vides à 250 et les accessoires à 300. La réception crédite 250 unités de GPL à T=233 s. À la clôture, l'ABox porte 0 unité de GPL, 230 bouteilles vides et 280 accessoires. Le stock produit fini vaut 0 après livraison des 20 unités.

## Chronologie contrôlée

- T=156 s: création et réception de `CMD_1`.
- T=159 s: ouverture de l'attente de stock et création de `REAPPRO_1`.
- T=159 s: lancement Source et propagation du retard fournisseur.
- T=233 s: `MaterialReceived`, puis `MaterialAvailable`.
- T=235 s: `ExecutionStart` de Make.
- T=2 314 s: vingtième unité terminée et fin de la reconstitution.
- T=2 313,97322172 s: fin horodatée de l'attente de stock de `CMD_1`.
- T=2 320 s: lancement du transport Deliver.
- T=2 343 s: livraison complète, statut `EN_RETARD`, événement `COMMANDE_CLOSE` et export final.

L'ordre causal Source, Make, crédit du stock fini, réveil de `CMD_1`, Deliver et clôture est conservé. Les lignes de flux physique montrent 250 unités de GPL entrantes et 20 unités de produit fini livrées. Ces quantités sont des flux traversants et ne sont pas additionnées à chaque poste.

## Retard fournisseur et propagation AER

Le GPL porte un délai nominal de 6 h et un délai effectif de 12 h. Le retard additionnel est donc de 6 h. Le Dashboard Global affiche par ailleurs 7 h nominales et 9 h effectives comme moyennes de configuration sur les matières. Ces moyennes ne remplacent pas la valeur ciblée du GPL portée par la trace et les messages.

Les six messages attendus sont présents une fois chacun dans Excel et comme individus AER structurés dans l'ABox:

- `SupplierDelayAlert`;
- `OperationalException`;
- `ProcessDeviationReport`;
- `RevisedMaterialAvailability`;
- `RevisedProductionCompletionDate`;
- `RevisedDeliveryPlan`.

Chaque message concerne `REAPPRO_1` et conserve la charge utile `GPL_VRAC`, `ACT_1`, 6 h nominales, 12 h effectives et 6 h de retard.

## Validation des six indicateurs VSM

Les valeurs exactes de l'ABox et les valeurs arrondies du Dashboard Global concordent:

- Order Processing Time: 18 116,83756052 s, affiché 18 116,84 s;
- Order Waiting / Dwell Time: 46 924,40300189 s, affiché 46 924,40 s;
- Order Fulfillment Lead Time: 65 041,24056241 s, affiché 65 041,24 s;
- ZENER Process Time: 59,38852156 s, affiché 59,39 s;
- ZENER Waiting Time: 12,69587399 s, affiché 12,70 s;
- ZENER Estimated PCE: 0,70870898, affiché 70,9 pour cent.

L'identité temporelle est exacte à la précision exportée:

`18 116,83756052 + 46 924,40300189 = 65 041,24056241 s`.

Le périmètre commande utilise le contexte `CUSTOMER_ORDER_CMD_ONLY` et la source `DERIVED_FROM_CUSTOMER_ORDER_LEDGER`. Le périmètre VSM focal utilise `ZENER_ACT_4_ONLY` et la source `DERIVED_FROM_ACT_4_OBSERVATIONS`. Les jetons visuels sont exclus par la logique du modèle et ne sont pas assimilés à des entités physiques.

Le PCE ZENER est une estimation. Les temps de traitement et d'attente proviennent des observations du modèle, mais la valeur ajoutée est obtenue par les taux de poste. L'ABox porte `valueAddedNature = ESTIMATED` et `valueAddedSourcePolicy = CONFIGUREE_OR_FALLBACK_BY_POST`. Les micro-activités indiquent `VA_SOURCE = CONFIGUREE` dans ce run. La somme Process Time et Waiting Time du périmètre ZENER vaut 72,08439555 s; le ratio exporté correspond à environ 51,0869 s de valeur ajoutée estimée.

## Responsiveness et Performance Index

`RS.1.1` vaut 65 041,24056241 s et agrège directement `vsm_order_fulfillment_lead_time`. `RS.3.94` vaut 46 924,40300189 s et agrège directement `vsm_order_waiting_time`. Les valeurs Excel et RDF sont identiques.

Les métriques macro présentes sont:

- `RS.2.1`, Source: 1,60096154 s;
- `RS.2.2`, Make: 26,0695401 s;
- `RS.2.3`, Deliver: 67,12341232 s.

`RS.2.5` est absente, car Return n'a pas été exécuté. Cette absence ne doit pas être publiée comme une valeur nulle.

Les scores d'attribut et le PI concordent entre Excel et l'ABox:

- RL: 7,5 sur 10;
- RS: 5,94733671 sur 10;
- AG: 4,73462025 sur 10;
- CO: 0 sur 10;
- AM: 9,70588235 sur 10;
- PI: 6,11881172 sur 10.

Les poids d'attribut sont 0,40 pour RL, 0,20 pour RS, 0,10 pour AG, 0,15 pour CO et 0,15 pour AM. Les valeurs brutes, règles Bottom/Perfect, scores, grades flous, poids et contributions sont exportés. La cohérence d'entrée et de calcul est établie. Les profils de normalisation restent des paramètres du modèle à calibrer sur des références métier avant toute interprétation absolue.

## Dynamique holonique observée

Le run contient une détection de goulot sur `sM1.3.1`, une boucle AER locale, une décision `REBALANCE`, un score AHP local de 0,730 et les accusés d'application. Cette dynamique est observée dans ce run seulement. Elle ne constitue ni une comparaison causale de scénarios ni une contribution directe au PI global.

## Structure ISA-95

L'ABox contient 190 sujets d'équipement typés avec la terminologie `EnterpriseUnit`, `Site`, `Area`, `Workshop`, `WorkCenter` et `WorkCell`. Elle contient aussi 71 micro-activités et 71 relations `executedAt`. La garde de 190 noeuds et 71 affectations est donc confirmée pour ce snapshot.

## Limites maintenues

Un seul run validé est disponible. Aucun run de référence sans retard, synchronisé et construit avec le même modèle, ne permet une estimation causale de l'effet net des 6 h de retard fournisseur. La graine reste `NON_ACCESSIBLE_DANS_MAIN`. Le SHA-256 du preset JSON n'est pas exporté automatiquement. La valeur ajoutée n'est pas chronométrée. L'imputation d'un ordre `REAPPRO_*` partagé par plusieurs commandes n'est pas validée expérimentalement.
