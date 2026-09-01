# Implémentation de la correction temporelle VSM candidate

## Périmètre et statut

La correction est appliquée uniquement à `sources/model/SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp`. La baseline `SCONTO_SVU_FINAL.alp`, qui a produit les preuves du Run B, reste inchangée. La validation effectuée dans ce dépôt est statique. Le statut de compilation du modèle est `BUILD_ANYLOGIC_A_FAIRE`.

L'empreinte SHA-256 de la candidate est `97FB77235EAD717BF2AB9ABA30C924AC5D58BC94DE01AB465CE7D9889DED7364`.

## Problème initial

Le registre global des commandes utilisait une durée partielle propre à `CMD_1`, sans la reconstitution portée par `REAPPRO_1`. L'attente Excel était reconstruite à partir du Lead Time et d'un PCE imposé à 65 pour cent, tandis que l'ABox exportait une attente nulle. Le PCE de commande était ainsi confondu avec le PCE VSM de ZENER. Cette divergence affectait `RS.1.1`, `RS.3.94`, Responsiveness et le PI.

## Définition retenue

Le périmètre commande cliente contient uniquement les objets `CMD_*`. Son Lead Time métier est la somme de la durée active propre à la commande et de l'attente de reconstitution explicitement imputée depuis les ordres internes liés. Son Waiting Time est cette attente explicite. Le Processing Time est le Lead Time diminué du Waiting Time. Les trois valeurs sont alimentées ensemble dans `kpiGlobal` et vérifient l'identité additive à la précision numérique près.

Le périmètre VSM ZENER contient les observations `ACT_4` consolidées dans `kpiZener`. Son PCE estimé est la valeur ajoutée estimée divisée par la somme du traitement et de l'attente du même périmètre. Les taux VA configurés et les fallbacks existants sont conservés. Ils ne sont pas présentés comme des observations directes.

## Fonctions modifiées ou ajoutées

Les fonctions de liaison et de registre ajoutées sont `estOrdreReappro`, `ouvrirAttenteStockCommande`, `quantiteClientsCouverts`, `lierCommandeEtReappro`, `lierCommandeAuReapproActif`, `lierReapproAuxCommandesClientesEnAttente`, `finaliserDependanceReappro`, `actualiserRegistreTempsCommande`, `orderProcessingTimeGlobal`, `orderWaitingTimeGlobal` et `orderFulfillmentLeadTimeGlobal`. Les fonctions de qualification et de manifeste ajoutées sont `sourceValeurAjoutee`, `resumeSourceVAZener`, `manifesteRunColumns` et `manifesteRunRows`.

Les fonctions métier modifiées sont `planifierAvecEchelle`, `declencherProductionAutonome`, `analyserStockCommandeOrchestree`, `finaliserReceptionClientDirecte`, `enregistrerFinCommandeGlobale`, `tempsAttenteGlobalCoherent` et la branche de clôture de `REAPPRO_*` dans `finDeParcours`.

Les fonctions de preuve modifiées sont `kpiParPosteColumns`, `kpiParPosteRows`, `dashboardMicroColumns`, `dashboardMicroRows`, `dashboardGlobalColumns`, `dashboardGlobalRows`, `pceGlobalText`, `kpiLogisticsText`, `tableDashboardMacroSCORText`, `tableDashboardGlobalText`, `getRapportVSM`, `exporterCSV`, `exporterToutesLesTablesExcel`, `exporterABoxRuntimeTTL`, `aboxDirectVSMIndicatorForMetric`, `valeurRuntimeMetriqueSCOR`, `sourceFormuleMetriqueSCOR` et `calculerPIGlobal`.

## Nouveaux champs de CommandeAgent

`dureeTraitementClientReelleSec` conserve le traitement métier propre à la commande. `dureeAttenteStockReelleSec` conserve l'attente imputée. `dureeReapproImputeeReelleSec` isole la part provenant des ordres internes. `leadTimeClientReelSec` conserve leur somme finale. `tDebutAttenteStock`, `tFinAttenteStock` et `attenteStockOuverte` tracent l'état runtime.

`commandesClientesCouvertes` est la collection portée par un ordre `REAPPRO_*`. `ordresReapproLies` et `ordresReapproImputes` sont portés par la commande cliente. La dernière collection empêche une seconde imputation lors d'un réveil répété.

`dureeReelleAccumulee` est conservée sans changement de rôle pour la compatibilité et le diagnostic historique.

## Liaison CMD et REAPPRO

Une commande qui constate pour la première fois un stock insuffisant ouvre son segment d'attente. Elle est liée à l'ordre actif compatible, s'il existe. Lorsqu'un nouvel ordre autonome est créé, il collecte les identifiants des commandes clientes en attente portant sur le même scénario produit.

À la fin de l'ordre interne, sa durée métier cumulée, incluant Source et Make, est imputée une seule fois à chaque commande couverte. L'ABox exporte l'extension runtime `run:contributesToCustomerOrderFulfillment` et sa relation inverse `run:dependsOnInternalReplenishmentOrder`.

## Changements Excel

`Dashboard Global` distingue désormais Order Processing Time, Order Waiting / Dwell Time, Order Fulfillment Lead Time, ZENER Process Time, ZENER Waiting Time et ZENER PCE estimé. `Dashboard Micro` et `KPI par Poste` indiquent le taux VA et `VA_SOURCE`, avec les valeurs `CONFIGUREE` ou `FALLBACK`.

La feuille `Manifeste Run` contient le `runId`, le scénario, la quantité fixe, le nombre de commandes, `simToRealSeconds`, les paramètres du retard fournisseur, l'état d'accès à la graine, l'instant de clôture, le nom du preset JSON et le nom du modèle candidate.

## Changements ABox

Les individus temporels de commande sont `vsm_order_processing_time`, `vsm_order_waiting_time` et `vsm_order_fulfillment_lead_time`. Les individus VSM focalisés sont `vsm_zener_process_time`, `vsm_zener_waiting_time` et `vsm_zener_estimated_pce`. Ils utilisent des contextes séparés pour `CUSTOMER_ORDER_CMD_ONLY` et `ZENER_ACT_4_ONLY`.

Les ordres exposent leurs durées propres, leurs instants d'attente et leurs relations runtime. Le `SimulationRun` reçoit le manifeste minimal. Les micro-activités indiquent le taux VA, sa source et la nature `ESTIMATED`.

## Changements Responsiveness

`RS.1.1` lit `orderFulfillmentLeadTimeGlobal()`. `RS.3.94` lit `orderWaitingTimeGlobal()`. Les mêmes fonctions alimentent le Dashboard Global et les individus ABox associés. Les bornes, poids, profils de normalisation et autres métriques RS ne sont pas modifiés.

## Comportements volontairement inchangés

La séparation `CMD_*` et `REAPPRO_*`, la politique autonome de stock, Source avant Make, le crédit M1.5, le réveil de la commande, le décrément du stock, la perturbation fournisseur, les six messages, AHP, Return, les métriques macro Source, Make et Deliver, ainsi que les exports Excel et ABox sont conservés. La garde ISA-95 reste fixée à 190 noeuds et 71 affectations.

## Risques de régression

Un ordre interne partagé par plusieurs commandes impute sa durée complète à chaque commande qui en dépend. Cette convention décrit le délai subi par chaque commande, mais elle ne doit pas être additionnée entre commandes pour estimer une charge d'atelier. La liaison cesse lorsque la quantité totale des commandes déjà couvertes atteint la quantité du `REAPPRO_*`. Une future gestion de couverture partielle par quantité nécessitera un registre d'allocation plus fin. Plusieurs reconstitutions successives pour une même commande doivent aussi être vérifiées afin de confirmer que chaque identifiant n'est imputé qu'une fois.

La disponibilité de la graine aléatoire n'est pas exposée dans `Main`; le manifeste porte donc `NON_ACCESSIBLE_DANS_MAIN`. Le nom du preset JSON est disponible, mais son SHA n'est pas calculé dans AnyLogic. Les taux VA restent non calibrés. La candidate doit être ouverte et construite dans AnyLogic avant tout run.

## Critères du run de validation

Le run doit conserver une commande `CMD_1` de 20 unités, un stock produit fini nul, un stock GPL nul, 250 bouteilles, 300 accessoires et le retard de la première réception GPL de 6 h à 12 h. Il est accepté si `REAPPRO_1` est explicitement lié à `CMD_1`, si les trois temps de commande vérifient leur identité additive, si les indicateurs ZENER proviennent de `kpiZener`, si Excel et ABox concordent et si `RS.1.1` et `RS.3.94` agrègent les nouveaux individus correspondants.
