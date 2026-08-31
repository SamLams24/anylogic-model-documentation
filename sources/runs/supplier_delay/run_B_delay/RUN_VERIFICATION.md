# Vérification du Run B, retard fournisseur

## Identification des artefacts

| Artefact | Nature | SHA-256 | Scénario | runId | Chapitres autorisés |
|:--|:--|:--|:--|:--|:--|
| `results.xlsx` | Classeur Excel runtime, 24 feuilles | `906BB035976A1A679C1161D1CE123F3A09E75E7A98D77CB31548A18369EFA968` | Cas 3, approvisionnement puis production; produit `SCENARIO DISTRIBUTION` | `RUN_1773129600000_1788030213308` | 4 à 8 et annexes |
| `abox.ttl` | ABox RDF Turtle | `0B4446B8B249B338E4A334E8696C19D2D72D1E25DB531410B9588B5934970291` | ZENER SA Togo, clôture de `CMD_1` après perturbation GPL | `RUN_1773129600000_1788030213308` | 3 à 8 et annexe E |

## Valeurs retenues dans Excel

| Indicateur | Valeur | Unité | Feuille | Cellule ou ligne logique | Interprétation autorisée |
|:--|:--|:--|:--|:--|:--|
| Commandes clientes | 1 | commande | Performance par produit | B2 | Une commande cliente a été exécutée. |
| Quantité commandée et livrée | 20 et 20 | unités | Performance par produit | C2 et D2 | La commande est livrée en totalité. |
| Commandes en retard | 1 | commande | Performance par produit | E2 | La commande close est en retard. |
| Ordre autonome | `REAPPRO_1` | identifiant | Validation C13-C14 | ligne 3 | Le run distingue un ordre stock d'une commande cliente. |
| GPL commandé | 250 | unités de matière | Execution Brute | lignes 4 à 19, notamment I5 | Une seule quantité de 250 traverse les étapes Source; elle ne doit pas être additionnée à chaque poste. |
| GPL reçu | 250 | unités de matière | Propagation agents et flux | ligne 42 | La réception crédite le stock GPL à 250 avant consommation Make. |
| Stock GPL final | 0 | unité de matière | Multi-produit ZENER | C2 | Le stock affiché à la clôture est nul après consommation du lot. |
| Stock produit fini final | 0 | unité | Performance par produit | F2 | Le lot produit a été livré. |
| Délai GPL nominal et effectif | 6 et 12 | h | Propagation agents et flux | G36 | Le retard injecté sur le GPL vaut 6 h. |
| Approvisionnements retardés et retard cumulé | 1 et 6 | nombre et h | Dashboard Global | P2 | Un approvisionnement retardé est comptabilisé. |
| Dernière perturbation | GPL vrac, `ACT_1`, retard 6 | h | Dashboard Global | Q2 | Le fournisseur GPL est le dernier acteur perturbé. |
| Jalons Source | ordre T=57, réception T=130 | s de simulation | Flux Supply Chain; Propagation agents et flux | lignes 3 et 42 | Source précède Make. |
| Jalons Make | début T=132, fin du lot T=1966,9 | s de simulation | Execution Brute; Propagation agents et flux | ligne 20; ligne 69 | Make commence après disponibilité matière. |
| Jalons Deliver | départ T=1975, clôture T=1990 | s de simulation | Flux Supply Chain; Execution Brute | lignes 4 et 5; ligne 768 | Deliver suit la reconstitution du stock. |
| Lead Time exporté | 15 018,853 | s reconstruites | Pipeline SCOR vers PI | D9 | Valeur calculée par le modèle, distincte de l'écart brut entre T=53 et T=1990. |
| Commandes livrées complètes | 1 | ratio 0 à 1 | Pipeline SCOR vers PI | D2 | Taux de remplissage complet de 100 % sur une seule commande. |
| Commandes livrées à temps | 0 | ratio 0 à 1 | Pipeline SCOR vers PI | D3 | Taux de ponctualité nul sur une seule commande. |
| Process Time global | 15 018,85 | s | Dashboard Global | C2 | Valeur agrégée exportée par le classeur. |
| Waiting Time global | 5 256,60 | s | Dashboard Global | D2 | Valeur Excel non concordante avec l'ABox, donc à ne pas publier comme valeur croisée. |
| PCE global | 65,0 | % | Dashboard Global | F2 | Efficacité globale exportée, avec la même réserve de cohérence temporelle. |
| KPI Source | 6 entités; cycle 1,601 | nombre et s | Dashboard Macro | ligne 3 | Activité Source du run. |
| KPI Make | 181 entités; cycle 24,529; attente 82,32 | nombre et s | Dashboard Macro | ligne 5 | Agrégats Make, pas nombre d'unités produites. |
| KPI Deliver | 15 entités; cycle 73,099 | nombre et s | Dashboard Macro | ligne 2 | Agrégats Deliver, pas nombre de commandes. |
| PI | 6,227 | score sur 10 | Dashboard Global | K2 | Score calculé avec les bornes et poids de cette configuration. |
| Attributs RL, RS, AG, CO, AM | Pipeline détaillé disponible | score sur 10 | Pipeline SCOR vers PI | lignes 2 à 18 | Les valeurs brutes, scores et contributions doivent rester distingués. |
| Motif de clôture | `ORDER_CLOSED_CMD_1` | texte | Decisions Holoniques | ligne 31 | Le snapshot est déclenché par la clôture de la commande cliente. |

Les stocks initiaux ne sont pas exposés dans une cellule Excel dédiée. Ils sont lus dans le JSON de configuration et ne sont pas attribués au classeur.

## ABox

L'analyse porte sur les sujets, types RDF et propriétés qui relient les individus. Elle ne repose pas sur un simple comptage d'occurrences textuelles.

| Elément | Preuve RDF structurée | Résultat |
|:--|:--|:--|
| Run | `run:simulationRun_RUN_1773129600000_1788030213308` de type `run:SimulationRun` | Identité du run confirmée |
| Contexte | label ZENER SA Togo, réseau `run:network_ZENER_SA_Togo`, portée `SCONTO_SVU_GLOBAL_RUNTIME` | Contexte compatible avec Excel |
| `CMD_1` | `run:order_CMD_1` de type `core:CustomerOrder`, origine `CUSTOMER`, quantité 20, statut `EN_RETARD` | Commande cliente structurée |
| `REAPPRO_1` | `run:order_REAPPRO_1` de type `run:InternalStockReplenishmentOrder`, origine `STOCK_AUTONOMOUS`, quantité 20 | Ordre autonome structuré |
| Alerte fournisseur | `run:aerMessage_N_35`, type `aer:AERMessage` et `aer:ReportingMessage`, sujet `SupplierDelayAlert`, lié à `REAPPRO_1` | Alerte structurée, Source |
| Incident et déviation | Messages N_36 et N_37, sujets `OperationalException` et `ProcessDeviationReport`, liés à `REAPPRO_1` | Propagation Source structurée |
| Révision matière | Message N_38, sujet `RevisedMaterialAvailability`, de `AT-sP2` à `AT-sP3` | Passage Source vers Make structuré |
| Révision production | Message N_39, sujet `RevisedProductionCompletionDate`, de `AT-sP3` à `AT-sP4` | Impact transmis vers Deliver |
| Révision livraison | Message N_40, type `aer:AmendmentMessage`, sujet `RevisedDeliveryPlan`, de `AT-sP4` à `CA-sD1` | Plan Deliver révisé |
| Clôture | `run:event_N_767` de type `core:RawEvent`, type métier `COMMANDE_CLOSE`, lié à `run:order_CMD_1` | Clôture structurée de la commande |
| Instant de clôture | `run:simulationTimeSeconds = 1990`; événement de clôture horodaté `2026-03-23T19:17:30` | Compatible avec T=1990 dans Excel |
| ISA-95 | 190 sujets `run:eq_*` typés comme équipement et 71 sujets `run:micro_*` liés par `core:executedAt` | Baseline 190 et 71 confirmée dans l'ABox |

## Synchronisation des preuves

`EXCEL_RUN_ID = RUN_1773129600000_1788030213308`

`ABOX_RUN_ID = RUN_1773129600000_1788030213308`

`MATCH = OUI`

| Contrôle | Excel | ABox | Compatibilité |
|:--|:--|:--|:--|
| Identité de run | Nom des fichiers référencés dans Synthèse C14 et Validation C13-C14 | IRI du `SimulationRun` et espace de noms runtime | OUI |
| Scénario | Cas 3, `SCENARIO DISTRIBUTION`, `CMD_1`, `REAPPRO_1` | ZENER SA Togo, mêmes ordres et mêmes quantités | OUI |
| Clôture | T=1990 s, `COMMANDE_CLOSE`, motif `ORDER_CLOSED_CMD_1` | T=1990 s, événement `COMMANDE_CLOSE`, même motif | OUI |
| Retard fournisseur | GPL, `ACT_1`, 6 h nominales, 12 h effectives | Même charge utile dans les messages N_35 à N_40 | OUI |
| Waiting Time global | 5 256,598 s | 0 s dans `run:vsm_wait_global` | NON |

La paire peut soutenir le statut `VALIDE_EXPERIMENTALEMENT` pour l'identité du run, la commande de 20 unités, l'ordre autonome, la chaîne Source puis Make puis Deliver, le retard GPL de 6 h et les six messages de propagation. La divergence du Waiting Time interdit une validation croisée de cette valeur et impose une décision avant sa publication.
