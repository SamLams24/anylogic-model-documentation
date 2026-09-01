# Implémentation de la correction temporelle VSM candidate

## Périmètre et statut

La correction a été appliquée à `sources/model/SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp`, puis promue dans `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp` après construction et exécution réussies dans AnyLogic. La baseline `SCONTO_SVU_FINAL.alp`, qui a produit les preuves du Run B, reste inchangée.

La candidate et le modèle promu portent l'empreinte SHA-256 `C4DF051A98498B4D8FCA7D5964A2DEC809DDCE100523EDB2C7A1E25CA2276B66`.

## Problème initial

Le registre global des commandes utilisait une durée partielle propre à `CMD_1`, sans la reconstitution portée par `REAPPRO_1`. L'attente Excel était reconstruite à partir du Lead Time et d'un PCE imposé à 65 pour cent, tandis que l'ABox exportait une attente nulle. Le PCE de commande était ainsi confondu avec le PCE VSM de ZENER. Cette divergence affectait `RS.1.1`, `RS.3.94`, Responsiveness et le PI.

## Définition retenue

Le périmètre commande cliente contient uniquement les objets `CMD_*`. Son Lead Time métier est la somme de la durée active propre à la commande et de l'attente de reconstitution explicitement imputée depuis les ordres internes liés. Son Waiting Time est cette attente explicite. Le Processing Time est le Lead Time diminué du Waiting Time. Les trois valeurs sont alimentées ensemble dans `kpiGlobal` et vérifient l'identité additive à la précision numérique près.

Le périmètre VSM ZENER contient les observations `ACT_4` consolidées dans `kpiZener`. Son PCE estimé est la valeur ajoutée estimée divisée par la somme du traitement et de l'attente du même périmètre. Les taux VA configurés et les fallbacks existants sont conservés. Ils ne sont pas présentés comme des observations directes.

## Fonctions modifiées ou ajoutées

Les fonctions de liaison et de registre ajoutées sont `estOrdreReappro`, `ouvrirAttenteStockCommande`, `quantiteClientsCouverts`, `lierCommandeEtReappro`, `lierCommandeAuReapproActif`, `lierReapproAuxCommandesClientesEnAttente`, `finaliserDependanceReappro`, `actualiserRegistreTempsCommande`, `orderProcessingTimeGlobal`, `orderWaitingTimeGlobal` et `orderFulfillmentLeadTimeGlobal`. Les fonctions de qualification et de manifeste ajoutées sont `sourceValeurAjoutee`, `resumeSourceVAZener`, `manifesteRunColumns` et `manifesteRunRows`.

Les fonctions métier modifiées sont `planifierAvecEchelle`, `declencherProductionAutonome`, `analyserStockCommandeOrchestree`, `finaliserReceptionClientDirecte`, `enregistrerFinCommandeGlobale`, `tempsAttenteGlobalCoherent` et la branche de clôture de `REAPPRO_*` dans `finDeParcours`.

Les fonctions de preuve modifiées sont `kpiParPosteColumns`, `kpiParPosteRows`, `dashboardMicroColumns`, `dashboardMicroRows`, `dashboardGlobalColumns`, `dashboardGlobalRows`, `pceGlobalText`, `kpiLogisticsText`, `tableDashboardMacroSCORText`, `tableDashboardGlobalText`, `getRapportVSM`, `exporterCSV`, `exporterToutesLesTablesExcel`, `exporterABoxRuntimeTTL`, `aboxDirectVSMIndicatorForMetric`, `valeurRuntimeMetriqueSCOR`, `sourceFormuleMetriqueSCOR` et `calculerPIGlobal`.

Le patch porte ainsi sur 40 fonctions distinctes, dont 15 fonctions ajoutées et 25 fonctions existantes modifiées.

## Nouveaux champs de CommandeAgent

`dureeTraitementClientReelleSec` conserve le traitement métier propre à la commande. `dureeAttenteStockReelleSec` conserve l'attente imputée. `dureeReapproImputeeReelleSec` isole la part provenant des ordres internes. `leadTimeClientReelSec` conserve leur somme finale. `tDebutAttenteStock`, `tFinAttenteStock` et `attenteStockOuverte` tracent l'état runtime.

`commandesClientesCouvertes` est la collection portée par un ordre `REAPPRO_*`. `ordresReapproLies` et `ordresReapproImputes` sont portés par la commande cliente. La dernière collection empêche une seconde imputation lors d'un réveil répété.

`dureeReelleAccumulee` est conservée sans changement de rôle pour la compatibilité et le diagnostic historique.

## Liaison CMD et REAPPRO

Une commande qui constate pour la première fois un stock insuffisant ouvre son segment d'attente. Elle est liée à l'ordre actif compatible, s'il existe. Lorsqu'un nouvel ordre autonome est créé, il collecte les identifiants des commandes clientes en attente portant sur le même scénario produit.

À la fin de l'ordre interne, sa durée métier cumulée, incluant Source et Make, est imputée une seule fois à chaque commande couverte. L'ABox exporte l'extension runtime `run:contributesToCustomerOrderFulfillment` et sa relation inverse `run:dependsOnInternalReplenishmentOrder`.

Le premier ordre imputé ferme l'attente et fixe `tFinAttenteStock`. La collection `ordresReapproImputes` bloque toute seconde imputation du même ordre. Un retry `ANALYSE_STOCK` qui arrive pendant Deliver ou après la clôture est ignoré, ce qui empêche une réouverture de l'attente et une nouvelle action de stock.

## Changements Excel

`Dashboard Global` distingue désormais Order Processing Time, Order Waiting / Dwell Time, Order Fulfillment Lead Time, ZENER Process Time, ZENER Waiting Time et ZENER Estimated PCE. `Dashboard Micro` et `KPI par Poste` indiquent le taux VA et `VA_SOURCE`, avec les valeurs `CONFIGUREE` ou `FALLBACK`. Le CSV laisse le champ PCE vide pour `GLOBAL_ORDER` et réserve sa valeur au périmètre `VSM_ZENER`.

La feuille `Manifeste Run` contient le `runId`, le scénario, la quantité fixe, le nombre de commandes, `simToRealSeconds`, les paramètres du retard fournisseur, l'état d'accès à la graine, l'instant de clôture, le nom du preset JSON et le nom du modèle candidate.

## Changements ABox

Les individus temporels de commande sont `vsm_order_processing_time`, `vsm_order_waiting_time` et `vsm_order_fulfillment_lead_time`. Les individus VSM focalisés sont `vsm_zener_process_time`, `vsm_zener_waiting_time` et `vsm_zener_estimated_pce`. Ils utilisent des contextes séparés pour `CUSTOMER_ORDER_CMD_ONLY` et `ZENER_ACT_4_ONLY`.

Les commandes clientes exposent `run:orderProcessingTimeSeconds`, `run:orderWaitingTimeSeconds`, `run:orderFulfillmentLeadTimeSeconds`, `run:replenishmentImputedTimeSeconds`, `run:stockWaitStartedAtSimulationSecond` et `run:stockWaitEndedAtSimulationSecond`. Les ordres internes exposent `run:replenishmentBusinessDurationSeconds`. Le `SimulationRun` reçoit le manifeste minimal, notamment `run:runId` et `run:closureTimestamp`. Les micro-activités indiquent le taux VA, sa source et la nature `ESTIMATED`.

## Changements Responsiveness

`RS.1.1` lit `orderFulfillmentLeadTimeGlobal()`. `RS.3.94` lit `orderWaitingTimeGlobal()`. Les mêmes fonctions alimentent le Dashboard Global et les individus ABox associés. Les bornes, poids, profils de normalisation et autres métriques RS ne sont pas modifiés.

## Comportements volontairement inchangés

La séparation `CMD_*` et `REAPPRO_*`, la politique autonome de stock, Source avant Make, le crédit M1.5, le réveil de la commande, le décrément du stock, la perturbation fournisseur, les six messages, AHP, Return, les métriques macro Source, Make et Deliver, ainsi que les exports Excel et ABox sont conservés. La garde ISA-95 reste fixée à 190 noeuds et 71 affectations.

## Risques de régression

Un ordre interne partagé par plusieurs commandes impute sa durée complète à chaque commande qui en dépend. Cette convention décrit le délai subi par chaque commande, mais elle ne doit pas être additionnée entre commandes pour estimer une charge d'atelier. La liaison cesse lorsque la quantité totale des commandes déjà couvertes atteint la quantité du `REAPPRO_*`. Une future gestion de couverture partielle par quantité nécessitera un registre d'allocation plus fin. Plusieurs reconstitutions successives pour une même commande doivent aussi être vérifiées afin de confirmer que chaque identifiant n'est imputé qu'une fois.

La disponibilité de la graine aléatoire n'est pas exposée dans `Main`; le manifeste porte donc `NON_ACCESSIBLE_DANS_MAIN`. Le nom du preset JSON est disponible, mais son SHA n'est pas calculé dans AnyLogic. Les taux VA restent non calibrés.

## Validation statique finale

Le parsing XML réussit. La candidate contient 89 classes d'agents, 334 fonctions XML, 259 variables et 18 classes Java. Elle ajoute 10 variables et 10 identifiants par rapport à la baseline. Aucun identifiant XML, nom de variable dans une même classe d'agent ou nom de fonction XML n'est dupliqué. Les accolades et parenthèses des blocs modifiés sont équilibrées par contrôle lexical simple. Les nouvelles collections utilisent des types `java.util` pleinement qualifiés et ne nécessitent pas d'import supplémentaire.

Les appels ajoutés correspondent aux signatures définies. La garde ISA-95 de 190 noeuds et 71 affectations reste présente. La constante de PCE global artificiel et les appels de présentation à `kpiGlobal.pce()` sont absents. `tempsAttenteGlobalCoherent()` est un wrapper direct de l'attente de commande. Ces contrôles statiques ont été complétés par une construction et une exécution réussies dans AnyLogic. Le statut est `BUILD_ET_RUN_ANYLOGIC_VALIDES` pour le run `RUN_1773129600000_1788264883846`.

## Critères du run de validation

Le run doit conserver une commande `CMD_1` de 20 unités, un stock produit fini nul, un stock GPL nul, 250 bouteilles, 300 accessoires et le retard de la première réception GPL de 6 h à 12 h. Il est accepté si `REAPPRO_1` est explicitement lié à `CMD_1`, si les trois temps de commande vérifient leur identité additive, si les indicateurs ZENER proviennent de `kpiZener`, si Excel et ABox concordent et si `RS.1.1` et `RS.3.94` agrègent les nouveaux individus correspondants.
