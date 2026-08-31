# Extraction du document de base

> Source de travail extraite du DOCX fourni. Ne pas citer ce fichier comme source scientifique. Les données runtime doivent être vérifiées dans les exports Excel/ABox correspondants.

## SCONTO-SVU

Traçabilité décisionnelle et performanced’une chaîne logistique simulée

Analyse détaillée d’une exécution en situation d’indisponibilité initialedu produit fini et des matières premières

| Objet du documentRelier de façon vérifiable les événements d’une exécution AnyLogic, les agents impliqués, les communications AER, les actions opérationnelles, les mesures VSM, les métriques SCOR et leur agrégation jusqu’au Performance Index global. |

| --- |



Août 2026

Table des matières

Liste des figures et illustrations3

Liste des tableaux structurants4

Résumé exécutif4

## 1. Introduction et objet de l’analyse5

## 2. Situation initiale et périmètre de l’exécution6

## 3. Architecture des acteurs et agents effectivement mobilisés7

## 4. Déclinaison des objectifs du niveau global jusqu’à l’exécution9

## 5. Chronologie détaillée de l’exécution12

## 6. Analyse des décisions et communications inter-agents15

## 7. Boucle holonique de gestion des écarts et goulots16

## 8. Analyse VSM de l’exécution18

## 9. Passage des observations VSM aux métriques SCOR20

## 10. Agrégation RL / RS / AG / CO / AM21

## 11. Construction et interprétation du Performance Index23

## 12. Matrice de traçabilité intégrale24

## 13. Synthèse transversale des contributions agent–processus–performance26

## 14. Résultats intégrés et lecture causale de l’exécution27

## 15. Limites de lecture et précautions méthodologiques28

## 16. Discussion académique et lecture intégrée des mécanismes observés29

## 17. Traçabilité détaillée agent par agent35

## 18. Conclusion51

### Annexe A. Tableau chronologique des 66 communications52

### Annexe B. Emplacements de captures et illustrations à compléter54

### Annexe C. Boucle AER complète observée et preuves hiérarchiques55

### Annexe D. Matrice complète VSM → SCOR → attributs → PI56

### Annexe E. Micro-activités observées et KPI structurants58

Liste des figures et illustrations

| Repère | Intitulé : contenu attendu |

| --- | --- |

| Figure 2.1 | Vue globale au démarrage : réseau et stocks initiaux. |

| Figure 2.2 | Réseau Supply Chain : fournisseurs – ZENER – client. |

| Figure 3.1 | Hiérarchie holonique des agents mobilisés. |

| Figure 4.1 | Déclinaison descendante des objectifs. |

| Figure 4.2 | Boucle descendante des objectifs / boucle montante de reporting. |

| Figure 5.1 | Constat de rupture du stock de produit fini. |

| Figure 5.2 | Approvisionnement des trois matières. |

| Figure 5.3 | Production active et carrousel GPL. |

| Figure 5.4 | Livraison finale et réception client. |

| Figure 5.5 | Frise chronologique de l’exécution complète. |

| Figure 6.1 | Table de propagation des agents. |

| Figure 7.1 | Décision holonique de rééquilibrage. |

| Figure 7.2 | Détection du goulot Make. |

| Figure 7.3 | Blackboard et propagation AER de l’incident Make. |

| Figure 8.1 | Dashboard Macro / Global. |

| Figure 8.2 | Comparaison des deux unités sur les postes critiques. |

| Figure 9.1 | Pipeline SCOR vers PI. |

| Figure 11.1 | Performance Index final. |

| Figure 11.2 | Vecteur fuzzy global et contribution des cinq attributs. |

| Figure 16.1 | Chaîne de qualification de la commande. |

| Figure 16.2 | Disponibilité matière lors du diagnostic Make. |

| Figure 16.3 | Passage Source vers Make. |

| Figure 16.4 | Vue Make : carrousel et goulot. |

| Figure 16.5 | Boucle AER complète de l’incident Make. |



| Repère | Intitulé / contenu attendu |

| --- | --- |

| Figure 17.1 | Volume de communications par agent interne. |

| Figure 17.2 | Fenêtres d’intervention des agents. |

| Figure 17.3 | Vue holonique pendant l’exécution. |

| Figure 17.4 | Vue Deliver au moment de la livraison finale. |

| Figure 17.5 | Audit AER : chaîne locale complète. |



Liste des tableaux structurants

| Localisation | Tableau / rôle analytique |

| --- | --- |

| Résumé exécutif | Indicateurs de synthèse de l’exécution. |

| Section 2.1 | Commande, stocks initiaux et conséquences opérationnelles. |

| Section 3.1 | Agents effectivement mobilisés et participation observée. |

| Section 5.8 | Chronologie décisionnelle condensée. |

| Section 6.1 | Répartition des communications par phase AER. |

| Section 7.1 | Chaîne AER complète panne → arbitrage → ACK. |

| Section 8.1 | KPI VSM par macro-processus. |

| Section 8.2 | Postes Make structurants et temps observés. |

| Section 9.1 | Provenance des métriques SCOR utilisées. |

| Section 10 | Scores RL / RS / AG / CO / AM. |

| Section 12.1 | Matrice objectif → décision → preuve → performance. |

| Section 13.1 | Typologie consolidée des contributions des agents. |

| Section 14.1 | Résultats de bout en bout. |

| Section 17.21 | Matrice reçoit → transforme → transmet. |

| Annexe A | 66 communications ordonnées de la commande. |

| Annexe C | 13 étapes locales de la boucle AER observée. |

| Annexe D | Matrice VSM → SCOR → attributs → PI. |

| Annexe E | Micro-activités observées et KPI structurants. |



Résumé exécutif

L’exécution analysée part d’une situation simple mais exigeante : une commande client de deux unités doit être satisfaite alors que le stock de produit fini est nul et que les trois familles de matières nécessaires à la fabrication sont également indisponibles. La simulation doit donc identifier l’impossibilité de livrer directement, vérifier la faisabilité Make, déclencher Source, rétablir les matières, produire, livrer puis consolider la performance de bout en bout.

L’exécution démontre simultanément trois phénomènes : une chaîne métier Source → Make → Deliver entièrement traçable ; une architecture multi-agents qui décline les objectifs du tactique jusqu’à l’exécution puis remonte les preuves vers le stratégique ; et une chaîne de mesure qui transforme les événements runtime en indicateurs VSM, métriques SCOR, attributs RL/RS/AG/CO/AM puis en Performance Index.

| Indicateur de synthèse | Valeur observée | Lecture |

| --- | --- | --- |

| Commande | 1 commande / 2 unités | Une trajectoire unique, donc facilement auditable. |

| Stocks initiaux | Produit fini = 0 ; GPL = 0 ; bouteilles = 0 ; accessoires = 0 | Source et Make sont nécessaires avant Deliver. |

| Fenêtre principale | T=27,0 s → T=399,1 s | De CustomerOrder à la livraison et au reporting final. |

| Lead Time | 372,05 s | Commande clôturée en retard. |

| Phase dominante | Make ≈ 333,1 s entre ExecutionStart et fin de production | Chemin temporel critique de l’exécution. |

| Reliability | 7,500 / 10 | Commande complète et exacte, mais ponctualité nulle. |

| Responsiveness | 9,844 / 10 | Durées favorables relativement aux bornes de normalisation. |

| Agility | 5,145 / 10 | Attribut le plus faible, notamment sous l’effet du faible débit. |

| Cost | 8,724 / 10 | Ratio coût/chiffre d’affaires favorable dans la configuration courante. |

| Asset Management | 9,706 / 10 | Bonne disponibilité/gestion des actifs selon les métriques de l’exécution. |

| Performance Index | 8,248 / 10 | Agrégat multicritère ; ne signifie pas absence de retard. |

| Lecture centrale : Le résultat n’est ni un « succès » ni un « échec » unidimensionnel : la commande est physiquement satisfaite et exacte, la coordination adaptative fonctionne, mais la promesse temporelle n’est pas respectée. Le PI doit être interprété comme un agrégat multicritère contextualisé par ses bornes Bottom/Perfect. |  |  |



## 1. Introduction et objet de l’analyse

### 1.1 Finalité

Le présent document analyse une exécution réelle du simulateur SCONTO-SVU dans laquelle une commande client doit être satisfaite alors que l’entreprise focale ne dispose initialement ni du produit fini demandé ni des matières nécessaires à sa fabrication. L’objectif n’est pas de décrire de manière abstraite le modèle, mais de reconstruire ce qui s’est effectivement produit et d’en proposer une interprétation traçable.

Chaque affirmation opérationnelle est rattachée à une preuve observable dans l’export runtime : communication inter-agents, flux physique, trace d’exécution, KPI de poste, agrégation macro, métrique SCOR ou ligne du pipeline de performance.

| Principe directeurQue s’est-il passé ? Qui l’a décidé ou exécuté ? Quelle trace a été produite ? Quelle mesure en résulte ? Comment cette mesure contribue-t-elle à la performance globale ? |

| --- |



### 1.2 Sources de preuve utilisées

| Source | Identifiant | Utilisation dans l’analyse |

| --- | --- | --- |

| Export Excel de clôture | SCONTO_SVU_RESULTS_ZENER_SA_Togo_RUN_1773129600000_1787078140245.xlsx | 24 feuilles actives ; source quantitative principale |

| ABox associée | SCONTO_SVU_ABOX_ZENER_SA_Togo_RUN_1773129600000_1787078140245.ttl | Même runId ; export au même instant de clôture |

| Feuilles runtime principales | Propagation agents et flux ; Execution Brute ; Dashboard ; Pipeline SCOR vers PI ; Audit propagation AER | Chronologie, agents, mesures et performance |



### 1.3 Règles d’interprétation

La chronologie métier est reconstruite d’abord à partir de la feuille « Propagation agents et flux », car elle contient les numéros de séquence, les émetteurs, les destinataires, les phases AER et les preuves de réception.

Les mesures physiques sont ensuite lues dans « Execution Brute », « KPI par Poste », « Dashboard Micro/Macro/Global » et les traces agrégées.

Les métriques SCOR et leur contribution au PI sont interprétées uniquement à partir du pipeline exporté. Une valeur informative marquée hors score n’est pas présentée comme contributive.

Lorsque plusieurs événements partagent le même temps simulé, l’ordre logique est déterminé par le numéro de séquence et non par le timestamp seul.

Les étiquettes internes de configuration ne sont pas employées comme éléments d’explication ; l’analyse est fondée sur les faits runtime observés et sur leur ordre de propagation.

## 2. Situation initiale et périmètre de l’exécution

### 2.1 Demande client et état des stocks

À T=27,0 s, une commande de deux unités entre dans le système. La chaîne Deliver valide la demande puis interroge le stock. À T=36,0 s, la rupture de produit fini est formellement signalée. La faisabilité Make est alors étudiée et, à T=40,0 s, la capacité de production est déclarée disponible alors que les matières sont absentes.

| Élément | Besoin | État observé | Conséquence |

| --- | --- | --- | --- |

| Produit fini | Quantité demandée : 2 | Stock insuffisant | Déclenche une analyse Make |

| GPL vrac | Besoin : 25,0 | Disponible : 0,0 | Approvisionnement requis |

| Bouteilles vides 12 kg | Besoin : 2,0 | Disponible : 0,0 | Approvisionnement requis |

| Accessoires de conditionnement | Besoin : 2,0 | Disponible : 0,0 | Approvisionnement requis |



| FIGURE 2.1: Vue globale au démarrage de l’exécution |

| --- |



Emplacement réservé pour la Figure 2.1.

### 2.2 Réseau d’acteurs

| ID | Acteur | Catégorie | Rôle dans l’exécution |

| --- | --- | --- | --- |

| ACT_1 | Fournisseur du GPL | Fournisseur | GPL en vrac |

| ACT_2 | Fournisseur de bouteilles vides | Fournisseur | Bonbonnes vides |

| ACT_3 | Fournisseur des accessoires | Fournisseur | Capsules, valves, joints et consommables |

| ACT_4 | ZENER SA Togo | Entreprise focale | Réception, production, contrôle, stockage, expédition |

| ACT_5 | CLIENT GENERIQUE | Client | Destinataire de la commande |



| FIGURE 2.2 : Réseau Supply Chain de l’exécution |

| --- |



Emplacement réservé pour la Figure 2.2.

### 2.3 Flux physiques directement observés

| Temps | Type | Source → cible | Qté | Interprétation |

| --- | --- | --- | --- | --- |

| 27,0 s | Information commande | CLIENT GENERIQUE → ZENER SA Togo | 2 | Déclencheur métier |

| 40,0 s | Approvisionnement physique | Fournisseur du GPL → ZENER SA Togo | 25 | GPL vrac |

| 40,0 s | Approvisionnement physique | Fournisseur bouteilles → ZENER SA Togo | 2 | Bouteilles vides |

| 40,0 s | Approvisionnement physique | Fournisseur accessoires → ZENER SA Togo | 2 | Accessoires |

| 399,1 s | Livraison physique | ZENER SA Togo → CLIENT GENERIQUE | 2 | Lot produit |

| 399,1 s | Réception client | Réception → contrôle client | 2 | Clôture métier |



## 3. Architecture des acteurs et agents effectivement mobilisés

L’architecture runtime répartit la décision entre plusieurs niveaux. L’agent stratégique reçoit les résultats consolidés ; les agents tactiques coordonnent les domaines Source, Make et Deliver ; les coordinateurs transforment les orientations tactiques en ordres de domaine ; les agents de pilotage opérationnel supervisent l’exécution ; les agents AOe réalisent les tâches concrètes.

| Niveau | Agent(s) | Rôle observé |

| --- | --- | --- |

| Stratégique | AS-sP1 | Réception du MacroProcessReport final ; arbitrage global |

| Tactique | AT-sP2 | Plan Source ; disponibilité matière |

| Tactique | AT-sP3 | Plan Make ; faisabilité et production |

| Tactique | AT-sP4 | Plan Deliver ; engagement et livraison |

| Coordination | CA-sS1 | Source |

| Coordination | CA-sM1 | Make |

| Coordination | CA-sD1 | Deliver |

| Pilotage op. | AOp-sS1.1 | Approvisionnement et réception |

| Pilotage op. | AOp-sM1.1 | Production et gestion des écarts |

| Pilotage op. | AOp-sD1.1 / AOp-sD1.3 / AOp-sD1.7 | Validation, orchestration Deliver, reporting final |

| Exécution | AOe-* | Procurement, réception, Make, inventory, picking, packing, loading, transport |



| FIGURE 3.1 : Hiérarchie holonique des agents |

| --- |



Emplacement réservé pour la Figure 3.1.

### 3.1 Tableau des agents ayant effectivement participé

| Agent | Niveau | 1re intervention (s) | Dernière (s) | Msg émis | Msg reçus | Rôle observé |

| --- | --- | --- | --- | --- | --- | --- |

| AS-sP1 | Stratégique | 399,1 | 399,1 | 0 | 1 | Réception du MacroProcessReport final |

| AT-sP2 | Tactique Source | 40,0 | 60,0 | 4 | 3 | Faisabilité et plan d’approvisionnement |

| AT-sP3 | Tactique Make | 36,0 | 399,1 | 5 | 5 | Faisabilité, production, disponibilité produit |

| AT-sP4 | Tactique Deliver | 32,0 | 399,1 | 4 | 5 | Faisabilité, date promise, livraison |

| CA-sS1 | Coordination Source | 40,0 | 60,0 | 4 | 4 | Consultation, achat, clôture Source |

| CA-sM1 | Coordination Make | 40,0 | 399,1 | 4 | 4 | Contrôle puis production |

| CA-sD1 | Coordination Deliver | 32,0 | 399,1 | 5 | 4 | Faisabilité et consolidation Deliver |

| AOp-sS1.1 | Pilotage Source | 40,0 | 60,0 | 4 | 4 | Consultation et réception matière |

| AOp-sM1.1 | Pilotage Make | 40,0 | 399,1 | 5 | 8 | Contrôles, production, gestion des écarts |

| AOp-sD1.1 | Pilotage Deliver | 32,0 | 32,0 | 1 | 1 | Validation de commande |

| AOp-sD1.3 | Pilotage Deliver | 32,0 | 399,1 | 7 | 8 | Stock, confirmation, préparation et expédition |

| AOp-sD1.7 | Pilotage Deliver | 399,1 | 399,1 | 1 | 1 | Clôture opérationnelle Deliver |

| AOe-sS1.2 | Exécution Source | 40,0 | 40,0 | 3 | 3 | Consultation et commande fournisseur |

| AOe-sS1.3 | Exécution Source | 40,0 | 60,0 | 1 | 1 | Réception physique des matières |

| AOe-sM1.2 | Exécution Make | 40,0 | 66,0 | 3 | 3 | Capacité, matière, démarrage production |

| AOe-sM1.3 | Exécution Make | 309,1 | 399,1 | 3 | 0 | Progression et fin de production |

| AOe-sD1.2 | Exécution Deliver | 27,0 | 40,0 | 2 | 2 | Order Management |

| AOe-sD1.8 | Exécution Deliver | 32,0 | 399,1 | 2 | 2 | Inventory |

| AOe-sD1.9 | Exécution Deliver | 399,1 | 399,1 | 1 | 1 | Picking |

| AOe-sD1.10 | Exécution Deliver | 399,1 | 399,1 | 1 | 1 | Packing |

| AOe-sD1.11 | Exécution Deliver | 399,1 | 399,1 | 1 | 1 | Loading |

| AOe-sD1.12 | Exécution Deliver | 399,1 | 399,1 | 2 | 1 | Transport |

| SupplierActor | Externe | 40,0 | 40,0 | 2 | 2 | Engagement et livraison fournisseur |

| CustomerActor | Externe | 40,0 | 40,0 | 0 | 1 | Réception de la confirmation client |



## 4. Déclinaison des objectifs du niveau global jusqu’à l’exécution

L’objectif global porté par la commande est simple : livrer deux unités conformes au client. La simulation montre comment cet objectif est progressivement traduit en sous-objectifs, puis en tâches exécutables, sans sauter de niveau hiérarchique.

| Niveau / domaine | Objectif décliné | Responsable / chaîne |

| --- | --- | --- |

| Objectif global | Satisfaire la commande de 2 unités | Commande CMD_1 |

| Deliver tactique | Déterminer si la livraison est réalisable et construire la date promise | AT-sP4 |

| Make tactique | Vérifier la capacité de fabriquer les 2 unités | AT-sP3 |

| Make opérationnel | Vérifier capacité et matières | CA-sM1 → AOp-sM1.1 → AOe-sM1.2 |

| Source tactique | Obtenir les matières absentes | AT-sP2 |

| Source opérationnel | Consulter, acheter, recevoir et contrôler | CA-sS1 → AOp-sS1.1 → AOe-sS1.2/AOe-sS1.3 |

| Make exécution | Produire les deux unités | AOe-sM1.2 / AOe-sM1.3 + postes Make |

| Deliver exécution | Réserver, prélever, conditionner, charger et expédier | AOp-sD1.3 → AOe-sD1.8…12 |

| Reporting | Remonter les résultats jusqu’au stratégique | AOp → CA → AT → AS-sP1 |



| FIGURE 4.1 : Déclinaison descendante des objectifsContenu attendu : Capture de la vue holonique montrant la chaîne Strategic → Tactical → Coordinator → Pilotage opérationnel → Exécution. |

| --- |



Emplacement réservé pour la Figure 4.1.

| Lecture bidirectionnelleLe système fonctionne dans deux directions complémentaires : l’objectif descend vers l’exécution sous forme d’AMENDMENT / ordres ; les résultats remontent vers les niveaux supérieurs sous forme d’EXECUTION / REPORT. |

| --- |



### 4.1 Objectif global et critères de réussite observables

L’objectif global de l’exécution n’est pas défini comme une simple succession de tâches. Il est formulé comme une obligation de résultat : satisfaire une commande de deux unités alors que ni le produit fini ni les matières nécessaires ne sont disponibles au départ. Pour être traçable, cet objectif est décliné en critères observables : obtenir les matières, fabriquer la quantité requise, rendre le produit disponible pour Deliver, livrer deux unités et produire les rapports permettant au niveau supérieur d’évaluer le résultat.

| Niveau | Objectif / contrainte | Critère observable | Preuve runtime principale |

| --- | --- | --- | --- |

| Global | Satisfaire la demande client de 2 unités | Commande clôturée et quantité livrée = 2 | COMMANDE_CLOSE ; Flux Supply Chain |

| Deliver tactique | Construire une solution de livraison réalisable | Transmission d’une faisabilité, puis d’un DeliveryPlan | OrderFeasibilityRequest ; DeliveryPlan |

| Make tactique | Vérifier la possibilité de produire la quantité manquante | Capacité disponible et état matière connu | CapacityAvailabilityResponse ; MaterialShortageDetected |

| Source tactique | Rendre les matières disponibles à temps | Engagement fournisseur puis MaterialAvailable | SupplierCommitment ; MaterialAvailable |

| Make opérationnel | Fabriquer les 2 unités | ExecutionStart, progression 1/2 puis 2/2, ExecutionEnd | Execution Brute ; Propagation agents et flux |

| Deliver opérationnel | Préparer, expédier et confirmer la réception | InventoryReserved → Picking → Packing → Loading → DeliveryCompleted | Propagation agents et flux |

| Stratégique | Recevoir le bilan consolidé de la chaîne | MacroProcessReport reçu par AS-sP1 | Séquence 66 de la propagation |



### 4.2 Cascade décisionnelle : Deliver → Make → Source

La double indisponibilité provoque une cascade de décision inter-processus. Deliver détecte d’abord que la demande ne peut pas être satisfaite par le stock. Make vérifie ensuite si une fabrication est possible ; la capacité est jugée disponible, mais la matière manque. Le problème est alors transféré vers Source, qui consulte l’environnement fournisseur puis remonte une date de disponibilité. Cette réponse revient successivement vers Make puis Deliver afin de reconstruire une promesse réaliste.

| Seq. | Émetteur → destinataire | Message | Décision / objectif transféré |

| --- | --- | --- | --- |

| 7 | CA-sD1 → AT-sP4 | InventoryShortageReport | Rendre visible l’insuffisance du produit fini au niveau tactique Deliver. |

| 8 | AT-sP4 → AT-sP3 | OrderFeasibilityRequest | Demander si la quantité manquante peut être produite. |

| 10 | CA-sM1 → AOp-sM1.1 | CapacityAndMaterialCheckOrder | Décliner la question de faisabilité en deux contrôles opérationnels. |

| 13 | AOe-sM1.2 → AOp-sM1.1 | CapacityAvailabilityResponse | Établir que la capacité n’est pas le verrou principal. |

| 14 | AOe-sM1.2 → AOp-sM1.1 | MaterialShortageDetected | Identifier la matière comme contrainte bloquante. |

| 17 | AT-sP3 → AT-sP2 | MaterialAvailabilityRequest | Transformer la contrainte Make en objectif Source. |

| 21 | AOe-sS1.2 → SupplierActor | RequestForAvailability | Externaliser la demande de disponibilité au fournisseur. |

| 22 | SupplierActor → AOe-sS1.2 | SupplierCommitment | Rendre l’approvisionnement possible et daté. |

| 26 | AT-sP2 → AT-sP3 | MaterialAvailabilityResponse | Remonter la disponibilité vers Make. |

| 27 | AT-sP3 → AT-sP4 | MakeFeasibilityResponse | Remonter la date de fin prévisionnelle vers Deliver. |

| 28 | AT-sP4 → CA-sD1 | PromisedDeliveryDate | Recomposer une promesse client à partir des contraintes réelles. |



### 4.3 Du sous-objectif tactique à la tâche d’exécution

La déclinaison ne s’arrête pas aux échanges tactiques. Chaque objectif devient progressivement un plan, un ordre, puis une tâche exécutable. Le mécanisme est particulièrement visible dans Source et Make : le tactique formule l’intention, le coordinateur la contextualise, le pilotage opérationnel distribue le travail, puis l’agent d’exécution retourne un fait mesurable.

| Domaine | Intention tactique | Ordre de coordination | Instruction opérationnelle | Preuve d’exécution |

| --- | --- | --- | --- | --- |

| Source | ProcurementPlan | ProcurementOrder | PurchaseOrderTask / PurchaseOrder | InboundDelivery → MaterialReceived → ProcurementCompleted |

| Make | ProductionPlan | ProductionOrder | ProductionTaskAssignment | ExecutionStart → ExecutionProgress → ExecutionEnd |

| Deliver | DeliveryPlan | DeliveryOrder | DeliveryTaskAssignment puis Picking/Packing/Loading/Shipment | DeliveryCompleted → OperationalReport → ProcessStatusReport |



### 4.4 Boucle montante : du fait opérationnel au bilan stratégique

Le système ne se contente pas de descendre des objectifs. Il exige une remontée de preuve. Dans Source, la réception de matière devient OperationalReport puis ProcurementCompleted et MaterialAvailable. Dans Make, ExecutionEnd devient OperationalReport puis ProductionCompleted et ProductAvailableForDelivery. Dans Deliver, DeliveryCompleted devient OperationalReport puis ProcessStatusReport et enfin MacroProcessReport. Cette boucle ascendante garantit que le niveau supérieur ne reçoit pas une intention, mais un résultat consolidé.

| FIGURE 4.2: Boucle descendante objectifs / boucle montante reporting |

| --- |



## 5. Chronologie détaillée de l’exécution

| Temps | Phase | Messages clés | Interprétation |

| --- | --- | --- | --- |

| T=27,0 | Commande client | CustomerOrder | Entrée d’une demande de 2 unités |

| T=32,0 | Réception et validation | OrderReceived / InventoryCheckRequest / OrderValidated | La chaîne Deliver enregistre la commande et interroge le stock |

| T=36,0 | Rupture produit fini | InventoryShortageReport | La livraison directe n’est pas possible |

| T=40,0 | Diagnostic Make | CapacityAvailabilityResponse + MaterialShortageDetected | Capacité disponible ; matières absentes |

| T=40,0 | Faisabilité Source | MaterialAvailabilityRequest → SourceFeasibilityResponse | Consultation et engagement fournisseur |

| T=40,0 | Engagement client | PromisedDeliveryDate → OrderConfirmed | Date promise construite après coordination Source/Make/Deliver |

| T=40,0 | Approvisionnement lancé | ProcurementPlan → PurchaseOrder → InboundDelivery | Trois besoins matière sont approvisionnés |

| T=60,0 | Matières reçues | MaterialReceived → ProcurementCompleted → MaterialAvailable | GPL=25 ; bouteilles=2 ; accessoires=2 disponibles |

| T=60,0 | Production planifiée | ProductionPlan → ProductionOrder → ProductionTaskAssignment | Activation de Make |

| T=66,0 | Production démarrée | ExecutionStart | Début de l’exécution Make |

| T=309,1 | Progression | ExecutionProgress | 1 unité terminée sur 2 |

| T=399,1 | Fin Make | ExecutionProgress → ExecutionEnd → ProductionCompleted | 2 unités terminées |

| T=399,1 | Deliver | DeliveryPlan → ShipmentOrder → DeliveryCompleted | Préparation et livraison du lot |

| T=399,1 | Clôture | OperationalReport → ProcessStatusReport → MacroProcessReport | Commande clôturée en retard ; Lead Time = 372,05 s |



### 5.1 Réception et analyse initiale

La commande entre à T=27,0 s via CustomerOrder. À T=32,0 s, AOe-sD1.2 confirme l’enregistrement à AOp-sD1.1. En parallèle, AOp-sD1.3 demande à AOe-sD1.8 l’état du stock. La réponse InventoryAvailabilityResponse revient au même instant simulé ; AOp-sD1.1 transmet ensuite OrderValidated à CA-sD1, qui saisit AT-sP4 d’une demande de faisabilité.

### 5.2 Détection de la rupture produit fini

À T=36,0 s, CA-sD1 émet InventoryShortageReport vers AT-sP4 avec quantiteManquante=2. Le problème n’est donc plus une simpl’exécution Deliver : le tactique Deliver doit rechercher une solution inter-processus et transmet OrderFeasibilityRequest à AT-sP3.

| FIGURE 5.1 : Constat de rupture du stock de produit fini |

| --- |



Emplacement réservé pour la Figure 5.1.

### 5.3 Diagnostic Make et détection du manque matière

À T=40,0 s, AT-sP3 sollicite CA-sM1, qui délègue à AOp-sM1.1. Deux contrôles sont lancés vers AOe-sM1.2. CapacityAvailabilityResponse indique que la capacité est disponible ; MaterialShortageDetected indique simultanément GPL_VRAC=25/0, BOUTEILLE_VIDE_12KG=2/0 et ACCESSOIRES_KIT=2/0. La contrainte de fabrication est donc matérielle et non capacitaire.

### 5.4 Faisabilité et exécution Source

AT-sP3 déclenche AT-sP2 au moyen de MaterialAvailabilityRequest. Le niveau tactique Source descend ensuite vers CA-sS1, AOp-sS1.1 et AOe-sS1.2 jusqu’à RequestForAvailability. SupplierActor répond par SupplierCommitment. La décision remonte ensuite jusqu’à AT-sP2 puis AT-sP3 et AT-sP4. Après validation, ProcurementPlan, ProcurementOrder, PurchaseOrderTask et PurchaseOrder matérialisent la décision d’achat. Le flux physique InboundDelivery est enregistré et, à T=60,0 s, MaterialReceived confirme la réception conforme des trois matières.

| FIGURE 5.2 Approvisionnement des trois matièresContenu attendu : Visualisation des trois flux fournisseurs vers ZENER, avec GPL=25, bouteilles=2, accessoires=2.Repère de capture : Entre T=40 s et T=60 s. |

| --- |



Emplacement réservé pour la Figure 5.2.

### 5.5 Mise à disposition des matières et activation Make

À T=60,0 s, AOp-sS1.1 remonte un OperationalReport ; CA-sS1 confirme ProcurementCompleted ; AT-sP2 notifie AT-sP3 par MaterialAvailable. Le contenu de ce message indique désormais GPL=25/25, bouteilles=2/2 et accessoires=2/2. Le verrou matière est levé. AT-sP3 produit alors ProductionPlan, CA-sM1 ProductionOrder et AOp-sM1.1 ProductionTaskAssignment. L’ExecutionStart est enregistré à T=66,0 s.

### 5.6 Production du lot

La production porte deux entités de fabrication. La première progression est signalée à T=309,1 s (terminees=1,total=2). La seconde est achevée à T=399,1 s, suivie immédiatement de ExecutionEnd, OperationalReport, ProductionCompleted puis ProductAvailableForDelivery. Les mesures détaillées montrent que les attentes significatives se concentrent sur sM1.2.1 et sM1.3.2.

| FIGURE 5.3 : CAPTURE À INSÉRERProduction active et carrousel GPLContenu attendu : Vue Structure animée ou Vue Globale montrant les entités en Make et la machine de remplissage sM1.3.2.Repère de capture : Entre T=66 s et T=399,1 s. |

| --- |



Emplacement réservé pour la Figure 5.3.

### 5.7 Livraison et clôture

À T=399,1 s, AT-sP4 réactive Deliver par DeliveryPlan. CA-sD1 puis AOp-sD1.3 délèguent la préparation aux agents Inventory, Picking, Packing, Loading et Transport. DeliveryCompleted porte statut=EN_RETARD. Le résultat remonte ensuite AOp-sD1.7 → CA-sD1 → AT-sP4 → AS-sP1. La trace globale COMMANDE_CLOSE fixe le Lead Time à 372,05 s.

| FIGURE 5.4 : CAPTURE À INSÉRERLivraison finale et réception clientContenu attendu : Préparation Deliver, transport puis réception conforme du lot de 2 unités.Repère de capture : Autour de T=399,1 s. |

| --- |



Emplacement réservé pour la Figure 5.4.

### 5.8 Chronologie décisionnelle condensée

| Temps | Seq. repère | Événement | Conséquence |

| --- | --- | --- | --- |

| 27,0 s | 1 | CustomerOrder | La demande entre dans le système. |

| 32,0 s | 3–6 | Contrôle stock et validation | La commande est valide mais doit être évaluée par Deliver. |

| 36,0 s | 7–8 | Rupture produit fini | Le problème est transféré de Deliver vers Make. |

| 40,0 s | 9–17 | Diagnostic Make | Capacité disponible ; matière insuffisante ; Source devient nécessaire. |

| 40,0 s | 18–31 | Faisabilité Source et confirmation | Le fournisseur s’engage ; une date réaliste est reconstruite et communiquée. |

| 40,0 s | 32–36 | Lancement approvisionnement | Le plan devient ordre d’achat puis livraison entrante. |

| 60,0 s | 37–43 | Matières disponibles / lancement production | Source est clôturé et Make est activé. |

| 66,0 s | 44 | ExecutionStart Make | La fabrication démarre effectivement. |

| 309,1 s | 45 | ExecutionProgress | Une première unité est terminée. |

| 399,1 s | 46–50 | Fin Make | La seconde unité est terminée et le produit est déclaré disponible. |

| 399,1 s | 51–63 | Deliver final | Réservation, picking, packing, loading, shipping et réception sont enchaînés. |

| 399,1 s | 64–66 | Reporting final | Le résultat remonte jusqu’à AS-sP1. |



### 5.9 Simultanéité des timestamps et causalité

Deux zones de la chronologie concentrent de nombreux messages au même temps simulé : T=40,0 s et T=399,1 s. Cela ne signifie pas que toutes les décisions sont conceptuellement simultanées. Le numéro de séquence conserve l’ordre causal. À T=40,0 s, la chaîne passe successivement du diagnostic Make à la consultation Source, à l’engagement fournisseur, à la reconstruction de la date client puis à l’ordre d’approvisionnement. À T=399,1 s, le modèle clôt Make, déclare le produit disponible, réactive Deliver, exécute les sous-tâches de préparation et remonte le reporting final. La lecture du document doit donc toujours associer timestamp et séquence.

| FIGURE 5.5 : CAPTURE / ILLUSTRATION À INSÉRERFrise chronologique de l’exécution complèteContenu attendu : Axe temporel 27 → 399,1 s avec jalons 32, 36, 40, 60, 66, 309,1 et 399,1 ; différencier Source, Make et Deliver.Moment / vue : Illustration synthétique construite à partir de l’Excel ; aucune capture spécifique nécessaire. |

| --- |



## 6. Analyse des décisions et communications inter-agents

L’export recense 66 communications ordonnées pour la commande. Elles utilisent trois phases AER : AMENDMENT pour la descente des décisions et ordres, EXECUTION pour les faits d’exécution ou accusés, et REPORT pour la remontée d’état et de performance.

| Coordination | Émetteur → destinataire | Message | Fonction |

| --- | --- | --- | --- |

| Deliver → Make | AT-sP4 → AT-sP3 | OrderFeasibilityRequest | Rupture produit fini ; rechercher une solution de fabrication |

| Make → Source | AT-sP3 → AT-sP2 | MaterialAvailabilityRequest | Matières manquantes ; déclencher la faisabilité Source |

| Source → Make | AT-sP2 → AT-sP3 | MaterialAvailabilityResponse / MaterialAvailable | Rendre la matière disponible pour la production |

| Make → Deliver | AT-sP3 → AT-sP4 | MakeFeasibilityResponse / ProductAvailableForDelivery | Donner une date puis libérer le produit fini |

| Deliver → Strategic | AT-sP4 → AS-sP1 | MacroProcessReport | Transmettre la performance finale et le statut en retard |



| Point de traçabilitéLe même événement métier peut donner lieu à plusieurs messages à des niveaux différents. Il ne faut donc pas compter les communications comme des opérations physiques ; elles matérialisent la chaîne de décision et de reporting. |

| --- |



| FIGURE 6.1 : CAPTURE À INSÉRERTable de propagation des agentsContenu attendu : Capture de la table « Propagation agents et flux » filtrée sur une séquence représentative : rupture produit fini → diagnostic Make → demande Source.Repère de capture : Séquences 7 à 26 environ. |

| --- |



Emplacement réservé pour la Figure 6.1.

### 6.1 Répartition des 66 communications par phase AER

La commande génère 66 communications structurées. Les 27 messages AMENDMENT matérialisent principalement la descente des décisions et ordres ; les 13 messages EXECUTION représentent les faits d’exécution ou confirmations directes ; les 26 REPORT assurent la remontée de l’état et des résultats. L’équilibre entre descente et remontée montre que la coordination n’est pas un simple ordre unidirectionnel : chaque décision importante appelle une preuve de réalisation ou de faisabilité.

| Phase | Nombre | Fonction dominante |

| --- | --- | --- |

| AMENDMENT | 27 | Décision, plan, ordre ou instruction descendante. |

| EXECUTION | 13 | Fait d’exécution, progression, réception ou accusé. |

| REPORT | 26 | Retour de faisabilité, consolidation ou reporting vers le niveau supérieur. |



### 6.2 Communications inter-processus déterminantes

| Transition | Message | Rôle dans la coordination |

| --- | --- | --- |

| Deliver → Make | OrderFeasibilityRequest | Convertit la rupture produit fini en demande de faisabilité de production. |

| Make → Source | MaterialAvailabilityRequest | Convertit la rupture matière en objectif d’approvisionnement. |

| Source → Make | MaterialAvailabilityResponse / MaterialAvailable | Rend à Make une date puis une disponibilité effective. |

| Make → Deliver | MakeFeasibilityResponse / ProductAvailableForDelivery | Rend à Deliver une date de fin puis le produit réellement disponible. |

| Deliver → Strategic | MacroProcessReport | Clôt la boucle de reporting de la commande. |



| Règle de lecture — Une communication tactique inter-processus ne remplace pas la coordination interne de chaque domaine. Elle déclenche une chaîne locale tactique → coordinateur → pilotage → exécution, puis une remontée symétrique. |

| --- |



## 7. Boucle holonique de gestion des écarts et goulots

L’exécution contient une seconde logique, distincte du flux de satisfaction de commande : la réaction holonique aux écarts. Elle apporte une preuve concrète de l’autonomie locale et de la remontée hiérarchique des incidents.

| Temps | Chaîne | Message / décision | Interprétation |

| --- | --- | --- | --- |

| 210,0 | sM1.3.2 → AOp-sM1.1 | REPORT : PANNE | Panne du carrousel ; durée estimée 2650 s |

| 211,0 | AOp-sM1.1 | Réception du rapport | Le superviseur reçoit l’incident |

| 212,0 | AOp-sM1.1 → CA-sM1 | OperationalException | Consolidation de l’écart Make |

| 213,0 | CA-sM1 → AT-sP3 | ProcessDeviationReport | Remontée tactique |

| 213,0 | AT-sP3 → CA-sM1 | PriorityDecision | Action REBALANCE ; score AHP=0,170 |

| 214-215 | CA-sM1 → AOp-sM1.1 | SupervisorInstruction | Décision tactique contextualisée puis relayée |

| 226,0 | AOp-sM1.1 → sM1.3.1 | OperationalInstruction | Application REBALANCE ; score enregistré=0,320 |

| 226-229 | sM1.3.1 → AOp → CA → AT | ACK_REBALANCE / acknowledgements | Boucle d’accusé complète jusqu’au tactique |

| 390,0 | Strategic | Goulot détecté | sM1.2.1 ; WT≈26,9 s |



| Précaution sur les scores AHPL’export enregistre un score AHP de 0,170 au moment de la décision tactique, puis 0,320 dans l’instruction opérationnelle appliquée à sM1.3.1. Le fichier ne documente pas explicitement la cause de cette variation ; le présent document les traite donc comme deux valeurs enregistrées à deux niveaux, sans les considérer comme identiques. |

| --- |



| FIGURE 7.1 : CAPTURE À INSÉRERDécision holonique de rééquilibrageContenu attendu : Table Audit propagation AER montrant la chaîne panne → superviseur → coordinateur → tactique → REBALANCE → accusé.Repère de capture : Autour de T=210 à T=229 s. |

| --- |



Emplacement réservé pour la Figure 7.1.

| FIGURE 7.2 : CAPTURE À INSÉRERDétection du goulot MakeContenu attendu : Vue hiérarchique ou tableau de bord montrant sM1.2.1 en goulot avec WT≈26,9 s.Repère de capture : Autour de T=390 s. |

| --- |



Emplacement réservé pour la Figure 7.2.

### 7.1 Chaîne AER complète observée sur une panne Make

L’export ne fournit pas seulement un état de goulot ; il documente une boucle AER complète déclenchée par une panne du poste de remplissage GPL au carrousel. L’incident est signalé au niveau opérationnel à T=210 s, partagé via le Blackboard, consolidé par le pilotage et la coordination Make, puis arbitré au niveau tactique. Une décision REBALANCE est redescendue et appliquée, avant qu’un accusé ne remonte jusqu’au tactique.

| Étape | Temps | Niveau / action | Lecture métier |

| --- | --- | --- | --- |

| 1 | T=210.0s | Agent opérationnel d'exécution : rapport émis | L'exécution signale réellement une panne, un goulot ou un retard. |

| 2 | T=210.0s | Blackboard : rapport partagé | Le Blackboard conserve le message runtime et sa preuve. |

| 3 | T=211.0s | Agent opérationnel de pilotage ou superviseur : rapport reçu | Le superviseur reçoit le rapport sans saut de niveau. |

| 4 | T=212.0s | Agent coordinateur : rapport consolidé | Le coordinateur consolide l'écart de son macro-processus. |

| 5 | T=213.0s | Agent tactique : rapport macro reçu | Le tactique reçoit le rapport consolidé de son domaine. |

| 6 | T=213.0s | Agent tactique : arbitrage AHP | Le tactique arbitre la priorité avec un score AHP justifiable. |

| 7 | T=214.0s | Agent coordinateur : décision contextualisée | Le coordinateur traduit la décision en instruction contextualisée. |

| 8 | T=215.0s | Agent opérationnel de pilotage ou superviseur : instruction relayée | Le superviseur transforme la décision en instruction opérationnelle. |

| 9 | T=226.0s | Agent opérationnel d'exécution : décision appliquée | Le poste ciblé applique réellement la décision. |

| 10 | T=226.0s | Agent opérationnel d'exécution : accusé émis | Le poste ciblé produit un accusé d'exécution. |

| 11 | T=227.0s | Agent opérationnel de pilotage ou superviseur : accusé reçu | Le superviseur reçoit l'accusé du poste. |

| 12 | T=228.0s | Agent coordinateur : accusé consolidé | Le coordinateur consolide l'accusé du processus. |

| 13 | T=229.0s | Agent tactique : accusé final reçu | Le tactique clôt la boucle locale AER. |



### 7.2 Arbitrage AHP local et Performance Index : deux mécanismes distincts

Le score AHP utilisé lors du REBALANCE ne doit pas être confondu avec les poids du Performance Index. L’AHP intervient ici comme mécanisme d’arbitrage de priorité face à un incident local. Le PI, lui, agrège les métriques de performance au moyen des poids configurés pour RL, RS, AG, CO et AM. La présence simultanée des deux mécanismes montre que le modèle sépare décision opérationnelle adaptative et évaluation globale de performance.

### 7.3 Blackboard et fermeture de la boucle

Le Blackboard joue le rôle de mémoire partagée : le rapport opérationnel y est conservé avant d’être traité par les niveaux hiérarchiques. L’audit exporté indique une alerte en attente et une chaîne locale observée 13/13. Le point important pour l’analyse est la fermeture de boucle : une instruction n’est pas considérée comme suffisante ; l’agent d’exécution émet ACK_REBALANCE, puis le superviseur, le coordinateur et le tactique reçoivent successivement l’accusé.

| FIGURE 7.3 : CAPTURE / ILLUSTRATION À INSÉRERBlackboard et propagation AER de l’incident MakeContenu attendu : Mettre en évidence PANNE sM1.3.2, Blackboard, AOp-sM1.1, CA-sM1, AT-sP3, décision REBALANCE, application puis ACK_REBALANCE.Moment / vue : Vue hiérarchique / suivi temps réel autour de T=210–229 s si disponible. |

| --- |



## 8. Analyse VSM de l’exécution

### 8.1 Vue macro

| Macro | Échantillon | CT moyen (s) | WT moyen (s) | Délai moyen (s) | Efficacité |

| --- | --- | --- | --- | --- | --- |

| Source | 14 | 1,60 | 0,00 | 1,60 | 77,1 % |

| Plan | 1 | 2,00 | 0,00 | 2,00 | 90,0 % |

| Make | 19 | 24,42 | 4,59 | 29,01 | 72,5 % |

| Deliver | 23 | 3,17 | 0,00 | 3,17 | 85,2 % |



Make concentre l’essentiel du coût temporel moyen : son Cycle Time moyen est environ 7,7 fois celui de Deliver et 15,2 fois celui de Source. C’est également le seul macro-processus présentant une attente moyenne non nulle dans le tableau macro.

### 8.2 Postes Make structurants

| Poste | Fonction | CT moy. (s) | WT moy. (s) | Efficacité | Lecture |

| --- | --- | --- | --- | --- | --- |

| sM1.2.1 | Mise à disposition des matières | ≈52,34 | ≈26,92 | ≈56,1 % | Goulot détecté à T=390 s |

| sM1.3.2 | Remplissage GPL au carrousel | ≈93,32 | ≈18,96 | ≈76,5 % | Machine MAC_1 ; panne AER |

| sM1.5.1 | Transfert vers magasin PF | ≈49,30 | 0 | ≈85 % | Temps de traitement élevé |

| sM1.3.4 | Contrôle de poids | ≈29,25 | ≈4,74 | ≈73,9 % | Contrôle qualité |

| sM1.3.6 | Deuxième contrôle étanchéité | ≈29,25 | ≈4,74 | ≈73,9 % | Contrôle qualité |



### 8.3 Attentes explicites observées

Les traces brutes permettent d’identifier au moins deux attentes explicites de la seconde unité : 53,83 s à l’entrée de sM1.2.1 et 37,92 s à l’entrée de sM1.3.2, soit 91,75 s de file mesurée. Cette valeur ne doit pas être confondue avec le Dwell Time global du pipeline de performance.

| Poste | Entité | Attente | Interprétation |

| --- | --- | --- | --- |

| sM1.2.1 | CMD_1_F_2 | 53,83 s | File avant mise à disposition |

| sM1.3.2 | CMD_1_F_2 | 37,92 s | File avant carrousel |

| Total files explicites | — | 91,75 s | Somme des deux attentes observées |



### 8.4 Dwell Time global et efficacité

Le Dashboard Global fournit un Lead Time de 372,05 s, une efficacité globale de 65 % et un Dwell Time de 130,22 s. Le pipeline explicite la formule : Dwell Time = Lead Time × (1 − efficacité du cycle), soit 372,052 × 0,35 ≈ 130,218 s. Cette mesure représente donc une part globale non utile/non productive, et non la seule somme des files d’attente explicites.

| FIGURE 8.1 : CAPTURE À INSÉRERDashboard Macro / GlobalContenu attendu : Faire apparaître Source, Make, Deliver, le Lead Time 372,05 s, le Dwell Time 130,22 s, l’efficacité 65 % et le PI.Repère de capture : Fin de l’exécution. |

| --- |



Emplacement réservé pour la Figure 8.1.

### 8.5 Décomposition des deux entités de production sur les postes critiques

Les moyennes de poste masquent des comportements différents entre les deux unités fabriquées. Les traces brutes permettent de reconstituer les temps individuels sur les deux points les plus contraignants : la mise à disposition des matières (sM1.2.1) et le remplissage GPL au carrousel (sM1.3.2). La seconde unité supporte deux files d’attente successives, ce qui explique une part importante du délai de production.

| Entité | Poste | Attente avant traitement (s) | Traitement (s) | Temps utile estimé (s) | Lecture |

| --- | --- | --- | --- | --- | --- |

| CMD_1_F_1 | sM1.2.1 | 0 | 53,83 | 45,76 | Première unité servie immédiatement à la mise à disposition. |

| CMD_1_F_2 | sM1.2.1 | 53,83 | 50,85 | 43,22 | Deuxième unité attend la libération du poste. |

| CMD_1_F_1 | sM1.3.2 | 0 | 88,41 | 81,34 | Premier remplissage sans attente amont. |

| CMD_1_F_2 | sM1.3.2 | 37,92 | 98,23 | 90,37 | Deuxième remplissage cumule attente et temps de traitement plus long. |



Les moyennes du tableau KPI correspondent bien à ces observations : sM1.2.1 affiche environ 52,34 s de Cycle Time et 26,92 s d’attente moyenne ; sM1.3.2 affiche environ 93,32 s de Cycle Time et 18,96 s d’attente moyenne. Les moyennes ne sont donc pas des valeurs théoriques : elles sont directement explicables par les deux passages observés.

### 8.6 Ressource machine et disponibilité

Le poste sM1.3.2 est rattaché à la machine logique MAC_1, « Carrousel de remplissage GPL ». Sa capacité déclarée est de huit unités simultanées, son Cycle Time nominal de 88 s, son MTBF de 28 800 s et son MTTR de 1 800 s, soit une disponibilité théorique de 94,12 %. L’attribut Asset Management réutilise cette disponibilité comme métrique contributive, tandis que les pannes réelles restent tracées séparément dans l’AER.

| FIGURE 8.2 : CAPTURE / ILLUSTRATION À INSÉRERComparaison des deux unités sur sM1.2.1 et sM1.3.2Contenu attendu : Deux lignes CMD_1_F_1 / CMD_1_F_2 avec segments attente puis traitement ; faire apparaître 53,83 s et 37,92 s pour la seconde unité.Moment / vue : Illustration analytique issue d’Execution Brute ; aucune capture AnyLogic obligatoire. |

| --- |



## 9. Passage des observations VSM aux métriques SCOR

Les événements bruts ne sont pas directement moyennés dans le PI. Le modèle calcule d’abord des valeurs physiques cohérentes, puis les associe à des métriques SCOR calculables. Les unités restent hétérogènes tant que la normalisation Bottom → Perfect n’a pas été appliquée.

| Observation / source | Mesure interprétée | Code SCOR | Valeur |

| --- | --- | --- | --- |

| Durées postes Source | Cycle Time Source | RS.2.1 | 1,604 s |

| Durées postes Make | Cycle Time Make | RS.2.2 | 24,419 s |

| Durées postes Deliver | Cycle Time Deliver | RS.2.3 | 3,174 s |

| Création → clôture commande | Order Fulfillment Cycle Time | RS.1.1 | 372,052 s |

| Lead Time × (1-eff.) | Order Fulfillment Dwell Time | RS.3.94 | 130,218 s |

| Entités terminées / temps | Throughput | AG.3.32 | 9,021 ent/h |

| Commandes complètes | % commandes complètes | RL.2.1 | 1,000 |

| Livraison à temps | Performance date promise | RL.2.2 | 0,000 |

| Disponibilité machine | MTBF/(MTBF+MTTR) | AM.3.9 | 0,941 |



| FIGURE 9.1 : CAPTURE À INSÉRERPipeline SCOR vers PIContenu attendu : Capture de la table affichant valeur réelle, Bottom→Perfect, score /10, fuzzy, poids local et source/preuve.Repère de capture : Feuille ou fenêtre PIPELINE SCOR -> PI. |

| --- |



Emplacement réservé pour la Figure 9.1.

### 9.1 Chaîne de provenance des principales métriques

La traçabilité scientifique exige de distinguer trois familles de valeurs : les observations directes issues de l’exécution, les agrégats construits à partir de plusieurs postes et les proxys explicitement déclarés. Le tableau suivant associe chaque métrique majeure à sa source et à son type de preuve.

| Métrique | Valeur réelle | Origine | Type de provenance | Attribut |

| --- | --- | --- | --- | --- |

| RL.2.1 — commandes complètes | 1,000 | Statut de commande clôturée | Observation métier agrégée | RL |

| RL.2.2 — livraison à temps | 0,000 | Statut EN_RETARD / verifierFillRate() | Observation métier agrégée | RL |

| RS.2.1 — Source CT | 1,604 s | KPI des postes S1.* | Agrégation de postes | RS |

| RS.2.2 — Make CT | 24,419 s | KPI des postes M1.* | Agrégation de postes | RS |

| RS.2.3 — Deliver CT | 3,174 s | KPI des postes D1.* | Agrégation de postes | RS |

| RS.1.1 — Order Lead Time | 372,052 s | Création commande → clôture | Observation globale | RS |

| RS.3.94 — Dwell Time | 130,218 s | Lead Time × (1 − efficacité) | Agrégation dérivée | RS |

| AG.3.32 — Throughput | 9,021 ent/h | Entités terminées × 3600 / temps | Agrégation globale | AG |

| PROXY.AG.SYSTEM_UTILIZATION | 0,019 | WIP / capacité simultanée déclarée | Proxy explicite | AG |

| CO.1.1 — coût / CA | 0,128 | Coût total cumulé / CA estimé | Ratio agrégé | CO |

| AM.3.9 — disponibilité machine | 0,941 | MTBF/(MTBF+MTTR) | Paramètre calculé | AM |

| AM.2.2 — Inventory Days of Supply | 0 jour | Stock observé / débit journalier | Agrégation stock/débit | AM |



### 9.2 Conservation des unités avant normalisation

Avant la normalisation, les valeurs restent physiquement hétérogènes : secondes, ratios, entités par heure, jours et valeurs monétaires. Elles ne deviennent comparables qu’après transformation Bottom/Perfect vers une échelle commune 0–10. Cette étape est essentielle : additionner directement 24,419 s, 9,021 ent/h et 0,128 n’aurait aucune signification. La normalisation crée la comparabilité, puis la fuzzification et les poids permettent l’agrégation.

### 9.3 Lecture des métriques informatives hors PI

Certaines valeurs sont exportées pour l’audit mais portent un poids local nul dans le PI. C’est le cas du coût de main-d’œuvre cumulé (335,636 FCFA), du coût matière cumulé (494 FCFA) et de la valeur des actifs fixes déclarés. Elles doivent être utilisées pour documenter l’exécution, pas pour justifier directement le score global. Leur présence permet néanmoins de préparer une calibration économique ultérieure.

## 10. Agrégation RL / RS / AG / CO / AM

| Attribut | Score /10 | Poids PI | Lecture |

| --- | --- | --- | --- |

| RL — Reliability | 7,500 | 0,40 | Commande complète et exacte ; pénalité forte liée au retard |

| RS — Responsiveness | 9,844 | 0,20 | Temps physiques faibles par rapport aux bornes de normalisation |

| AG — Agility | 5,145 | 0,10 | Faible throughput et stabilité moyenne malgré faible utilisation |

| CO — Cost | 8,724 | 0,15 | Ratio coût/CA = 0,128 ; coûts MO et matière informatifs |

| AM — Asset Management | 9,706 | 0,15 | Disponibilité machine 94,1 % ; stock final nul |



### 10.1 Reliability : une commande complète mais en retard

| Code | Métrique | Valeur | Score | Poids local |

| --- | --- | --- | --- | --- |

| RL.2.1 | Commandes livrées complètes | 1 | 10,0 | 25 % |

| RL.2.2 | Commandes livrées à temps | 0 | 0,0 | 25 % |

| RL.3.33 | Exactitude articles | 1 | 10,0 | 25 % |

| RL.3.35 | Exactitude quantités | 1 | 10,0 | 25 % |



Le score RL=7,500/10 s’explique directement : trois métriques sur quatre sont maximales, tandis que la performance de livraison à la date promise vaut zéro. Le système a donc satisfait la quantité et la conformité, mais pas l’engagement temporel.

### 10.2 Responsiveness : une lecture différente du retard

RS=9,844/10 peut paraître contradictoire avec le statut EN_RETARD. Il ne s’agit pourtant pas du même objet de mesure. La pénalité de date promise intervient dans Reliability, tandis que Responsiveness normalise les durées réelles par rapport aux bornes Bottom/Perfect. Un exécution peut donc être en retard vis-à-vis d’une promesse interne et rester rapide au regard d’une échelle de durée très large.

### 10.3 Agility : le point le plus faible de l’exécution

| Code | Métrique | Valeur | Score /10 |

| --- | --- | --- | --- |

| AG.3.32 | Throughput | 9,021 ent/h | 0,564 |

| Proxy utilisation | Utilisation système | 0,019 | 9,871 |

| AG.1.1 | Stabilité du débit | 0,500 | 5,000 |



La faiblesse principale provient du débit : 9,021 entités/h face à une borne Perfect de 160 entités/h. La stabilité du débit est médiane. Le faible taux d’occupation du système reçoit au contraire un score élevé dans la règle de normalisation retenue.

### 10.4 Cost : un score fondé sur le ratio coût / chiffre d’affaires

L’attribut Cost vaut 8,724/10. Dans le pipeline courant, une seule métrique contributive est utilisée : CO.1.1, ratio coût total cumulé / chiffre d’affaires estimé, mesuré à 0,128. Les coûts de main-d’œuvre et de matière sont exportés comme éléments informatifs mais ne sont pas normalisés dans le score faute de calibration Bottom/Perfect spécifique. Il faut donc lire Cost comme une évaluation du ratio agrégé configuré, et non comme une validation complète de la comptabilité industrielle.

### 10.5 Asset Management : disponibilité élevée et stock final nul

Asset Management atteint 9,706/10. La disponibilité moyenne des machines vaut 0,941, soit 9,412/10 après normalisation. Inventory Days of Supply vaut 0 jour et reçoit 10/10 selon la règle actuelle où la borne Perfect est 0 jour. La valeur des actifs fixes, bien qu’exportée, reste informative hors score. Ce résultat doit donc être lu comme une performance de disponibilité et de faible immobilisation de stock selon les règles du modèle courant.

| Attribut | Métriques contributives | Lecture dominante |

| --- | --- | --- |

| RL | Complétude, ponctualité, exactitude article, exactitude quantité | Le défaut principal est le respect de la date promise. |

| RS | CT Source/Make/Deliver, Lead Time, Dwell Time | Les temps sont faibles relativement aux bornes de normalisation. |

| AG | Throughput, utilisation système proxy, stabilité du débit | Le débit pénalise fortement l’attribut. |

| CO | Ratio coût total / CA | Évaluation économique partielle, coûts détaillés hors score. |

| AM | Disponibilité machine, Inventory Days of Supply | Disponibilité élevée et stock final nul selon la règle actuelle. |



## 11. Construction et interprétation du Performance Index

Le Performance Index final vaut 8,248/10. Il résulte de l’agrégation fuzzy des cinq attributs avec les poids globaux configurés. Une écriture numérique simple des scores agrégés permet de vérifier l’ordre de grandeur du résultat :

| Vérification numérique0,40 × 7,500 + 0,20 × 9,844 + 0,10 × 5,145 + 0,15 × 8,724 + 0,15 × 9,706 ≈ 8,248 |

| --- |



| Élément | Valeur |

| --- | --- |

| PI global | 8,248 / 10 |

| Vecteur fuzzy global | A=0,698 ; B=0,136 ; C=0,017 ; D=0,017 ; E=0,009 ; F=0,124 |

| Métriques calculées | 65 |

| Estimations / proxys | 7 |

| Rebuts | 0 |

| Rework global | 0 |



Ce score ne doit pas être interprété comme une note absolue de l’entreprise. Il reflète la performance de cette exécution selon les règles de normalisation et les poids configurés. Les bornes Bottom/Perfect restent des paramètres à calibrer avec des références terrain pour une campagne expérimentale définitive.

| FIGURE 11.1 : CAPTURE À INSÉRERPerformance Index finalContenu attendu : Dashboard ou table Traçabilité performance montrant PI=8,248/10 et les cinq attributs.Repère de capture : Après clôture de la commande. |

| --- |



Emplacement réservé pour la Figure 11.1.

### 11.1 Vecteur fuzzy global

Le PI final est associé au vecteur fuzzy global A=0,698 ; B=0,136 ; C=0,017 ; D=0,017 ; E=0,009 ; F=0,124. Ce vecteur conserve davantage d’information qu’une moyenne simple : il montre qu’une forte masse appartient aux classes favorables A/B, mais qu’une composante F non négligeable subsiste. Cette composante provient notamment de la ponctualité nulle dans Reliability et du faible throughput dans Agility.

| Classe fuzzy | Masse globale | Lecture |

| --- | --- | --- |

| A | 0,698 | Part dominante de la performance globale dans la classe la plus favorable. |

| B | 0,136 | Deuxième composante favorable. |

| C | 0,017 | Contribution intermédiaire faible. |

| D | 0,017 | Contribution intermédiaire faible. |

| E | 0,009 | Contribution défavorable faible. |

| F | 0,124 | Composante défavorable significative à relier surtout au retard et au throughput. |



### 11.2 Vérification numérique et portée

La combinaison pondérée des scores d’attributs donne un ordre de grandeur identique au PI : 0,40×7,500 + 0,20×9,844 + 0,10×5,145 + 0,15×8,724 + 0,15×9,706 ≈ 8,248. Cette égalité d’ordre de grandeur constitue un contrôle de cohérence. La valeur finale publiée reste toutefois celle issue de l’agrégation fuzzy et de la défuzzification exportées par le modèle.

| FIGURE 11.2 — CAPTURE / ILLUSTRATION À INSÉRERVecteur fuzzy global et contribution des cinq attributsContenu attendu : Montrer RL, RS, AG, CO, AM avec leurs poids et, en parallèle, les masses A–F du vecteur global.Moment / vue : Illustration analytique à produire à partir de la feuille Traçabilité performance. |

| --- |



## 12. Matrice de traçabilité intégrale

La matrice suivante relie les événements majeurs à la chaîne décisionnelle, aux données produites et à leur usage analytique. Elle constitue le noyau de correspondance simulation ↔ interprétation.

| Temps | Événement | Agent / chaîne | Action | Donnée | Conséquence analytique |

| --- | --- | --- | --- | --- | --- |

| 27,0 | CustomerOrder | CUSTOMER → AOe-sD1.2 | Commande reçue | 2 unités | Déclencheur |

| 36,0 | InventoryShortageReport | CA-sD1 → AT-sP4 | Rupture PF | 2 unités manquantes | Bascule Deliver → Make |

| 40,0 | MaterialShortageDetected | AOe-sM1.2 → AOp-sM1.1 | Rupture matières | 25/0 ; 2/0 ; 2/0 | Bascule Make → Source |

| 40,0 | PurchaseOrder | AOe-sS1.2 → SupplierActor | Achat lancé | 25 GPL ; 2 bouteilles ; 2 accessoires | Approvisionnement |

| 60,0 | MaterialReceived | AOe-sS1.3 → AOp-sS1.1 | Réception conforme | Stocks deviennent 25 ; 2 ; 2 | Libère Make |

| 66,0 | ExecutionStart | AOe-sM1.2 → AOp-sM1.1 | Production démarrée | 2 unités | Début Make |

| 119,8 / 170,7 | PROCESS_EXIT sM1.2.1 | OperationalAgent | Mise à disposition matières | WT 0 / 53,83 s | Alimente VSM Make |

| 212,8 / 311,1 | PROCESS_EXIT sM1.3.2 | Carrousel GPL | Remplissage | WT 0 / 37,92 s | Cycle Time / disponibilité / AER |

| 210-229 | AER REBALANCE | Make holonique | Gestion panne | scores 0,170 puis 0,320 | Décision multi-niveaux |

| 390,0 | Goulot détecté | Strategic | Goulot sM1.2.1 | WT≈26,9 s | Diagnostic |

| 399,1 | DeliveryCompleted | AOe-sD1.12 → AOp-sD1.7 | Livraison | 2 unités ; EN_RETARD | RL.2.1=1 ; RL.2.2=0 |

| 399,1 | COMMANDE_CLOSE | MoteurCommande | Clôture | Lead Time=372,05 s | RS.1.1 / PI |



### 12.1 Matrice objectif → décision → preuve → performance

| Objet | Agent / chaîne | Preuve | Donnée produite | Conséquence analytique |

| --- | --- | --- | --- | --- |

| Rupture PF | CA-sD1 / AT-sP4 | InventoryShortageReport | quantité manquante = 2 | Déclenche la chaîne Make |

| Faisabilité Make | AT-sP3 / CA-sM1 / AOp-sM1.1 | CapacityAndMaterialCheckOrder | capacité disponible | Écarte la capacité comme verrou principal |

| Rupture matière | AOe-sM1.2 | MaterialShortageDetected | GPL 25/0 ; bouteilles 2/0 ; accessoires 2/0 | Déclenche Source |

| Faisabilité Source | AT-sP2 → SupplierActor | RequestForAvailability / SupplierCommitment | engagement fournisseur | Rend la solution d’approvisionnement réalisable |

| Réception matière | AOe-sS1.3 | MaterialReceived | GPL 25/25 ; bouteilles 2/2 ; accessoires 2/2 | Autorise Make |

| Production | AOe-sM1.2 / AOe-sM1.3 | ExecutionStart / Progress / End | 2 unités terminées | Alimente CT/WT Make et RS |

| File Make | Queue:sM1.2.1 | QUEUE_EXIT | 53,83 s pour unité 2 | Explique une part du Dwell et le goulot |

| Carrousel | sM1.3.2 | PROCESS_EXIT / PANNE AER | 88,41 s ; 98,23 s ; disponibilité 94,12 % | Alimente RS.2.2 et AM.3.9 |

| Livraison | AOe-sD1.8→12 | DeliveryCompleted | 2 unités livrées ; EN_RETARD | Alimente RL.2.1=1 et RL.2.2=0 |

| Clôture | MoteurCommande | COMMANDE_CLOSE | Lead Time 372,05 s | Alimente RS.1.1 et le PI |

| Reporting final | AT-sP4 → AS-sP1 | MacroProcessReport | bilan Deliver consolidé | Ferme la boucle de décision |



### 12.2 Hiérarchie des preuves

Pour éviter les interprétations circulaires, le document applique une hiérarchie de preuve. Une communication établit qui décide et qui reçoit ; une trace brute établit une durée ou un événement ; un KPI agrège plusieurs traces ; une métrique SCOR transforme la mesure dans son référentiel ; enfin le pipeline explique la contribution au PI. Une conclusion sur la performance ne doit donc pas être justifiée uniquement par un message agent, et une conclusion sur le rôle d’un agent ne doit pas être déduite uniquement d’un KPI.

| Niveau de preuve | Répond principalement à la question | Exemple dans cette exécution |

| --- | --- | --- |

| Propagation agents et flux | Qui parle à qui, dans quel ordre et pour quelle décision ? | MaterialAvailabilityRequest AT-sP3 → AT-sP2 |

| Execution Brute | Quelle durée / attente / événement a réellement été enregistré ? | 53,83 s de file sur sM1.2.1 pour CMD_1_F_2 |

| KPI par Poste / Dashboard | Quelle synthèse opérationnelle ressort des traces ? | CT moyen Make = 24,419 s |

| Pipeline SCOR vers PI | Comment la mesure devient-elle un score comparable ? | RS.2.2 : 24,419 s → 9,932/10 |

| Traçabilité performance | Comment le score contribue-t-il à l’attribut puis au PI ? | RS=9,844 ; poids PI=0,20 |



## 13. Synthèse transversale des contributions agent–processus–performance

Ce chapitre conserve uniquement la lecture transversale nécessaire avant les fiches détaillées du chapitre 17. Il ne répète pas les messages agent par agent : il synthétise la façon dont chaque niveau transforme l’objectif, produit une preuve et alimente indirectement la mesure de performance.

### 13.1 Typologie consolidée des contributions

| Niveau / famille | Fonction dans l’exécution | Exemples | Preuve caractéristique | Lien à la performance |

| --- | --- | --- | --- | --- |

| Stratégique | Recevoir la synthèse globale et surveiller les déséquilibres. | AS-sP1 | MacroProcessReport ; détection de goulot | Lecture consolidée, sans exécution physique directe. |

| Tactique | Arbitrer la faisabilité et construire les plans Source, Make, Deliver. | AT-sP2, AT-sP3, AT-sP4 | FeasibilityResponse ; Procurement/Production/DeliveryPlan | Détermine les décisions qui conditionnent délais, service et utilisation des ressources. |

| Coordination | Contextualiser les plans et agréger les résultats de processus. | CA-sS1, CA-sM1, CA-sD1 | Orders ; OperationalReport ; Completed | Change la granularité entre tactique et opérationnel. |

| Pilotage opérationnel | Décomposer les ordres, distribuer les tâches et surveiller leur réalisation. | AOp-sS1.1, AOp-sM1.1, AOp-sD1.x | TaskAssignment ; exceptions ; confirmations | Produit la structure de contrôle qui génère les traces d’exécution. |

| Exécution | Réaliser l’achat, la réception, la production, la préparation et le transport. | AOe-* ; poste sM1.3.2 | Start/Progress/End ; Completed ; MaterialReceived | Source directe des CT, WT, statuts, quantités et événements utilisés par VSM/SCOR. |



### 13.2 Chaîne de contribution aux mesures

La contribution d’un agent au PI est indirecte : l’agent produit ou fait remonter un fait opérationnel ; ce fait devient une observation ou un KPI ; le moteur de performance applique ensuite les règles VSM/SCOR, la normalisation, la fuzzification et l’agrégation. Le chapitre 17 documente les responsabilités individuelles ; les chapitres 8 à 11 documentent les calculs.

| Fait runtime | Agents / postes associés | Mesure intermédiaire | Métrique / attribut principal |

| --- | --- | --- | --- |

| Réception des matières et clôture Source | AOe-sS1.3 → AOp-sS1.1 → CA-sS1 | CT Source / disponibilité matière | RS / Responsiveness |

| Exécution Make et attentes | AOe-sM1.2/3 ; sM1.2.1 ; sM1.3.2 | CT Make, WT, efficacité | RS ; effets indirects AG/CO |

| Disponibilité machine / incident | sM1.3.2 ; boucle AER | MTBF/MTTR, disponibilité, retard local | AM ; effets temporels indirects |

| Préparation et livraison | AOe-sD1.8…12 | CT Deliver, complétude, exactitude, ponctualité | RS + RL |

| Clôture vers le stratégique | AOp-sD1.7 → CA-sD1 → AT-sP4 → AS-sP1 | Lead Time et statut EN_RETARD | RL.2.2 + synthèse globale |

| Complément de détail : Les fiches de participation agent par agent sont regroupées au chapitre 17 afin d’éviter de dupliquer ici les mêmes communications. Ce chapitre 13 doit être lu comme une carte de correspondance entre responsabilité, preuve et mesure. |  |  |  |



## 14. Résultats intégrés et lecture causale de l’exécution

La lecture consolidée distingue quatre résultats simultanés : la commande est entièrement satisfaite sur le plan quantitatif ; la conformité est maintenue ; la livraison est tardive ; et le système conserve une capacité d’adaptation face à un incident Make. Le Performance Index agrège ces dimensions sans les confondre.

### 14.1 Tableau de résultats de bout en bout

| Dimension | Observation | Interprétation |

| --- | --- | --- |

| Service physique | 2 unités commandées / 2 livrées ; pas de rebut global ni rework comptabilisé | Objectif quantitatif atteint. |

| Ponctualité | Statut final EN_RETARD ; Lead Time 372,05 s | Objectif temporel non atteint ; impact direct sur Reliability. |

| Source | Matières manquantes détectées à T=40 s ; reçues à T=60 s | Contrainte amont levée rapidement dans l’échelle du modèle. |

| Make | ExecutionStart à T=66 s ; fin complète à T=399,1 s | Phase dominante et chemin temporel critique. |

| Goulot / attente | sM1.2.1 : WT moyen ≈26,92 s ; sM1.3.2 : WT moyen ≈18,96 s | Accumulation d’attente et de traitement dans Make. |

| Adaptation | PANNE → ProcessDeviationReport → REBALANCE → ACK | Boucle holonique fermée et traçable. |

| Performance multicritère | RL 7,500 ; RS 9,844 ; AG 5,145 ; CO 8,724 ; AM 9,706 | Scores contrastés, Agility la plus faible. |

| PI | 8,248 / 10 | Synthèse multicritère contextualisée par les bornes et pondérations. |



### 14.2 Lecture causale du retard

La causalité du retard ne se réduit pas à une seule micro-activité. Source rend les matières disponibles à T=60 s, puis Make occupe la majeure partie de la fenêtre restante jusqu’à T=399,1 s. Entre ExecutionStart à T=66 s et la fin complète de production, environ 333,1 s s’écoulent, soit près de 89,5 % du Lead Time de bout en bout. Les postes sM1.2.1 et sM1.3.2 concentrent des temps de traitement et d’attente significatifs, tandis qu’un incident sur le carrousel déclenche une boucle adaptative sans empêcher la clôture de la commande.

Cette lecture ne signifie pas que Source ou Deliver ont une contribution temporelle nulle : certaines sous-étapes partagent des timestamps événementiels, et leurs KPI conservent des durées propres. La conclusion défendable est que Make constitue la phase temporelle dominante de cette exécution, non que toutes les autres phases sont instantanées.

### 14.3 Résultat multicritère : réussite physique, retard et PI

Reliability vaut 7,500/10 parce que complétude et exactitude sont maximales tandis que la ponctualité est nulle. Responsiveness reste élevée car les durées physiques sont évaluées par rapport à des bornes Bottom/Perfect distinctes de la date promise au client. Agility est l’attribut le plus faible, notamment sous l’effet d’un débit réduit dans un exécution de deux unités. Cost et Asset Management restent favorables selon les paramètres courants. Le PI de 8,248/10 est donc compatible avec une livraison en retard : il agrège plusieurs dimensions au lieu de résumer uniquement le respect de la date promise.

### 14.4 Résilience décisionnelle observée

L’incident Make fournit une seconde lecture du résultat : le système détecte un écart local, le publie via le Blackboard, l’escalade jusqu’au tactique, applique REBALANCE puis fait remonter l’accusé. Cette fermeture de boucle démontre une résilience décisionnelle et une traçabilité organisationnelle ; elle ne garantit toutefois pas que l’action corrective suffise à éliminer tout retard. La performance finale doit donc être lue conjointement avec la capacité d’adaptation, et non à sa place.

## 15. Limites de lecture et précautions méthodologiques

Plusieurs sous-étapes Source partagent le timestamp T=40,0 s et plusieurs sous-étapes Deliver le timestamp T=399,1 s. Leur ordre est néanmoins préservé par les numéros de séquence. Le timestamp seul ne doit donc pas être utilisé pour déduire une durée cumulée de ces sous-étapes.

Les temps de traitement inscrits dans Execution Brute sont des mesures métier/poste. Lorsqu’ils sont enregistrés au même instant simulé, ils ne correspondent pas nécessairement à un avancement de l’horloge événementielle à chaque ligne.

La feuille Responsabilites n’est pas exploitée dans cette version car son contenu courant ne permet pas une lecture robuste. Les responsabilités sont reconstituées depuis Architecture agents, Micro-Activites et Propagation agents et flux.

Les métriques informatives hors score, notamment certains coûts et la valeur des actifs, ne contribuent pas au PI et sont présentées comme telles.

La forte Responsiveness et le statut EN_RETARD ne sont pas contradictoires : Reliability mesure notamment le respect de la date promise tandis que Responsiveness normalise les durées par rapport à des bornes distinctes.

Les bornes Bottom/Perfect et certains proxys doivent être calibrés sur des données métier réelles avant toute interprétation absolue du PI.

Le classeur exporté montre 190 nœuds et 71 affectations ISA-95. Une autre ligne de validation conserve toutefois une formulation historique « A VERIFIER » ; cette divergence de garde n’affecte pas l’analyse métier du présent document mais doit rester tracée dans la validation technique de la baseline.

## 16. Discussion académique et lecture intégrée des mécanismes observés

Cette section propose une lecture académique de l’exécution en ne se limitant plus à décrire les messages et les valeurs exportées. L’objectif est de montrer comment la structure multi-agents transforme une demande client en décisions successives, comment ces décisions se matérialisent dans les micro-activités SCOR, et comment les effets opérationnels sont finalement traduits en mesures de performance. La lecture suit donc une logique causale : besoin → diagnostic → décision → exécution → observation → agrégation → retour d’information.

| Clé de lecture — Une même ligne du journal peut avoir plusieurs significations selon le niveau étudié : événement métier pour l’opérateur, preuve de coordination pour l’architecture multi-agents, source de mesure pour VSM/SCOR et élément d’explication pour le PI. L’interprétation retient systématiquement ces quatre niveaux sans les confondre. |

| --- |



### 16.1 De la demande client à un problème de faisabilité

À T=27,0 s, la commande de deux unités entre dans le système. Elle n’est pas encore un ordre de production ni un ordre d’approvisionnement : elle constitue d’abord une demande à qualifier. L’exécution Deliver enregistre la commande, interroge l’inventaire et remonte le résultat au niveau de coordination. Cette première phase illustre une fonction essentielle de l’architecture : convertir une intention externe en contraintes internes observables avant toute action physique coûteuse.

À T=32,0 s, la chaîne InventoryCheckRequest → InventoryAvailabilityResponse → OrderValidated → OrderFeasibilityRequest matérialise cette conversion. Le niveau opérationnel produit le fait — disponibilité réelle du stock — tandis que le coordinateur Deliver transforme ce fait en question de faisabilité adressée au niveau tactique. Le système évite ainsi qu’un agent tactique raisonne directement sur une hypothèse de stock non vérifiée.

| Temps | Niveau | Fait / message | Interprétation académique |

| --- | --- | --- | --- |

| 27,0 s | Exécution Deliver | CustomerOrder | Transformation de la demande externe en objet de traitement interne. |

| 32,0 s | Exécution / pilotage | InventoryCheckRequest / Response | Production d’une information de contexte vérifiée avant décision. |

| 32,0 s | Coordination Deliver | OrderValidated | Validation organisationnelle de la commande et de son état. |

| 32,0 s | Tactique Deliver | OrderFeasibilityRequest | Passage du constat opérationnel à une décision de planification. |

| FIGURE 16.1 : CAPTURE / ILLUSTRATION À INSÉRERChaîne de qualification de la commande : CustomerOrder → InventoryCheckRequest/Response → OrderValidated → OrderFeasibilityRequest. Idéalement, juxtaposer la table de propagation et la vue Deliver autour de T=27–32 s. |  |  |  |



### 16.2 La rupture de produit fini comme règle de bascule vers Make

À T=36,0 s, InventoryShortageReport indique que la demande ne peut pas être satisfaite par le stock de produit fini. Ce message joue le rôle d’un événement de bascule : Deliver cesse d’être un simple processus d’exécution de livraison et devient l’origine d’une demande inter-processus adressée à Make. La communication AT-sP4 → AT-sP3 est donc horizontale au niveau tactique, mais elle est causée par une observation provenant des niveaux inférieurs.

La portée de cette transition est importante : le choix de Make résulte directement de l’état observé. L’indisponibilité du produit fini rend impossible une satisfaction directe par le stock ; la demande est donc transformée en problème de faisabilité de production. Cette distinction donne au flux une interprétation décisionnelle plutôt qu’une simple lecture séquentielle.

| Élément observé | Valeur / état | Conséquence décisionnelle |

| --- | --- | --- |

| Quantité commandée | 2 unités | Objectif physique à satisfaire. |

| Stock fini utilisable | Insuffisant / nul pour la demande | Deliver direct impossible. |

| Message pivot | InventoryShortageReport, T=36,0 s | Déclenche la coordination Plan Deliver → Plan Make. |

| Agent de transition | AT-sP4 → AT-sP3 | Transfert du problème de livraison vers la faisabilité de production. |



### 16.3 Faisabilité Make : séparer la capacité de la disponibilité matière

La phase Make commence par une séparation explicite de deux questions : la capacité de production existe-t-elle et les matières nécessaires sont-elles disponibles ? À T=40,0 s, AOp-sM1.1 adresse à AOe-sM1.2 un CapacityCheckRequest puis un MaterialCheckRequest. La réponse est asymétrique : CapacityAvailabilityResponse confirme la capacité, tandis que MaterialShortageDetected établit l’impossibilité matérielle de lancer immédiatement la fabrication.

Cette séparation empêche une conclusion simpliste du type « Make est indisponible ». L’unité de production est techniquement mobilisable, mais son activation est contrainte par une dépendance amont. Sur le plan de la décision, la contrainte de production devient donc une contrainte Source. Sur le plan de la performance, les délais Source et Make doivent rester distingués afin de ne pas attribuer au carrousel ou aux postes de production un retard provenant d’une absence de matière.

| Ressource / matière | Besoin du lot | Disponible au diagnostic | Décision |

| --- | --- | --- | --- |

| Capacité Make | Capacité pour 2 unités | Disponible | Ne bloque pas le lancement à elle seule. |

| GPL_VRAC | 25 | 0 | Réapprovisionnement requis. |

| BOUTEILLE_VIDE_12KG | 2 | 0 | Réapprovisionnement requis. |

| ACCESSOIRES_KIT | 2 | 0 | Réapprovisionnement requis. |

| FIGURE 16.2 — CAPTURE À INSÉRERÉtat de disponibilité matière lors du diagnostic Make. Capturer si possible la fenêtre de besoins matières ou une vue permettant de voir GPL=0, bouteilles=0, accessoires=0 autour de T=40 s. |  |  |  |



### 16.4 Source comme processus habilitant : reconstruire la capacité de produire

La demande MaterialAvailabilityRequest transmise par AT-sP3 à AT-sP2 transforme le besoin Make en sous-objectif Source. Le processus Source ne vise donc pas une performance autonome : il vise à rétablir une condition nécessaire à l’objectif supérieur de satisfaction de la commande. La consultation fournisseur, l’engagement, la commande d’achat, la livraison et la réception constituent une chaîne de rétablissement de capacité.

L’export Supply Chain montre trois flux physiques distincts : 25 unités de GPL en vrac, 2 bouteilles vides et 2 kits d’accessoires. À T=60,0 s, MaterialReceived confirme que les trois besoins sont devenus disponibles dans l’entreprise focale. La même horloge simule ensuite OperationalReport, ProcurementCompleted et MaterialAvailable, ce qui signifie que la propagation informationnelle de la fin Source est immédiate dans le modèle, non que toutes les opérations physiques Source ont une durée nulle.

| Flux Source | Quantité | Origine | Destination | Rôle dans l’objectif global |

| --- | --- | --- | --- | --- |

| GPL vrac | 25 | Fournisseur du GPL | ZENER SA Togo | Alimente le remplissage des 2 unités. |

| Bouteilles vides | 2 | Fournisseur de bouteilles vides | ZENER SA Togo | Fournit les contenants nécessaires. |

| Accessoires | 2 | Fournisseur des accessoires | ZENER SA Togo | Fournit les composants de finition. |

| Interprétation temporelle — Le segment T=40 → T=60 représente environ 20 s d’occupation chronologique de l’exécution entre la décision d’approvisionner et la disponibilité matière. Il ne doit pas être assimilé à la somme de tous les temps de traitement Source, car plusieurs traces métier sont enregistrées au même timestamp. |  |  |  |  |



### 16.5 Synchronisation Source → Make : passage d’une contrainte levée à un ordre de production

À T=60,0 s, la fin Source déclenche une chaîne de trois transformations : AT-sP2 transmet MaterialAvailable à AT-sP3 ; AT-sP3 transforme cette disponibilité en ProductionPlan ; CA-sM1 la contextualise en ProductionOrder ; AOp-sM1.1 la transforme enfin en ProductionTaskAssignment. Cette chaîne illustre une distinction centrale entre information, décision et instruction.

| Message | Émetteur → destinataire | Nature | Effet |

| --- | --- | --- | --- |

| MaterialAvailable | AT-sP2 → AT-sP3 | Information tactique inter-processus | La contrainte matière est levée. |

| ProductionPlan | AT-sP3 → CA-sM1 | Décision / Amendment | Le sous-objectif Make devient plan validé. |

| ProductionOrder | CA-sM1 → AOp-sM1.1 | Ordre coordonné | Le plan est contextualisé pour l’opérationnel. |

| ProductionTaskAssignment | AOp-sM1.1 → AOe-sM1.2 | Instruction d’exécution | La tâche de production est affectée. |

| ExecutionStart | AOe-sM1.2 → AOp-sM1.1 | Preuve d’exécution | Le lancement réel est confirmé à T=66,0 s. |

| FIGURE 16.3 — CAPTURE / ILLUSTRATION À INSÉRERPassage Source → Make à T=60–66 s. Mettre en évidence MaterialAvailable, ProductionPlan, ProductionOrder, ProductionTaskAssignment et ExecutionStart. |  |  |  |



### 16.6 Make comme chemin temporel critique de l’exécution

Make concentre l’essentiel du temps écoulé. L’exécution Make démarre à T=66,0 s et la production complète est signalée à T=399,1 s, soit environ 333,1 s d’occupation chronologique. Rapporté au Lead Time de 372,05 s, ce segment représente environ 89,5 % de la durée de bout en bout. Si l’on prend comme origine la disponibilité matière à T=60,0 s, la fenêtre jusqu’au produit fini disponible est de 339,1 s, soit environ 91,1 % du Lead Time.

Les KPI par poste expliquent cette domination temporelle. La mise à disposition des matières sM1.2.1 présente un CT moyen de 52,34 s et un WT moyen de 26,92 s, avec une efficacité de 56,1 %. Le remplissage GPL sM1.3.2 présente un CT moyen de 93,32 s et un WT moyen de 18,96 s. Ces deux postes concentrent à la fois du traitement et de l’attente. À T=390 s, le niveau stratégique signale d’ailleurs sM1.2.1 comme goulot avec WT≈26,9 s.

| Poste | Rôle | CT moyen (s) | WT moyen (s) | Efficacité | Lecture causale |

| --- | --- | --- | --- | --- | --- |

| sM1.2.1 | Mise à disposition matières | 52.34 | 26.92 | 56,1 % | Goulot observé ; attente élevée avant production. |

| sM1.3.2 | Remplissage GPL carrousel | 93.32 | 18.96 | 76,5 % | Opération machine longue + attente ; panne AER observée. |

| sM1.3.4 | Contrôle de poids | 29.25 | 4.74 | 73,9 % | Contrôle qualité participant au CT Produce and Test. |

| sM1.3.6 | 2e contrôle étanchéité | 29.25 | 4.74 | 73,9 % | Contrôle aval du remplissage. |

| sM1.5.1 | Transfert magasin PF | 49.3 | 0 | 85,0 % | Étape de mise à disposition finale du produit. |



La ressource MAC_1 — carrousel de remplissage GPL — a une capacité de 8 unités, un cycle nominal de 88 s, un MTBF de 28 800 s et un MTTR de 1 800 s, soit une disponibilité théorique de 94,12 %. Le CT moyen observé de 93,32 s sur sM1.3.2 ne doit pas être comparé mécaniquement au cycle nominal : il inclut le comportement runtime du poste et le contexte de la simulation, tandis que la disponibilité théorique est une propriété de fiabilité de la machine.

| FIGURE 16.4 : CAPTURE À INSÉRERVue Make autour du carrousel sM1.3.2 et du goulot sM1.2.1. Idéalement, montrer simultanément la ressource machine, les entités en cours et les indicateurs CT/WT. |

| --- |



### 16.7 Boucle adaptative AER : de l’incident local à l’arbitrage tactique

L’exécution ne suit pas uniquement une séquence planifiée. À T=210,0 s, sM1.3.2 signale une PANNE. Le message est partagé via le Blackboard, reçu par AOp-sM1.1, consolidé par CA-sM1 puis transmis à AT-sP3 sous forme de ProcessDeviationReport. À T=213,0 s, le tactique émet une PriorityDecision avec action REBALANCE. La décision redescend ensuite vers CA-sM1, AOp-sM1.1 et un agent d’exécution ciblé, qui applique l’instruction et produit un ACK_REBALANCE. L’accusé remonte jusqu’au tactique à T=229,0 s.

Cette boucle constitue une preuve de fermeture décisionnelle : détection → diffusion → consolidation → arbitrage → contextualisation → application → accusé. Le Blackboard sert ici de mémoire partagée et de support de preuve ; il ne remplace ni le superviseur, ni le coordinateur, ni le tactique. L’AHP local utilisé pour prioriser REBALANCE reste par ailleurs distinct du calcul du PI global : l’un arbitre une action locale, l’autre agrège des métriques de performance.

| Temps | Niveau | Événement | Fonction dans la boucle |

| --- | --- | --- | --- |

| 210 s | Exécution | PANNE sM1.3.2 | Détection d’un écart local. |

| 211–213 s | Pilotage → coordination → tactique | OperationalException / ProcessDeviationReport | Consolidation et escalade sans saut hiérarchique. |

| 213 s | Tactique AT-sP3 | PriorityDecision : REBALANCE | Arbitrage AHP de l’action à entreprendre. |

| 214–226 s | Coordination → pilotage → exécution | SupervisorInstruction / OperationalInstruction | Traduction de la décision en action locale. |

| 226–229 s | Exécution → pilotage → coordination → tactique | ACK_REBALANCE / acknowledgements | Preuve d’application et fermeture de boucle. |

| FIGURE 16.5 — CAPTURE / ILLUSTRATION À INSÉRERBoucle AER complète de l’incident Make : sM1.3.2 → Blackboard → AOp-sM1.1 → CA-sM1 → AT-sP3 → REBALANCE → exécution → ACK. Représentation recommandée : diagramme en boucle avec timestamps 210–229 s. |  |  |  |



### 16.8 Deliver final : clôturer physiquement la commande et produire la preuve de service

Lorsque Make annonce ProductAvailableForDelivery à T=399,1 s, Deliver reprend la main. La séquence DeliveryPlan → DeliveryOrder → DeliveryTaskAssignment → InventoryReserved → Picking → Packing → Loading → ShipmentOrder → DeliveryCompleted est entièrement ordonnée par les numéros de séquence 51 à 63. Plusieurs messages partagent T=399,1 s, ce qui traduit une propagation événementielle compacte dans le modèle et non l’absence de durée physique pour les activités correspondantes.

Le résultat final est double. Sur le plan physique, deux unités sont livrées sur deux, sans rebut global ni rework comptabilisé. Sur le plan de service, DeliveryCompleted porte le statut EN_RETARD. Ce statut est ensuite consolidé par AOp-sD1.7, CA-sD1 et AT-sP4 avant d’être transmis à AS-sP1 avec un délai total de 372,1 s. La chaîne Deliver produit donc simultanément la clôture de la commande et la preuve de son niveau de service.

| Dimension de service | Valeur observée | Conséquence |

| --- | --- | --- |

| Quantité commandée / livrée | 2 / 2 | Commande complète. |

| Exactitude article / quantité | 1,0 / 1,0 | Conformité quantitative maximale. |

| Rebuts / rework global | 0 / 0 | Aucune perte globale comptabilisée. |

| Ponctualité | 0,0 — statut EN_RETARD | Dégrade directement Reliability. |

| Lead Time | 372,05 s | Durée de bout en bout utilisée dans l’analyse globale. |



### 16.9 Lecture intégrée : objectifs descendants, preuves ascendantes et performance

L’exécution combine deux circulations symétriques. La circulation descendante transforme l’objectif global de satisfaction de la commande en décisions tactiques, ordres de coordination puis tâches opérationnelles. La circulation ascendante transforme les faits d’exécution en confirmations, rapports de processus et synthèses stratégiques. La chaîne de performance s’appuie sur ces faits, mais reste un mécanisme de calcul séparé des agents.

| Phase | Décision descendante | Fait / preuve ascendante | Mesure / lecture principale |

| --- | --- | --- | --- |

| Deliver initial | Vérifier stock puis faisabilité | InventoryAvailabilityResponse ; InventoryShortageReport | Stock disponible ; bascule vers Make. |

| Make faisabilité | Vérifier capacité et matières | CapacityAvailabilityResponse ; MaterialShortageDetected | Capacité disponible mais dépendance matière. |

| Source | ProcurementPlan / ProcurementOrder | MaterialReceived ; ProcurementCompleted ; MaterialAvailable | CT Source ; disponibilité matière. |

| Make exécution | ProductionPlan / ProductionTaskAssignment | ExecutionStart/Progress/End ; OperationalReport | CT/WT Make ; goulot ; effets sur RS. |

| Deliver final | DeliveryPlan / tâches spécialisées | DeliveryCompleted ; ProcessStatusReport ; MacroProcessReport | Complétude, exactitude, ponctualité, Lead Time. |

| Adaptation AER | PriorityDecision REBALANCE | ACK_REBALANCE / ProcessAcknowledgement | Preuve de fermeture de boucle, distincte du PI. |



### 16.10 Lecture causale phase → mesure → attribut

La causalité analytique doit être conservée jusqu’au niveau de l’attribut : les événements Source/Make/Deliver génèrent des durées et statuts ; ces observations alimentent des métriques SCOR ; les métriques sont normalisées avant agrégation. Une durée, un coût et un ratio ne deviennent comparables qu’après passage sur l’échelle commune de performance.

| Phénomène observé | Observation / VSM | Métrique / famille | Attribut |

| --- | --- | --- | --- |

| Commande complète et exacte mais tardive | Statut, quantité, exactitude, date | RL.2.1, RL.2.2, RL.3.33, RL.3.35 | Reliability |

| Durées Source/Make/Deliver et Lead Time | CT, WT, Lead Time, Dwell | RS.2.x, RS.1.1, RS.3.94 | Responsiveness |

| Débit et stabilité du système | Throughput, variabilité / proxies | AG.* et proxy utilisation | Agility |

| Coûts cumulés rapportés au chiffre d’affaires | Coût / CA | CO.1.1 | Cost |

| Disponibilité / stock / jours de couverture | Disponibilité machine, Inventory Days | AM.* | Asset Management |



### 16.11 Interprétation du PI et portée scientifique

Le PI de 8,248/10 ne doit pas être utilisé comme preuve qu’aucune dimension n’est défaillante. Il synthétise des attributs contrastés : la ponctualité pénalise Reliability, Agility reste moyenne, tandis que Responsiveness, Cost et Asset Management sont favorables dans la configuration courante. La pondération et la fuzzification permettent de combiner ces dimensions sans supprimer leur hétérogénéité d’origine.

Cette exécution démontre la traçabilité interne d’une chaîne décisionnelle et d’une chaîne de mesure sur une trajectoire complète. Elle ne suffit pas, à elle seule, à généraliser la performance de l’entreprise à toutes les commandes, à calibrer définitivement les bornes Bottom/Perfect ni à valider statistiquement la robustesse de tous les arbitrages. Ces limites sont maintenues explicitement au chapitre 15.

| Portée de la version finale — La consolidation réduit les répétitions entre synthèse, discussion académique et fiches agents. Le chapitre 14 présente les résultats, le chapitre 16 explique les mécanismes, et le chapitre 17 fournit la preuve agent par agent. |

| --- |



## 17. Traçabilité détaillée agent par agent

Ce chapitre reconstruit la participation réelle des agents à partir de la feuille « Propagation agents et flux » et la confronte à l’architecture exportée. La logique retenue n’est pas de répéter la description générale des classes d’agents, mais d’établir pour chacun ce qu’il reçoit effectivement, ce qu’il transforme, ce qu’il transmet et quelle preuve il laisse dans cette exécution. Les fiches distinguent donc le rôle configuré du rôle observé.

| Règle de preuve — Une responsabilité n’est attribuée à un agent dans ce chapitre que si elle est soit explicitement portée par l’architecture exportée, soit directement observable dans une communication, un rapport ou l’audit AER de cette exécution. L’absence d’un message dans la chaîne de commande n’implique pas que l’agent n’existe pas dans le modèle ; elle signifie seulement qu’il n’intervient pas dans ce chemin métier précis. |

| --- |



### 17.1 Méthode de construction des fiches de participation

Trois sources du même classeur sont croisées : « Architecture agents » pour le niveau et le rattachement hiérarchique ; « Propagation agents et flux » pour les 66 communications ordonnées de la commande ; « Audit propagation AER » pour la boucle locale d’incident, d’arbitrage et d’accusé d’exécution. Cette méthode permet de séparer la chaîne métier de satisfaction de la commande et la chaîne adaptative holonique.

| Source exportée | Ce qu’elle prouve | Usage dans les fiches |

| --- | --- | --- |

| Architecture agents | Niveau, identifiant logique, processus, parent/enfant | Rattachement hiérarchique et domaine de responsabilité. |

| Propagation agents et flux | Émetteur, destinataire, message, phase, timestamp, séquence | Participation réelle à la commande et transformation des informations. |

| Audit propagation AER | Incident local, Blackboard, escalade, AHP, REBALANCE, ACK | Participation à la boucle adaptative hors chronologie métier ordinaire. |

| KPI / pipeline performance | Mesures et agrégations issues du runtime | Lien entre faits produits par l’exécution et lecture de performance. |



### 17.2 Carte des participants réellement observés

| Agent | Niveau | Domaine | 1re intervention | Dernière | Émis | Reçus |

| --- | --- | --- | --- | --- | --- | --- |

| AOe-sD1.2 | EXÉCUTION | Deliver / Order Management | 27.0 s | 40.0 s | 2 | 2 |

| AOe-sD1.8 | EXÉCUTION | Deliver / Inventory | 32.0 s | 399.1 s | 2 | 2 |

| AOp-sD1.1 | PILOTAGE OPÉRATIONNEL | Deliver / validation | 32.0 s | 32.0 s | 1 | 1 |

| AOp-sD1.3 | PILOTAGE OPÉRATIONNEL | Deliver / préparation-expédition | 32.0 s | 399.1 s | 7 | 8 |

| AT-sP4 | TACTIQUE | Plan Deliver | 32.0 s | 399.1 s | 4 | 5 |

| CA-sD1 | COORDINATION | Deliver | 32.0 s | 399.1 s | 5 | 4 |

| AT-sP3 | TACTIQUE | Plan Make | 36.0 s | 399.1 s | 5 | 5 |

| AOe-sM1.2 | EXÉCUTION | Make / disponibilité & lancement | 40.0 s | 66.0 s | 3 | 3 |

| AOe-sS1.2 | EXÉCUTION | Source / Procurement | 40.0 s | 40.0 s | 3 | 3 |

| AOe-sS1.3 | EXÉCUTION | Source / Receiving | 40.0 s | 60.0 s | 1 | 1 |

| AOp-sM1.1 | PILOTAGE OPÉRATIONNEL | Make | 40.0 s | 399.1 s | 5 | 8 |

| AOp-sS1.1 | PILOTAGE OPÉRATIONNEL | Source | 40.0 s | 60.0 s | 4 | 4 |

| AT-sP2 | TACTIQUE | Plan Source | 40.0 s | 60.0 s | 4 | 3 |

| CA-sM1 | COORDINATION | Make | 40.0 s | 399.1 s | 4 | 4 |

| CA-sS1 | COORDINATION | Source | 40.0 s | 60.0 s | 4 | 4 |

| AOe-sM1.3 | EXÉCUTION | Make / production | 309.1 s | 399.1 s | 3 | 0 |

| AOe-sD1.10 | EXÉCUTION | Deliver / Packing | 399.1 s | 399.1 s | 1 | 1 |

| AOe-sD1.11 | EXÉCUTION | Deliver / Loading | 399.1 s | 399.1 s | 1 | 1 |

| AOe-sD1.12 | EXÉCUTION | Deliver / Transport | 399.1 s | 399.1 s | 2 | 1 |

| AOe-sD1.9 | EXÉCUTION | Deliver / Picking | 399.1 s | 399.1 s | 1 | 1 |

| AOp-sD1.7 | PILOTAGE OPÉRATIONNEL | Deliver / clôture | 399.1 s | 399.1 s | 1 | 1 |

| AS-sP1 | STRATÉGIQUE | Plan global / supervision | 399.1 s | 399.1 s | 0 | 1 |



La densité de communication n’est pas assimilée à une importance hiérarchique. Un agent opérationnel peut échanger davantage de messages qu’un agent stratégique parce qu’il exécute plusieurs tâches élémentaires. À l’inverse, AS-sP1 n’apparaît qu’à la clôture de la chaîne de commande, mais il reçoit le rapport macro consolidé qui représente le niveau de synthèse le plus élevé de cette trajectoire.

Figure 17.1 — Volume de communications émises et reçues par les principaux agents internes de l’exécution.

Figure 17.2 — Fenêtres d’intervention des agents dans la chaîne ordonnée de la commande.

| FIGURE 17.3 : CAPTURE ANYLOGIC À INSÉRERVue holonique ou architecture agents pendant l’exécution, avec AS-sP1, AT-sP2/3/4, CA-sS1/M1/D1 et les agents opérationnels visibles. Privilégier une capture où les états/couleurs runtime sont lisibles. |

| --- |



### 17.3 Agent stratégique AS-sP1

L’agent stratégique intervient comme niveau de synthèse et de supervision globale. Dans la chaîne de la commande, il reçoit à T=399,1 s le MacroProcessReport émis par AT-sP4, contenant le statut EN_RETARD et le délai total. L’audit AER montre en parallèle une décision stratégique de planification à T=60 s et la table des décisions holoniques signale un goulot à T=390 s. Son rôle observé est donc de recevoir la performance consolidée et de surveiller les déséquilibres globaux, non de piloter directement chaque tâche.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AS-sP1 |  |  |  |  |

| Niveau | STRATÉGIQUE |  |  |  |  |

| Domaine | Plan global / supervision |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=399.1 s → T=399.1 s |  |  |  |  |

| Communications | 0 émises / 1 reçues |  |  |  |  |

| Phases AER | REPORT |  |  |  |  |

| Processus observés | Plan Deliver -> Strategic |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 399.1 | Reçoit | AT-sP4 | MacroProcessReport | REPORT | Plan Deliver -> Strategic |

| Interprétation : Il faut distinguer deux temporalités : la propagation centrée commande fait apparaître AS-sP1 à la clôture ; les mécanismes holoniques transversaux peuvent le mobiliser pendant l’exécution sur des questions de planification ou de goulot. |  |  |  |  |  |



### 17.4 Agent tactique Deliver AT-sP4

AT-sP4 porte la faisabilité et la planification Deliver. Il reçoit la demande de faisabilité et le constat de rupture produit fini, transfère le problème à AT-sP3, récupère la réponse Make, fixe/relaye la date promise, puis reprend la main à la disponibilité du produit fini. À la clôture, il reçoit le ProcessStatusReport de CA-sD1 et transmet le MacroProcessReport au stratégique.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AT-sP4 |  |  |  |  |

| Niveau | TACTIQUE |  |  |  |  |

| Domaine | Plan Deliver |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=32.0 s → T=399.1 s |  |  |  |  |

| Communications | 4 émises / 5 reçues |  |  |  |  |

| Phases AER | AMENDMENT, REPORT |  |  |  |  |

| Processus observés | Deliver, Plan Deliver, Plan Deliver -> Plan Make, Plan Deliver -> Strategic, Plan Make -> Plan Deliver |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 32.0 | Reçoit | CA-sD1 | OrderFeasibilityRequest | REPORT | Plan Deliver |

| 36.0 | Reçoit | CA-sD1 | InventoryShortageReport | REPORT | Deliver |

| 36.0 | Émet | AT-sP3 | OrderFeasibilityRequest | REPORT | Plan Deliver -> Plan Make |

| 40.0 | Reçoit | AT-sP3 | MakeFeasibilityResponse | REPORT | Plan Make -> Plan Deliver |

| 40.0 | Émet | CA-sD1 | PromisedDeliveryDate | AMENDMENT | Deliver |

| 399.1 | Reçoit | AT-sP3 | ProductAvailableForDelivery | REPORT | Plan Make -> Plan Deliver |

| 399.1 | Reçoit | CA-sD1 | ProcessStatusReport | REPORT | Plan Deliver |

| 399.1 | Émet | CA-sD1 | DeliveryPlan | AMENDMENT | Deliver |

| 399.1 | Émet | AS-sP1 | MacroProcessReport | REPORT | Plan Deliver -> Strategic |

| Interprétation — AT-sP4 est le pivot entre la demande de service client et les contraintes de réalisation. Il ne réserve ni ne transporte physiquement le produit : il transforme l’état consolidé en décisions Deliver et en reporting macro. |  |  |  |  |  |



### 17.5 Agent tactique Make AT-sP3

AT-sP3 transforme la rupture produit fini en problème de faisabilité Make. Il déclenche CA-sM1, reçoit le diagnostic matière, ouvre la coordination tactique avec Source, récupère MaterialAvailabilityResponse, transmet une réponse de faisabilité à Deliver puis lance ProductionPlan lorsque la matière devient disponible. À la fin de Make, il transmet ProductAvailableForDelivery à AT-sP4.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AT-sP3 |  |  |  |  |

| Niveau | TACTIQUE |  |  |  |  |

| Domaine | Plan Make |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=36.0 s → T=399.1 s |  |  |  |  |

| Communications | 5 émises / 5 reçues |  |  |  |  |

| Phases AER | AMENDMENT, REPORT |  |  |  |  |

| Processus observés | Make, Plan Deliver -> Plan Make, Plan Make, Plan Make -> Plan Deliver, Plan Make -> Plan Source, Plan Source -> Plan Make |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 36.0 | Reçoit | AT-sP4 | OrderFeasibilityRequest | REPORT | Plan Deliver -> Plan Make |

| 40.0 | Reçoit | CA-sM1 | MakeFeasibilityResponse | REPORT | Plan Make |

| 40.0 | Reçoit | AT-sP2 | MaterialAvailabilityResponse | REPORT | Plan Source -> Plan Make |

| 40.0 | Émet | CA-sM1 | MakeFeasibilityCheck | AMENDMENT | Make |

| 40.0 | Émet | AT-sP2 | MaterialAvailabilityRequest | AMENDMENT | Plan Make -> Plan Source |

| 40.0 | Émet | AT-sP4 | MakeFeasibilityResponse | REPORT | Plan Make -> Plan Deliver |

| 60.0 | Reçoit | AT-sP2 | MaterialAvailable | REPORT | Plan Source -> Plan Make |

| 60.0 | Émet | CA-sM1 | ProductionPlan | AMENDMENT | Make |

| 399.1 | Reçoit | CA-sM1 | ProductionCompleted | REPORT | Plan Make |

| 399.1 | Émet | AT-sP4 | ProductAvailableForDelivery | REPORT | Plan Make -> Plan Deliver |

| Interprétation — Dans l’audit AER, AT-sP3 est également l’arbitre tactique de l’incident Make : il reçoit ProcessDeviationReport et émet PriorityDecision avec action REBALANCE. Cette action AHP locale est distincte de l’agrégation du PI. |  |  |  |  |  |



### 17.6 Agent tactique Source AT-sP2

AT-sP2 porte la réponse tactique Source. Il reçoit de Make la liste des matières manquantes, délègue la faisabilité à CA-sS1, consolide la date de disponibilité, formalise ProcurementPlan puis notifie MaterialAvailable lorsque la réception est terminée.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AT-sP2 |  |  |  |  |

| Niveau | TACTIQUE |  |  |  |  |

| Domaine | Plan Source |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=40.0 s → T=60.0 s |  |  |  |  |

| Communications | 4 émises / 3 reçues |  |  |  |  |

| Phases AER | AMENDMENT, REPORT |  |  |  |  |

| Processus observés | Plan Make -> Plan Source, Plan Source, Plan Source -> Plan Make, Source |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 40.0 | Reçoit | AT-sP3 | MaterialAvailabilityRequest | AMENDMENT | Plan Make -> Plan Source |

| 40.0 | Reçoit | CA-sS1 | SourceFeasibilityResponse | REPORT | Plan Source |

| 40.0 | Émet | CA-sS1 | SourceFeasibilityRequest | AMENDMENT | Source |

| 40.0 | Émet | AT-sP3 | MaterialAvailabilityResponse | REPORT | Plan Source -> Plan Make |

| 40.0 | Émet | CA-sS1 | ProcurementPlan | AMENDMENT | Source |

| 60.0 | Reçoit | CA-sS1 | ProcurementCompleted | REPORT | Source |

| 60.0 | Émet | AT-sP3 | MaterialAvailable | REPORT | Plan Source -> Plan Make |

| Interprétation — Son apport à l’objectif global est de transformer un déficit matière en engagement d’approvisionnement contrôlable. Il ne réalise pas lui-même l’achat ni la réception physique. |  |  |  |  |  |



### 17.7 Coordinateur Deliver CA-sD1

CA-sD1 assure la coordination du domaine Deliver. Il reçoit OrderValidated, remonte OrderFeasibilityRequest et InventoryShortageReport au tactique, reçoit les décisions de date promise et de plan de livraison, puis les contextualise vers les agents de pilotage Deliver. À la fin, il agrège le rapport opérationnel et le transmet à AT-sP4.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | CA-sD1 |  |  |  |  |

| Niveau | COORDINATION |  |  |  |  |

| Domaine | Deliver |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=32.0 s → T=399.1 s |  |  |  |  |

| Communications | 5 émises / 4 reçues |  |  |  |  |

| Phases AER | AMENDMENT, REPORT |  |  |  |  |

| Processus observés | Deliver, Plan Deliver |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 32.0 | Reçoit | AOp-sD1.1 | OrderValidated | REPORT | Deliver |

| 32.0 | Émet | AT-sP4 | OrderFeasibilityRequest | REPORT | Plan Deliver |

| 36.0 | Émet | AT-sP4 | InventoryShortageReport | REPORT | Deliver |

| 40.0 | Reçoit | AT-sP4 | PromisedDeliveryDate | AMENDMENT | Deliver |

| 40.0 | Émet | AOp-sD1.3 | OrderConfirmationOrder | AMENDMENT | Deliver |

| 399.1 | Reçoit | AT-sP4 | DeliveryPlan | AMENDMENT | Deliver |

| 399.1 | Reçoit | AOp-sD1.7 | OperationalReport | REPORT | Deliver |

| 399.1 | Émet | AOp-sD1.3 | DeliveryOrder | AMENDMENT | Deliver |

| 399.1 | Émet | AT-sP4 | ProcessStatusReport | REPORT | Plan Deliver |

| Interprétation — La feuille de propagation montre que CA-sD1 relie plusieurs agents de pilotage Deliver au même tactique. Il joue un rôle de consolidation et de changement de granularité, plutôt qu’un rôle d’exécution physique. |  |  |  |  |  |



### 17.8 Coordinateur Make CA-sM1

CA-sM1 est le coordinateur Make. Il reçoit MakeFeasibilityCheck, ordonne la vérification capacité/matière, consolide MakeConstraintReport, reçoit ProductionPlan et transmet ProductionOrder. Il agrège ensuite OperationalReport et émet ProductionCompleted vers AT-sP3.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | CA-sM1 |  |  |  |  |

| Niveau | COORDINATION |  |  |  |  |

| Domaine | Make |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=40.0 s → T=399.1 s |  |  |  |  |

| Communications | 4 émises / 4 reçues |  |  |  |  |

| Phases AER | AMENDMENT, REPORT |  |  |  |  |

| Processus observés | Make, Plan Make |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 40.0 | Reçoit | AT-sP3 | MakeFeasibilityCheck | AMENDMENT | Make |

| 40.0 | Reçoit | AOp-sM1.1 | MakeConstraintReport | REPORT | Make |

| 40.0 | Émet | AOp-sM1.1 | CapacityAndMaterialCheckOrder | AMENDMENT | Make |

| 40.0 | Émet | AT-sP3 | MakeFeasibilityResponse | REPORT | Plan Make |

| 60.0 | Reçoit | AT-sP3 | ProductionPlan | AMENDMENT | Make |

| 60.0 | Émet | AOp-sM1.1 | ProductionOrder | AMENDMENT | Make |

| 399.1 | Reçoit | AOp-sM1.1 | OperationalReport | REPORT | Make |

| 399.1 | Émet | AT-sP3 | ProductionCompleted | REPORT | Plan Make |

| Interprétation : Dans la boucle AER, CA-sM1 est aussi le point de passage obligé entre le superviseur Make et AT-sP3 : il consolide l’exception, contextualise la décision REBALANCE et agrège l’accusé. |  |  |  |  |  |



### 17.9 Coordinateur Source CA-sS1

CA-sS1 coordonne Source. Il transforme SourceFeasibilityRequest en SupplierCheckOrder, agrège SourceOperationalFeasibility, transmet SourceFeasibilityResponse, puis convertit ProcurementPlan en ProcurementOrder. À la fin de l’approvisionnement, il reçoit OperationalReport et notifie ProcurementCompleted.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | CA-sS1 |  |  |  |  |

| Niveau | COORDINATION |  |  |  |  |

| Domaine | Source |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=40.0 s → T=60.0 s |  |  |  |  |

| Communications | 4 émises / 4 reçues |  |  |  |  |

| Phases AER | AMENDMENT, REPORT |  |  |  |  |

| Processus observés | Plan Source, Source |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 40.0 | Reçoit | AT-sP2 | SourceFeasibilityRequest | AMENDMENT | Source |

| 40.0 | Reçoit | AOp-sS1.1 | SourceOperationalFeasibility | REPORT | Source |

| 40.0 | Reçoit | AT-sP2 | ProcurementPlan | AMENDMENT | Source |

| 40.0 | Émet | AOp-sS1.1 | SupplierCheckOrder | AMENDMENT | Source |

| 40.0 | Émet | AT-sP2 | SourceFeasibilityResponse | REPORT | Plan Source |

| 40.0 | Émet | AOp-sS1.1 | ProcurementOrder | AMENDMENT | Source |

| 60.0 | Reçoit | AOp-sS1.1 | OperationalReport | REPORT | Source |

| 60.0 | Émet | AT-sP2 | ProcurementCompleted | REPORT | Source |

| Interprétation — Son rôle observé est de maintenir la cohérence entre le plan tactique Source et les actions opérationnelles d’achat/réception. |  |  |  |  |  |



### 17.10 Pilotage Deliver : AOp-sD1.1

AOp-sD1.1 apparaît lors de l’enregistrement initial. Il reçoit OrderReceived de AOe-sD1.2 puis transmet OrderValidated à CA-sD1. Cette intervention courte mais structurante ferme la phase de contrôle de forme et d’entrée de commande.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOp-sD1.1 |  |  |  |  |

| Niveau | PILOTAGE OPÉRATIONNEL |  |  |  |  |

| Domaine | Deliver / validation |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=32.0 s → T=32.0 s |  |  |  |  |

| Communications | 1 émises / 1 reçues |  |  |  |  |

| Phases AER | REPORT |  |  |  |  |

| Processus observés | Deliver |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 32.0 | Reçoit | AOe-sD1.2 | OrderReceived | REPORT | Deliver |

| 32.0 | Émet | CA-sD1 | OrderValidated | REPORT | Deliver |

| Interprétation — L’exécution courant montre que le pilotage Deliver est distribué entre plusieurs AOp-sD1.x ; il ne faut donc pas regrouper artificiellement toutes les responsabilités dans un superviseur unique. |  |  |  |  |  |



### 17.11 Pilotage Deliver : AOp-sD1.3

AOp-sD1.3 est le principal orchestrateur opérationnel Deliver de cette exécution. Il déclenche le contrôle Inventory, affecte la confirmation client, puis, après production, délègue successivement Inventory, Picking, Packing, Loading et Shipment. Il reçoit les preuves d’exécution correspondantes.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOp-sD1.3 |  |  |  |  |

| Niveau | PILOTAGE OPÉRATIONNEL |  |  |  |  |

| Domaine | Deliver / préparation-expédition |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=32.0 s → T=399.1 s |  |  |  |  |

| Communications | 7 émises / 8 reçues |  |  |  |  |

| Phases AER | AMENDMENT, EXECUTION, REPORT |  |  |  |  |

| Processus observés | Deliver |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 32.0 | Reçoit | AOe-sD1.8 | InventoryAvailabilityResponse | REPORT | Deliver |

| 32.0 | Émet | AOe-sD1.8 | InventoryCheckRequest | AMENDMENT | Deliver |

| 40.0 | Reçoit | CA-sD1 | OrderConfirmationOrder | AMENDMENT | Deliver |

| 40.0 | Émet | AOe-sD1.2 | CustomerConfirmationTask | AMENDMENT | Deliver |

| 399.1 | Reçoit | CA-sD1 | DeliveryOrder | AMENDMENT | Deliver |

| 399.1 | Reçoit | AOe-sD1.8 | InventoryReserved | EXECUTION | Deliver |

| 399.1 | Reçoit | AOe-sD1.9 | PickingCompleted | EXECUTION | Deliver |

| 399.1 | Reçoit | AOe-sD1.10 | PackingCompleted | EXECUTION | Deliver |

| 399.1 | Reçoit | AOe-sD1.11 | LoadingCompleted | EXECUTION | Deliver |

| 399.1 | Reçoit | AOe-sD1.12 | ExecutionStart | EXECUTION | Deliver |

| 399.1 | Émet | AOe-sD1.8 | DeliveryTaskAssignment | AMENDMENT | Deliver |

| 399.1 | Émet | AOe-sD1.9 | PickingTask | AMENDMENT | Deliver |

| … | … | … | 3 événements supplémentaires dans l’export |  |  |

| Interprétation — Sa fonction est celle d’un orchestrateur : il envoie des tâches et reçoit des confirmations. Les agents AOe-sD1.8 à .12 conservent l’exécution physique ou transactionnelle distincte. |  |  |  |  |  |



### 17.12 Pilotage Deliver : AOp-sD1.7

AOp-sD1.7 intervient à la clôture : AOe-sD1.12 lui transmet DeliveryCompleted avec le statut EN_RETARD ; il consolide ce résultat dans OperationalReport vers CA-sD1.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOp-sD1.7 |  |  |  |  |

| Niveau | PILOTAGE OPÉRATIONNEL |  |  |  |  |

| Domaine | Deliver / clôture |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=399.1 s → T=399.1 s |  |  |  |  |

| Communications | 1 émises / 1 reçues |  |  |  |  |

| Phases AER | EXECUTION, REPORT |  |  |  |  |

| Processus observés | Deliver |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 399.1 | Reçoit | AOe-sD1.12 | DeliveryCompleted | EXECUTION | Deliver |

| 399.1 | Émet | CA-sD1 | OperationalReport | REPORT | Deliver |

| Interprétation — Cette séparation entre orchestration (AOp-sD1.3) et clôture/reporting (AOp-sD1.7) est explicitement observable dans l’export et doit être conservée dans l’interprétation. |  |  |  |  |  |



### 17.13 Pilotage Make : AOp-sM1.1

AOp-sM1.1 est le superviseur opérationnel Make le plus central. Il reçoit les ordres de CA-sM1, délègue les contrôles à AOe-sM1.2, collecte les réponses de capacité et de matière, remonte la contrainte, puis distribue ProductionTaskAssignment et reçoit ExecutionStart/Progress/End. Il produit enfin OperationalReport.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOp-sM1.1 |  |  |  |  |

| Niveau | PILOTAGE OPÉRATIONNEL |  |  |  |  |

| Domaine | Make |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=40.0 s → T=399.1 s |  |  |  |  |

| Communications | 5 émises / 8 reçues |  |  |  |  |

| Phases AER | AMENDMENT, EXECUTION, REPORT |  |  |  |  |

| Processus observés | Make |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 40.0 | Reçoit | CA-sM1 | CapacityAndMaterialCheckOrder | AMENDMENT | Make |

| 40.0 | Reçoit | AOe-sM1.2 | CapacityAvailabilityResponse | REPORT | Make |

| 40.0 | Reçoit | AOe-sM1.2 | MaterialShortageDetected | REPORT | Make |

| 40.0 | Émet | AOe-sM1.2 | CapacityCheckRequest | AMENDMENT | Make |

| 40.0 | Émet | AOe-sM1.2 | MaterialCheckRequest | AMENDMENT | Make |

| 40.0 | Émet | CA-sM1 | MakeConstraintReport | REPORT | Make |

| 60.0 | Reçoit | CA-sM1 | ProductionOrder | AMENDMENT | Make |

| 60.0 | Émet | AOe-sM1.2 | ProductionTaskAssignment | AMENDMENT | Make |

| 66.0 | Reçoit | AOe-sM1.2 | ExecutionStart | EXECUTION | Make |

| 309.1 | Reçoit | AOe-sM1.3 | ExecutionProgress | EXECUTION | Make |

| 399.1 | Reçoit | AOe-sM1.3 | ExecutionProgress | EXECUTION | Make |

| 399.1 | Reçoit | AOe-sM1.3 | ExecutionEnd | EXECUTION | Make |

| … | … | … | 1 événements supplémentaires dans l’export |  |  |

| Interprétation — L’audit AER le montre aussi comme récepteur de la panne locale, relais de l’instruction REBALANCE et récepteur de l’ACK. Il assure donc à la fois pilotage nominal et adaptation locale. |  |  |  |  |  |



### 17.14 Pilotage Source : AOp-sS1.1

AOp-sS1.1 supervise Source. Il reçoit SupplierCheckOrder et ProcurementOrder, délègue les vérifications et l’achat à AOe-sS1.2, reçoit MaterialReceived de AOe-sS1.3 puis remonte SourceOperationalFeasibility et OperationalReport.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOp-sS1.1 |  |  |  |  |

| Niveau | PILOTAGE OPÉRATIONNEL |  |  |  |  |

| Domaine | Source |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=40.0 s → T=60.0 s |  |  |  |  |

| Communications | 4 émises / 4 reçues |  |  |  |  |

| Phases AER | AMENDMENT, EXECUTION, REPORT |  |  |  |  |

| Processus observés | Source |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 40.0 | Reçoit | CA-sS1 | SupplierCheckOrder | AMENDMENT | Source |

| 40.0 | Reçoit | AOe-sS1.2 | SupplierAvailabilityResponse | REPORT | Source |

| 40.0 | Reçoit | CA-sS1 | ProcurementOrder | AMENDMENT | Source |

| 40.0 | Émet | AOe-sS1.2 | SupplierAvailabilityCheck | AMENDMENT | Source |

| 40.0 | Émet | CA-sS1 | SourceOperationalFeasibility | REPORT | Source |

| 40.0 | Émet | AOe-sS1.2 | PurchaseOrderTask | AMENDMENT | Source |

| 60.0 | Reçoit | AOe-sS1.3 | MaterialReceived | EXECUTION | Source |

| 60.0 | Émet | CA-sS1 | OperationalReport | REPORT | Source |

| Interprétation — Il fait le lien entre deux familles d’exécution différentes : Procurement et Receiving. Le matériau n’est considéré disponible au niveau tactique qu’après cette consolidation. |  |  |  |  |  |



### 17.15 Exécution Source : AOe-sS1.2 Procurement

AOe-sS1.2 est l’agent d’exécution Procurement. Il vérifie la disponibilité fournisseur, échange RequestForAvailability / SupplierCommitment, reçoit PurchaseOrderTask et émet PurchaseOrder. Il matérialise donc l’acte d’achat et la relation transactionnelle avec le fournisseur.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOe-sS1.2 |  |  |  |  |

| Niveau | EXÉCUTION |  |  |  |  |

| Domaine | Source / Procurement |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=40.0 s → T=40.0 s |  |  |  |  |

| Communications | 3 émises / 3 reçues |  |  |  |  |

| Phases AER | AMENDMENT, REPORT |  |  |  |  |

| Processus observés | Source |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 40.0 | Reçoit | AOp-sS1.1 | SupplierAvailabilityCheck | AMENDMENT | Source |

| 40.0 | Reçoit | SupplierActor | SupplierCommitment | REPORT | Source |

| 40.0 | Reçoit | AOp-sS1.1 | PurchaseOrderTask | AMENDMENT | Source |

| 40.0 | Émet | SupplierActor | RequestForAvailability | AMENDMENT | Source |

| 40.0 | Émet | AOp-sS1.1 | SupplierAvailabilityResponse | REPORT | Source |

| 40.0 | Émet | SupplierActor | PurchaseOrder | AMENDMENT | Source |

| Interprétation — Ses communications sont concentrées à T=40 s car le modèle représente de façon compacte la négociation/commande. Cette simultanéité ne signifie pas que les actions auraient une durée physique nulle dans une chaîne réelle. |  |  |  |  |  |



### 17.16 Exécution Source : AOe-sS1.3 Receiving

AOe-sS1.3 est l’agent Receiving. Il reçoit InboundDelivery du fournisseur puis, à T=60 s, transmet MaterialReceived avec les quantités effectivement reçues et stockées : GPL 25, bouteilles 2, accessoires 2.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOe-sS1.3 |  |  |  |  |

| Niveau | EXÉCUTION |  |  |  |  |

| Domaine | Source / Receiving |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=40.0 s → T=60.0 s |  |  |  |  |

| Communications | 1 émises / 1 reçues |  |  |  |  |

| Phases AER | EXECUTION |  |  |  |  |

| Processus observés | Source |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 40.0 | Reçoit | SupplierActor | InboundDelivery | EXECUTION | Source |

| 60.0 | Émet | AOp-sS1.1 | MaterialReceived | EXECUTION | Source |

| Interprétation — Cette communication constitue la preuve opérationnelle qui permet à Source de déclarer l’approvisionnement terminé et à Make de démarrer. |  |  |  |  |  |



### 17.17 Exécution Make : AOe-sM1.2

AOe-sM1.2 est mobilisé à la fois pour la vérification de capacité/matière et pour le lancement de l’exécution Make. Il reçoit CapacityCheckRequest et MaterialCheckRequest, répond capacité disponible / matières manquantes, puis reçoit ProductionTaskAssignment et émet ExecutionStart à T=66 s.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOe-sM1.2 |  |  |  |  |

| Niveau | EXÉCUTION |  |  |  |  |

| Domaine | Make / disponibilité & lancement |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=40.0 s → T=66.0 s |  |  |  |  |

| Communications | 3 émises / 3 reçues |  |  |  |  |

| Phases AER | AMENDMENT, EXECUTION, REPORT |  |  |  |  |

| Processus observés | Make |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 40.0 | Reçoit | AOp-sM1.1 | CapacityCheckRequest | AMENDMENT | Make |

| 40.0 | Reçoit | AOp-sM1.1 | MaterialCheckRequest | AMENDMENT | Make |

| 40.0 | Émet | AOp-sM1.1 | CapacityAvailabilityResponse | REPORT | Make |

| 40.0 | Émet | AOp-sM1.1 | MaterialShortageDetected | REPORT | Make |

| 60.0 | Reçoit | AOp-sM1.1 | ProductionTaskAssignment | AMENDMENT | Make |

| 66.0 | Émet | AOp-sM1.1 | ExecutionStart | EXECUTION | Make |

| Interprétation — Il matérialise le passage entre faisabilité et exécution. La disponibilité de capacité n’efface pas la contrainte matière : les deux réponses sont séparées dans l’exécution. |  |  |  |  |  |



### 17.18 Exécution Make : AOe-sM1.3

AOe-sM1.3 émet les preuves d’avancement et de fin de production : ExecutionProgress à T=309,1 s puis T=399,1 s, et ExecutionEnd à T=399,1 s. Il représente la production exécutée au niveau M1.3 dans la chaîne de commande.

| Champ | Valeur observée |  |  |  |  |

| --- | --- | --- | --- | --- | --- |

| Agent | AOe-sM1.3 |  |  |  |  |

| Niveau | EXÉCUTION |  |  |  |  |

| Domaine | Make / production |  |  |  |  |

| Fenêtre dans la chaîne de commande | T=309.1 s → T=399.1 s |  |  |  |  |

| Communications | 3 émises / 0 reçues |  |  |  |  |

| Phases AER | EXECUTION |  |  |  |  |

| Processus observés | Make |  |  |  |  |

| T | Sens | Interlocuteur | Message | Phase | Processus |

| 309.1 | Émet | AOp-sM1.1 | ExecutionProgress | EXECUTION | Make |

| 399.1 | Émet | AOp-sM1.1 | ExecutionProgress | EXECUTION | Make |

| 399.1 | Émet | AOp-sM1.1 | ExecutionEnd | EXECUTION | Make |

| Interprétation — L’incident local de carrousel est toutefois journalisé au niveau de la micro-activité sM1.3.2 dans l’audit AER. Le document distingue donc l’identifiant logique d’exécution AOe-sM1.3 et le poste concret sM1.3.2 qui signale la panne. |  |  |  |  |  |



### 17.19 Agents d’exécution Deliver : de la commande au transport

La chaîne Deliver utilise plusieurs agents d’exécution spécialisés. L’exécution démontre une séparation nette entre gestion de commande, inventaire, picking, packing, loading et transport. Les tâches de fin de flux sont toutes affectées par AOp-sD1.3, mais l’agent Transport AOe-sD1.12 adresse la preuve de livraison à AOp-sD1.7 afin de déclencher le reporting de clôture.

| Agent | Rôle observé | Entrée principale | Sortie / preuve | Impact interprétatif |

| --- | --- | --- | --- | --- |

| AOe-sD1.2 | Order Management | CustomerOrder / CustomerConfirmationTask | OrderReceived / OrderConfirmed | Enregistre et confirme la commande. |

| AOe-sD1.8 | Inventory | InventoryCheckRequest / DeliveryTaskAssignment | InventoryAvailabilityResponse / InventoryReserved | Établit le stock puis réserve après production. |

| AOe-sD1.9 | Picking | PickingTask | PickingCompleted | Preuve de prélèvement. |

| AOe-sD1.10 | Packing | PackingTask | PackingCompleted | Preuve de conditionnement. |

| AOe-sD1.11 | Loading | LoadingTask | LoadingCompleted | Preuve de chargement. |

| AOe-sD1.12 | Transport | ShipmentOrder | ExecutionStart / DeliveryCompleted | Produit la preuve finale de service et le statut EN_RETARD. |

| FIGURE 17.4 — CAPTURE ANYLOGIC À INSÉRERVue Deliver au moment de la livraison finale, permettant si possible de visualiser les postes Inventory/Picking/Packing/Loading/Transport et la progression de la commande. |  |  |  |  |



### 17.20 Acteurs externes et frontière du système

Deux acteurs externes ferment la boucle métier. SupplierActor intervient dans la négociation/commande et la livraison physique des matières ; CustomerActor reçoit la confirmation de commande. L’émission initiale CustomerOrder apparaît sous l’alias exporté « CUSTOMER:AOp-sS1.1 » : cet identifiant est traité ici comme une frontière externe de la chaîne, et non comme le superviseur Source interne AOp-sS1.1.

| Acteur / alias | Messages observés | Fonction |

| --- | --- | --- |

| CUSTOMER:AOp-sS1.1 | CustomerOrder → AOe-sD1.2 | Émission externe initiale de la commande dans le format d’export. |

| CustomerActor | Reçoit OrderConfirmed | Réception de la confirmation / date promise. |

| SupplierActor | Reçoit RequestForAvailability et PurchaseOrder ; émet SupplierCommitment et InboundDelivery | Partenaire externe qui engage puis livre les matières. |



### 17.21 Matrice « reçoit → transforme → transmet »

La fonction d’un agent apparaît plus clairement lorsqu’elle est formulée comme une transformation d’information. Le tableau suivant synthétise les transformations les plus structurantes de l’exécution ; il ne remplace pas les 66 communications de l’annexe, mais explicite la valeur ajoutée de chaque niveau.

| Agent | Reçoit | Transformation / décision | Transmet | Conséquence |

| --- | --- | --- | --- | --- |

| AT-sP4 | Rupture PF / réponse Make | Décide faisabilité/date/plan Deliver | AT-sP3 puis CA-sD1 / AS-sP1 | Relie service client, production et reporting. |

| AT-sP3 | Besoin Make / disponibilité matière | Décide faisabilité Make et lancement ProductionPlan | CA-sM1, AT-sP2, AT-sP4 | Orchestre la production au niveau tactique. |

| AT-sP2 | Besoin matière | Décide faisabilité et ProcurementPlan | CA-sS1 puis AT-sP3 | Rétablit la disponibilité matière. |

| CA-sM1 | Plan / contraintes Make | Contextualise ordres et consolide résultats | AOp-sM1.1 / AT-sP3 | Change la granularité tactique ↔ opérationnelle. |

| AOp-sM1.1 | Ordres + réponses + exceptions | Délègue contrôles/tâches, agrège exécution | AOe-sM1.2/3 / CA-sM1 | Supervise Make nominal et adaptatif. |

| AOp-sD1.3 | Décisions Deliver | Décompose en tâches spécialisées | AOe-sD1.2/8/9/10/11/12 | Orchestre la préparation et l’expédition. |

| AOe-sS1.3 | InboundDelivery | Valide réception et quantités | AOp-sS1.1 : MaterialReceived | Fait passer matière attendue → matière disponible. |

| AOe-sD1.12 | ShipmentOrder | Exécute transport / clôture service | AOp-sD1.3 puis AOp-sD1.7 | Déclenche la preuve finale de livraison. |



### 17.22 Déclinaison des objectifs et remontée de preuve par niveau

| Niveau | Question traitée | Exemple d’agent | Preuve descendante | Preuve ascendante |

| --- | --- | --- | --- | --- |

| Stratégique | La chaîne atteint-elle l’objectif global ? | AS-sP1 | Planification/monitoring global dans l’audit | MacroProcessReport, détection goulot. |

| Tactique | Quel plan de domaine rend l’objectif réalisable ? | AT-sP2/3/4 | SourceFeasibilityRequest, ProductionPlan, DeliveryPlan | Source/MakeFeasibilityResponse, ProcessStatusReport. |

| Coordination | Comment contextualiser ce plan pour le processus ? | CA-sS1/M1/D1 | SupplierCheckOrder, ProductionOrder, DeliveryOrder | OperationalReport, Procurement/ProductionCompleted. |

| Pilotage opérationnel | Quelles tâches concrètes affecter et surveiller ? | AOp-sS1.1 / M1.1 / D1.x | PurchaseOrderTask, ProductionTaskAssignment, PickingTask… | MaterialReceived, ExecutionEnd, DeliveryCompleted. |

| Exécution | Quelle opération physique/informationnelle réaliser ? | AOe-* / micro-poste | Tâche reçue | Start/Progress/End, Completed, ACK, mesures. |



### 17.23 De la participation des agents aux indicateurs : ne pas confondre action et calcul

Les agents d’exécution et de pilotage produisent les événements, états et rapports qui deviennent des traces de performance, mais ils ne « calculent » pas individuellement le PI. Les mesures VSM sont consolidées à partir des événements runtime ; les métriques SCOR sont ensuite normalisées et agrégées par le pipeline de performance. La contribution d’un agent au PI est donc indirecte et traçable par les observations qu’il produit ou fait remonter.

| Agent / groupe | Fait produit | Mesure dérivable | Lecture SCOR / PI |

| --- | --- | --- | --- |

| AOe-sS1.3 + AOp-sS1.1 | Réception matière et fin Source | CT Source, délais de disponibilité | RS.2.1 et effet sur le Lead Time. |

| AOe-sM1.2/3 + postes M1.* | Start/Progress/End, CT/WT, goulot | CT Make, WT, efficacité | RS.2.2, RS.1.1, RS.3.94 ; effets indirects AG/CO. |

| Machine / sM1.3.2 | Panne, temps de traitement, disponibilité | MTBF/MTTR, disponibilité | AM.3.9 ; effets indirects sur temps Make. |

| AOe-sD1.8..12 + AOp-sD1.7 | Réservation, préparation, livraison | CT Deliver, complétude, ponctualité | RS.2.3 ; RL.2.1, RL.2.2, RL.3.33, RL.3.35. |

| AT-sP4 → AS-sP1 | Rapport final EN_RETARD + délai | État global de la commande | Preuve de synthèse ; le calcul du PI reste dans le moteur de performance. |

| Précision méthodologique — Dire qu’un agent « contribue » à Reliability ou Responsiveness signifie que son exécution produit une observation utilisée dans une métrique. Cela ne signifie pas que l’agent détient ou calcule lui-même l’attribut SCOR ou le Performance Index. |  |  |  |



### 17.24 Fiche transversale de la boucle AER Make

La boucle d’incident complète une lecture strictement centrée commande. Elle fait intervenir le poste sM1.3.2, le Blackboard, AOp-sM1.1, CA-sM1 et AT-sP3, puis redescend vers un poste d’exécution ciblé. Les 13 étapes locales sont toutes marquées « Observé » dans l’audit exporté.

| Étape | Acteur | Message / action | Transformation |

| --- | --- | --- | --- |

| 1–2 | sM1.3.2 + Blackboard | PANNE | Écart local → fait partagé et mémorisé. |

| 3–5 | AOp-sM1.1 → CA-sM1 → AT-sP3 | OperationalException / ProcessDeviationReport | Fait local → exception consolidée tactique. |

| 6 | AT-sP3 | PriorityDecision, REBALANCE, score AHP | Exception → arbitrage. |

| 7–9 | CA-sM1 → AOp-sM1.1 → poste | SupervisorInstruction / OperationalInstruction | Arbitrage → instruction contextualisée. |

| 10–13 | poste → AOp-sM1.1 → CA-sM1 → AT-sP3 | ACK_REBALANCE / acknowledgements | Application locale → preuve de fermeture de boucle. |

| FIGURE 17.5 — CAPTURE / SCHÉMA À INSÉRERCapture de la table « Audit propagation AER » autour des étapes 1 à 13, ou schéma annoté reprenant les timestamps 210–229 s et les agents sM1.3.2, AOp-sM1.1, CA-sM1, AT-sP3. |  |  |  |



### 17.25 Synthèse : responsabilité observée, responsabilité configurée et preuve

La lecture agent par agent confirme que l’architecture n’est pas seulement déclarative. Les niveaux sont effectivement traversés dans l’ordre attendu : l’exécution remonte vers le pilotage, la coordination puis le tactique ; les décisions redescendent en sens inverse. Les échanges inter-processus restent au niveau tactique, notamment Deliver → Make et Make → Source, ce qui préserve la séparation des domaines tout en permettant leur coordination.

L’exécution montre également pourquoi la traçabilité doit conserver les identifiants exacts. Le pilotage Deliver est distribué entre AOp-sD1.1, AOp-sD1.3 et AOp-sD1.7 ; l’incident de production est émis par le poste sM1.3.2 alors que la progression de la commande est remontée sous AOe-sM1.3. Une interprétation qui fusionnerait ces identités perdrait une partie de la preuve organisationnelle et opérationnelle.

| Question de validation | Réponse observée |

| --- | --- |

| Les échanges commande franchissent-ils arbitrairement des niveaux ? | Non : la colonne « Contrôle hiérarchique » indique des niveaux adjacents, sauf flux externes et coordination tactique inter-processus. |

| La bascule Deliver → Make → Source est-elle traçable ? | Oui : séquences 7–18 puis 25–27, avec agents tactiques explicitement identifiés. |

| Le plan Source redescend-il jusqu’à l’achat/réception ? | Oui : ProcurementPlan → ProcurementOrder → PurchaseOrderTask → PurchaseOrder → InboundDelivery → MaterialReceived. |

| Le plan Make redescend-il jusqu’à l’exécution ? | Oui : ProductionPlan → ProductionOrder → ProductionTaskAssignment → ExecutionStart/Progress/End. |

| La livraison remonte-t-elle jusqu’au stratégique ? | Oui : DeliveryCompleted → OperationalReport → ProcessStatusReport → MacroProcessReport. |

| Une boucle adaptative est-elle fermée ? | Oui : PANNE → ProcessDeviationReport → REBALANCE → ACK_REBALANCE → ProcessAcknowledgement. |



## 18. Conclusion

L’exécution analysée établit une chaîne de preuve cohérente depuis la demande client jusqu’au résultat global. La rupture de produit fini déclenche Make, le manque matière déclenche Source, la disponibilité matière réactive Make, puis Deliver clôture la commande. À chaque transition, l’architecture multi-agents conserve l’identité du décideur, du coordinateur, du pilote et de l’exécutant, tandis que les événements produits alimentent séparément la chaîne de mesure VSM → SCOR → attributs → PI.

La version finale consolide cette démonstration en séparant clairement trois niveaux de lecture : les résultats intégrés au chapitre 14, l’interprétation académique des mécanismes au chapitre 16 et la preuve détaillée agent par agent au chapitre 17. Cette organisation permet de distinguer les faits observés, leur interprétation et les éléments de preuve sans multiplier les répétitions.

La version finale conserve des emplacements explicites pour les captures AnyLogic et illustrations de preuve. Leur insertion ultérieure, lorsqu’elles sont disponibles, complète la démonstration visuelle sans modifier les résultats, les calculs ni la chaîne d’interprétation établis à partir de l’export runtime analysé.

### Annexe A. Tableau chronologique des 66 communications

Cette annexe reprend les communications de la commande dans l’ordre du numéro de séquence. Le contenu est condensé afin de préserver la lisibilité ; l’export Excel reste l’artefact de preuve intégral.

| T (s) | Seq. | Phase | Émetteur | Destinataire | Message | Domaine |

| --- | --- | --- | --- | --- | --- | --- |

| 27.0 | 1 | EXECUTION | CUSTOMER:AOp-sS1.1 | AOe-sD1.2 | CustomerOrder | Deliver |

| 32.0 | 2 | REPORT | AOe-sD1.2 | AOp-sD1.1 | OrderReceived | Deliver |

| 32.0 | 3 | AMENDMENT | AOp-sD1.3 | AOe-sD1.8 | InventoryCheckRequest | Deliver |

| 32.0 | 4 | REPORT | AOe-sD1.8 | AOp-sD1.3 | InventoryAvailabilityResponse | Deliver |

| 32.0 | 5 | REPORT | AOp-sD1.1 | CA-sD1 | OrderValidated | Deliver |

| 32.0 | 6 | REPORT | CA-sD1 | AT-sP4 | OrderFeasibilityRequest | Plan Deliver |

| 36.0 | 7 | REPORT | CA-sD1 | AT-sP4 | InventoryShortageReport | Deliver |

| 36.0 | 8 | REPORT | AT-sP4 | AT-sP3 | OrderFeasibilityRequest | Deliver→Make |

| 40.0 | 9 | AMENDMENT | AT-sP3 | CA-sM1 | MakeFeasibilityCheck | Make |

| 40.0 | 10 | AMENDMENT | CA-sM1 | AOp-sM1.1 | CapacityAndMaterialCheckOrder | Make |

| 40.0 | 11 | AMENDMENT | AOp-sM1.1 | AOe-sM1.2 | CapacityCheckRequest | Make |

| 40.0 | 12 | AMENDMENT | AOp-sM1.1 | AOe-sM1.2 | MaterialCheckRequest | Make |

| 40.0 | 13 | REPORT | AOe-sM1.2 | AOp-sM1.1 | CapacityAvailabilityResponse | Make |

| 40.0 | 14 | REPORT | AOe-sM1.2 | AOp-sM1.1 | MaterialShortageDetected | Make |

| 40.0 | 15 | REPORT | AOp-sM1.1 | CA-sM1 | MakeConstraintReport | Make |

| 40.0 | 16 | REPORT | CA-sM1 | AT-sP3 | MakeFeasibilityResponse | Plan Make |

| 40.0 | 17 | AMENDMENT | AT-sP3 | AT-sP2 | MaterialAvailabilityRequest | Make→Source |

| 40.0 | 18 | AMENDMENT | AT-sP2 | CA-sS1 | SourceFeasibilityRequest | Source |

| 40.0 | 19 | AMENDMENT | CA-sS1 | AOp-sS1.1 | SupplierCheckOrder | Source |

| 40.0 | 20 | AMENDMENT | AOp-sS1.1 | AOe-sS1.2 | SupplierAvailabilityCheck | Source |

| 40.0 | 21 | AMENDMENT | AOe-sS1.2 | SupplierActor | RequestForAvailability | Source |

| 40.0 | 22 | REPORT | SupplierActor | AOe-sS1.2 | SupplierCommitment | Source |

| 40.0 | 23 | REPORT | AOe-sS1.2 | AOp-sS1.1 | SupplierAvailabilityResponse | Source |

| 40.0 | 24 | REPORT | AOp-sS1.1 | CA-sS1 | SourceOperationalFeasibility | Source |

| 40.0 | 25 | REPORT | CA-sS1 | AT-sP2 | SourceFeasibilityResponse | Plan Source |

| 40.0 | 26 | REPORT | AT-sP2 | AT-sP3 | MaterialAvailabilityResponse | Source→Make |

| 40.0 | 27 | REPORT | AT-sP3 | AT-sP4 | MakeFeasibilityResponse | Make→Deliver |

| 40.0 | 28 | AMENDMENT | AT-sP4 | CA-sD1 | PromisedDeliveryDate | Deliver |

| 40.0 | 29 | AMENDMENT | CA-sD1 | AOp-sD1.3 | OrderConfirmationOrder | Deliver |

| 40.0 | 30 | AMENDMENT | AOp-sD1.3 | AOe-sD1.2 | CustomerConfirmationTask | Deliver |

| 40.0 | 31 | REPORT | AOe-sD1.2 | CustomerActor | OrderConfirmed | Deliver |

| 40.0 | 32 | AMENDMENT | AT-sP2 | CA-sS1 | ProcurementPlan | Source |

| 40.0 | 33 | AMENDMENT | CA-sS1 | AOp-sS1.1 | ProcurementOrder | Source |

| 40.0 | 34 | AMENDMENT | AOp-sS1.1 | AOe-sS1.2 | PurchaseOrderTask | Source |

| 40.0 | 35 | AMENDMENT | AOe-sS1.2 | SupplierActor | PurchaseOrder | Source |

| 40.0 | 36 | EXECUTION | SupplierActor | AOe-sS1.3 | InboundDelivery | Source |

| 60.0 | 37 | EXECUTION | AOe-sS1.3 | AOp-sS1.1 | MaterialReceived | Source |

| 60.0 | 38 | REPORT | AOp-sS1.1 | CA-sS1 | OperationalReport | Source |

| 60.0 | 39 | REPORT | CA-sS1 | AT-sP2 | ProcurementCompleted | Source |

| 60.0 | 40 | REPORT | AT-sP2 | AT-sP3 | MaterialAvailable | Source→Make |

| 60.0 | 41 | AMENDMENT | AT-sP3 | CA-sM1 | ProductionPlan | Make |

| 60.0 | 42 | AMENDMENT | CA-sM1 | AOp-sM1.1 | ProductionOrder | Make |

| 60.0 | 43 | AMENDMENT | AOp-sM1.1 | AOe-sM1.2 | ProductionTaskAssignment | Make |

| 66.0 | 44 | EXECUTION | AOe-sM1.2 | AOp-sM1.1 | ExecutionStart | Make |

| 309.1 | 45 | EXECUTION | AOe-sM1.3 | AOp-sM1.1 | ExecutionProgress | Make |

| 399.1 | 46 | EXECUTION | AOe-sM1.3 | AOp-sM1.1 | ExecutionProgress | Make |

| 399.1 | 47 | EXECUTION | AOe-sM1.3 | AOp-sM1.1 | ExecutionEnd | Make |

| 399.1 | 48 | REPORT | AOp-sM1.1 | CA-sM1 | OperationalReport | Make |

| 399.1 | 49 | REPORT | CA-sM1 | AT-sP3 | ProductionCompleted | Plan Make |

| 399.1 | 50 | REPORT | AT-sP3 | AT-sP4 | ProductAvailableForDelivery | Make→Deliver |

| 399.1 | 51 | AMENDMENT | AT-sP4 | CA-sD1 | DeliveryPlan | Deliver |

| 399.1 | 52 | AMENDMENT | CA-sD1 | AOp-sD1.3 | DeliveryOrder | Deliver |

| 399.1 | 53 | AMENDMENT | AOp-sD1.3 | AOe-sD1.8 | DeliveryTaskAssignment | Deliver |

| 399.1 | 54 | EXECUTION | AOe-sD1.8 | AOp-sD1.3 | InventoryReserved | Deliver |

| 399.1 | 55 | AMENDMENT | AOp-sD1.3 | AOe-sD1.9 | PickingTask | Deliver |

| 399.1 | 56 | EXECUTION | AOe-sD1.9 | AOp-sD1.3 | PickingCompleted | Deliver |

| 399.1 | 57 | AMENDMENT | AOp-sD1.3 | AOe-sD1.10 | PackingTask | Deliver |

| 399.1 | 58 | EXECUTION | AOe-sD1.10 | AOp-sD1.3 | PackingCompleted | Deliver |

| 399.1 | 59 | AMENDMENT | AOp-sD1.3 | AOe-sD1.11 | LoadingTask | Deliver |

| 399.1 | 60 | EXECUTION | AOe-sD1.11 | AOp-sD1.3 | LoadingCompleted | Deliver |

| 399.1 | 61 | AMENDMENT | AOp-sD1.3 | AOe-sD1.12 | ShipmentOrder | Deliver |

| 399.1 | 62 | EXECUTION | AOe-sD1.12 | AOp-sD1.3 | ExecutionStart | Deliver |

| 399.1 | 63 | EXECUTION | AOe-sD1.12 | AOp-sD1.7 | DeliveryCompleted | Deliver |

| 399.1 | 64 | REPORT | AOp-sD1.7 | CA-sD1 | OperationalReport | Deliver |

| 399.1 | 65 | REPORT | CA-sD1 | AT-sP4 | ProcessStatusReport | Plan Deliver |

| 399.1 | 66 | REPORT | AT-sP4 | AS-sP1 | MacroProcessReport | Deliver→Strategic |



### Annexe B. Emplacements de captures et illustrations à compléter

Le document conserve des emplacements d’illustration au fil des chapitres. Pour éviter une collecte excessive de captures, le plan ci-dessous regroupe les visuels prioritaires : une même capture peut être réutilisée dans plusieurs sections lorsque son contenu répond à plusieurs objectifs de preuve.

| Priorité | Figure(s) / section(s) | Type | Moment / vue recommandée | Contenu indispensable | Statut |

| --- | --- | --- | --- | --- | --- |

| P1 | 2.1, 2.2 | Capture AnyLogic | Démarrage | Réseau fournisseurs–ZENER–client + stocks initiaux nuls | À capturer |

| P1 | 3.1, 4.1, 17.3 | Capture AnyLogic | Vue holonique pendant l’exécution | AS-sP1 ; AT-sP2/3/4 ; CA-sS1/M1/D1 ; AOp/AOe visibles | À capturer |

| P1 | 5.1, 16.1 | Capture table / UI | T≈36 s | Rupture produit fini + bascule Deliver → Make | À capturer |

| P1 | 5.2, 16.2 | Capture AnyLogic / table | T≈40–60 s | GPL=25, bouteilles=2, accessoires=2 ; besoin initial à zéro stock | À capturer |

| P1 | 5.3, 16.4 | Capture AnyLogic | T≈66–399 s | Production active ; sM1.2.1 ; carrousel sM1.3.2 | À capturer |

| P1 | 7.1, 7.3, 16.5, 17.5 | Capture Audit AER | T≈210–229 s | PANNE → Blackboard → tactique → REBALANCE → ACK | À capturer |

| P1 | 8.1, 11.1 | Capture Dashboard | Après clôture | Lead Time 372,05 s ; efficacité 65 % ; PI 8,248 ; attributs | À capturer |

| P1 | 9.1 | Capture pipeline | Après clôture | Valeur réelle ; Bottom/Perfect ; score ; fuzzy ; poids ; source | À capturer |

| P2 | 5.4, 17.4 | Capture Deliver | T≈399,1 s | Inventory/Picking/Packing/Loading/Transport + réception client | À capturer |

| P2 | 6.1 | Capture table | Séquences de rupture et Source | Propagation agents et flux avec émetteur/destinataire/messages | À capturer |

| P2 | 7.2 | Capture / table | T≈390 s | sM1.2.1 identifié goulot avec WT≈26,9 s | À capturer |

| Intégré | 17.1 | Graphique généré depuis export | — | Volume de communications par agent | Déjà intégré |

| Intégré | 17.2 | Graphique généré depuis export | — | Fenêtres temporelles de participation | Déjà intégré |

| Optionnel | 4.2, 5.5, 8.2, 11.2 | Illustration de synthèse | Post-traitement | Boucles objectifs/reporting, frise, comparaison unités, fuzzy | À produire si utile |

| Consigne de capture — Conserver si possible le même exécution et le même ordre de grandeur de zoom. Les captures doivent montrer la valeur ou l’état utilisé dans le texte ; une image décorative sans preuve lisible n’est pas nécessaire. |  |  |  |  |  |



### Annexe C. Boucle AER complète observée et preuves hiérarchiques

Cette annexe reprend les treize étapes locales de la boucle AER observée. Elle sert de preuve de non-saut hiérarchique entre exécution, pilotage, coordination et tactique.

| Étape | Statut | Temps | Preuve / message | Objet | Lecture métier |

| --- | --- | --- | --- | --- | --- |

| 1. Agent opérationnel d'exécution : rapport émis | Observé | T=210.0s | [REPORT] sM1.3.2 -> AOp-sM1.1 \| sujet=PANNE \| contenu=duree_estimee=2650s;poste=(Produce and Test) Remplissage GPL au carrousel | Panne signalée par l'agent opérationnel d'exécution ; poste=sM1.3.2 \| occurrences=20 | L'exécution signale réellement une panne, un goulot ou un retard. |

| 2. Blackboard : rapport partagé | Observé | T=210.0s | [REPORT] sM1.3.2 -> AOp-sM1.1 \| sujet=PANNE \| contenu=duree_estimee=2650s;poste=(Produce and Test) Remplissage GPL au carrousel | Message stocké dans le tableau noir ; alertes en attente=1 \| occurrences=177 | Le Blackboard conserve le message runtime et sa preuve. |

| 3. Agent opérationnel de pilotage ou superviseur : rapport reçu | Observé | T=211.0s | [REPORT] sM1.3.2 -> AOp-sM1.1 \| sujet=PANNE \| contenu=duree_estimee=2650s;poste=(Produce and Test) Remplissage GPL au carrousel | Rapport opérationnel reçu par le superviseur AOp-sM1.1 \| occurrences=20 | Le superviseur reçoit le rapport sans saut de niveau. |

| 4. Agent coordinateur : rapport consolidé | Observé | T=212.0s | [REPORT] AOp-sM1.1 -> CA-sM1 \| sujet=OperationalException \| contenu=duree_estimee=2650s;poste=(Produce and Test) Remplissage GPL au carrousel;superviseur=AOp-sM1.1 | Rapport du superviseur consolidé par le coordinateur CA-sM1 \| occurrences=20 | Le coordinateur consolide l'écart de son macro-processus. |

| 5. Agent tactique : rapport macro reçu | Observé | T=213.0s | [REPORT] CA-sM1 -> AT-sP3 \| sujet=ProcessDeviationReport \| contenu=duree_estimee=2650s;poste=(Produce and Test) Remplissage GPL au carrousel;superviseur=AOp-sM1.1;coordinateur=C… | Rapport macro-processus reçu par le niveau tactique AT-sP3 \| occurrences=20 | Le tactique reçoit le rapport consolidé de son domaine. |

| 6. Agent tactique : arbitrage AHP | Observé | T=213.0s | [AMENDMENT] AT-sP3 -> CA-sM1 \| sujet=PriorityDecision \| contenu=duree_estimee=2650s;poste=(Produce and Test) Remplissage GPL au carrousel;superviseur=AOp-sM1.1;coordinateur=CA-s… | Arbitrage AHP réalisé au niveau tactique sans saut hiérarchique ; score=0.170 \| occurrences=20 | Le tactique arbitre la priorité avec un score AHP justifiable. |

| 7. Agent coordinateur : décision contextualisée | Observé | T=214.0s | [AMENDMENT] AT-sP3 -> CA-sM1 \| sujet=PriorityDecision \| contenu=duree_estimee=2650s;poste=(Produce and Test) Remplissage GPL au carrousel;superviseur=AOp-sM1.1;coordinateur=CA-s… | Décision tactique reçue et contextualisée par CA-sM1 \| occurrences=20 | Le coordinateur traduit la décision en instruction contextualisée. |

| 8. Agent opérationnel de pilotage ou superviseur : instruction relayée | Observé | T=215.0s | [AMENDMENT] CA-sM1 -> AOp-sM1.1 \| sujet=SupervisorInstruction \| contenu=duree_estimee=2650s;poste=(Produce and Test) Remplissage GPL au carrousel;superviseur=AOp-sM1.1;coordinat… | Instruction tactique relayée au superviseur AOp-sM1.1 \| occurrences=20 | Le superviseur transforme la décision en instruction opérationnelle. |

| 9. Agent opérationnel d'exécution : décision appliquée | Observé | T=226.0s | [AMENDMENT] AOp-sM1.1 -> sM1.3.1 \| sujet=OperationalInstruction \| contenu=poste=sM1.3.1;WT=0.00;file=0;tempsTraitement=25.68;superviseur=AOp-sM1.1;coordinateur=CA-sM1;poste=sM1.… | Décision appliquée par l'agent d'exécution sM1.3.1 ; nouveau seuil=24.0 \| occurrences=19 | Le poste ciblé applique réellement la décision. |

| 10. Agent opérationnel d'exécution : accusé émis | Observé | T=226.0s | [EXECUTION] sM1.3.1 -> AOp-sM1.1 \| sujet=ACK_REBALANCE \| contenu=poste=sM1.3.1;WT=0.00;file=0;tempsTraitement=25.68;superviseur=AOp-sM1.1;coordinateur=CA-sM1;poste=sM1.3.1;super… | Accusé émis par l'agent d'exécution après application \| occurrences=19 | Le poste ciblé produit un accusé d'exécution. |

| 11. Agent opérationnel de pilotage ou superviseur : accusé reçu | Observé | T=227.0s | [EXECUTION] sM1.3.1 -> AOp-sM1.1 \| sujet=ACK_REBALANCE \| contenu=poste=sM1.3.1;WT=0.00;file=0;tempsTraitement=25.68;superviseur=AOp-sM1.1;coordinateur=CA-sM1;poste=sM1.3.1;super… | Accusé opérationnel reçu par le superviseur AOp-sM1.1 \| occurrences=19 | Le superviseur reçoit l'accusé du poste. |

| 12. Agent coordinateur : accusé consolidé | Observé | T=228.0s | [EXECUTION] AOp-sM1.1 -> CA-sM1 \| sujet=OperationalAcknowledgement \| contenu=poste=sM1.3.1;WT=0.00;file=0;tempsTraitement=25.68;superviseur=AOp-sM1.1;coordinateur=CA-sM1;poste=s… | Accusé consolidé par le coordinateur CA-sM1 \| occurrences=19 | Le coordinateur consolide l'accusé du processus. |

| 13. Agent tactique : accusé final reçu | Observé | T=229.0s | [EXECUTION] CA-sM1 -> AT-sP3 \| sujet=ProcessAcknowledgement \| contenu=poste=sM1.3.1;WT=0.00;file=0;tempsTraitement=25.68;superviseur=AOp-sM1.1;coordinateur=CA-sM1;poste=sM1.3.1;… | Accusé final reçu par le niveau tactique AT-sP3 \| occurrences=19 | Le tactique clôt la boucle locale AER. |



### Annexe D. Matrice complète VSM → SCOR → attributs → PI

Le tableau suivant reprend toutes les lignes du pipeline exporté. Les métriques marquées informatives conservent leur valeur de preuve mais ne contribuent pas au score.

| Attr. | Métrique runtime | Code | Valeur | Unité | Bottom→Perfect | Score | Poids local | Source / preuve |

| --- | --- | --- | --- | --- | --- | --- | --- | --- |

| RL | Commandes livrées complètes | RL.2.1 / N2 | 1 | ratio 0-1 | 0.000 -> 1.000 | 10 | 0,25 | Commandes closes livrées en totalité / commandes closes (statuts commande) |

| RL | Commandes livrées à temps | RL.2.2 / N2 | 0 | ratio 0-1 | 0.000 -> 1.000 | 0 | 0,25 | verifierFillRate() : commandes livrées à temps / commandes enregistrées |

| RL | Exactitude des articles livrés | RL.3.33 / N3 | 1 | ratio 0-1 | 0.000 -> 1.000 | 10 | 0,25 | Approximation nominale mono-produit : exactitude article = taux de commandes closes livrées en totalité |

| RL | Exactitude des quantités livrées | RL.3.35 / N3 | 1 | ratio 0-1 | 0.000 -> 1.000 | 10 | 0,25 | Approximation nominale : exactitude quantité = taux de commandes closes livrées en totalité |

| RS | Source Cycle Time — Temps de cycle Source | RS.2.1 / N2 | 1,604 | s | 3600.000 -> 0.000 | 9,996 | 0,2 | Moyenne des temps de traitement des postes SCOR S1. à partir des KPI de simulation et des traces brutes |

| RS | Make Cycle Time — Temps de cycle Make | RS.2.2 / N2 | 24,419 | s | 3600.000 -> 0.000 | 9,932 | 0,2 | Moyenne des temps de traitement des postes SCOR M1. à partir des KPI de simulation et des traces brutes |

| RS | Deliver Cycle Time — Temps de cycle Deliver | RS.2.3 / N2 | 3,174 | s | 3600.000 -> 0.000 | 9,991 | 0,2 | Moyenne des temps de traitement des postes SCOR D1. à partir des KPI de simulation et des traces brutes |

| RS | Order Fulfillment Cycle Time — Lead Time global de commande | RS.1.1 / N1 | 372,052 | s | 7200.000 -> 0.000 | 9,483 | 0,2 | Délai total observé entre la création de la commande et sa clôture client. |

| RS | Order Fulfillment Dwell Time — Temps d’attente global | RS.3.94 / N3 | 130,218 | s | 7200.000 -> 0.000 | 9,819 | 0,2 | Temps d’attente global cohérent = délai total × (1 - efficacité du cycle). |

| AG | Current Delivery Volume / Throughput — Volume livré et débit de sortie | AG.3.32 / N3 | 9,021 | ent/h | 0.000 -> 160.000 | 0,564 | 0,333 | Débit de sortie observé = entités terminées × 3600 / temps de simulation |

| AG | System Utilization — Taux d’occupation du système (estimation WIP/capacité) | PROXY.AG.SYSTEM_UTILIZATION | 0,019 | ratio 0-1 | 1.500 -> 0.000 | 9,871 | 0,333 | Proxy explicite = WIP courant moyen / capacité simultanée totale déclarée |

| AG | Stabilite du debit (1 - coeff. de variation observe) | AG.1.1 / N1 | 0,5 | ratio 0-1 | 0.000 -> 1.000 | 5 | 0,333 | Coefficient d'adaptabilité = stabilité du débit observé (1 - coefficient de variation) |

| CO | Cout total / Chiffre d'affaire estime (TSCMC ratio) | CO.1.1 / N1 | 0,128 | ratio cout/CA | 1.000 -> 0.000 | 8,724 | 1 | Ratio coût total cumulé / chiffre d'affaire estimé ; nécessite chiffreAffaireParUnite > 0 |

| CO | Cout main d'oeuvre cumule (informatif, hors score) | CO.3.13 / N3 | 335,636 | FCFA | NON CALIBRE | 0 | 0 | Coûts horaires/postes + coûts matière configurés ; les coûts paiement/risque restent non modélisés |

| CO | Cout matiere cumule (informatif, hors score) | CO.3.11 / N3 | 494 | FCFA | NON CALIBRE | 0 | 0 | Coûts horaires/postes + coûts matière configurés ; les coûts paiement/risque restent non modélisés |

| AM | Disponibilite moyenne des machines (MTBF/(MTBF+MTTR)) | AM.3.9 / N3 | 0,941 | ratio 0-1 | 0.000 -> 1.000 | 9,412 | 0,5 | Disponibilité machine = MTBF/(MTBF+MTTR) dans la configuration courante ; états panne tracés séparément |

| AM | Inventory Days of Supply (stock reel observe) | AM.2.2 / N2 | 0 | jours | 30.000 -> 0.000 | 10 | 0,5 | Inventory Days of Supply = stock observé / débit journalier observé |

| AM | Valeur des actifs fixes declares (informatif, hors score) | AM.3.18 / N3 | 192800000 | EUR | NON CALIBRE | 0 | 0 | Stocks observés en simulation, fiches matière, actifs fixes configurés ; données financières à enrichir |



### Annexe E. Micro-activités observées et KPI structurants

Sélection des micro-activités les plus utiles pour expliquer cette exécution : opérations Source effectivement mesurées, chaîne Make complète, étapes Deliver finales et planification de production.

| Poste | Micro-activité | N3 | Échant. | CT (s) | WT (s) | Eff. % | Métriques principales |

| --- | --- | --- | --- | --- | --- | --- | --- |

| sS1.1.1 | (Schedule Product Deliveries) Planifier les livraisons de GPL | S1.1 | 1 | 2 | 0 | 90 | RS.2.1 — Temps de cycle Source ; RS.3.122 — Temps de cycle planification livraisons produit |

| sS1.2.1 | (Receive Product) Réception du GPL vrac | S1.2 | 1 | 2 | 0 | 75 | RS.2.1 — Temps de cycle Source ; RS.3.107 — Temps de cycle réception produit ; RS.3.102 — Temps de cycle réception et… |

| sS1.2.2 | (Receive Product) Réception des bouteilles vides | S1.2 | 1 | 2 | 0 | 75 | RS.2.1 — Temps de cycle Source ; RS.3.107 — Temps de cycle réception produit ; RS.3.102 — Temps de cycle réception et… |

| sS1.2.3 | (Receive Product) Réception des accessoires de conditionnement | S1.2 | 1 | 2 | 0 | 75 | RS.2.1 — Temps de cycle Source ; RS.3.107 — Temps de cycle réception produit ; RS.3.102 — Temps de cycle réception et… |

| sS1.3.1 | (Verify Product) Contrôle de conformité des bouteilles vides reçues | S1.3 | 1 | 1,5 | 0 | 55 | RS.2.1 — Temps de cycle Source ; RS.3.140 — Temps de cycle vérification produit ; RS.3.102 — Temps de cycle réception… |

| sS1.3.2 | (Verify Product) Contrôle de conformité des accessoires reçus | S1.3 | 1 | 1,5 | 0 | 55 | RS.2.1 — Temps de cycle Source ; RS.3.140 — Temps de cycle vérification produit ; RS.3.102 — Temps de cycle réception… |

| sM1.2.1 | (Issue Sourced/In-Process Product) Mise à disposition des bouteilles vides – accessoires et GPL pour la production | M1.2 | 2 | 52,34 | 26,92 | 56,1 | RS.2.2 — Temps de cycle Make ; RS.3.49 — Temps de cycle sortie matière |

| sM1.3.1 | (Produce and Test) Tare des bonbonnes vides | M1.3 | 2 | 4,41 | 0 | 90 | RS.2.2 — Temps de cycle Make ; RS.3.101 — Temps de cycle produire et tester |

| sM1.3.2 | (Produce and Test) Remplissage GPL au carrousel | M1.3 | 2 | 93,32 | 18,96 | 76,5 | RS.2.2 — Temps de cycle Make ; RS.3.101 — Temps de cycle produire et tester |

| sM1.3.3 | (Produce and Test) Premier contrôle d'étanchéité à l'eau savonneuse | M1.3 | 2 | 5,24 | 0 | 55 | RS.2.2 — Temps de cycle Make ; RS.3.101 — Temps de cycle produire et tester |

| sM1.3.4 | (Produce and Test) Contrôle de poids | M1.3 | 8 | 29,25 | 4,74 | 73,9 | RS.2.2 — Temps de cycle Make ; RS.3.101 — Temps de cycle produire et tester |

| sM1.3.5 | (Produce and Test) Correcteur de poids — rework | M1.3 | 2 | 14,01 | 0 | 55 | RS.2.2 — Temps de cycle Make ; RS.3.101 — Temps de cycle produire et tester |

| sM1.3.6 | (Produce and Test) Deuxième contrôle d'étanchéité automatique | M1.3 | 8 | 29,25 | 4,74 | 73,9 | RS.2.2 — Temps de cycle Make ; RS.3.101 — Temps de cycle produire et tester |

| sM1.4.1 | (Package) Fixation du capuchon plastique | M1.4 | 2 | 3,88 | 0 | 90 | RS.2.2 — Temps de cycle Make ; RS.3.142 — Temps de cycle emballage / packaging |

| sM1.4.2 | (Package) Plastification thermorétractable | M1.4 | 2 | 9,67 | 0 | 90 | RS.2.2 — Temps de cycle Make ; RS.3.142 — Temps de cycle emballage / packaging |

| sM1.5.1 | (Stage Finished Product) Transfert vers magasin produits finis | M1.5 | 2 | 49,3 | 0 | 85 | RS.2.2 — Temps de cycle Make ; RS.3.128 — Temps de cycle mise à disposition produit fini |

| sM1.6.1 | (Release Finished Product to Deliver) Libération des bonbonnes pleines | M1.6 | 2 | 10 | 0 | 95 | RS.2.2 — Temps de cycle Make ; RS.3.114 — Temps de cycle libération produit fini vers Deliver |

| sD1.1.1 | (Process Inquiry & Quote) Traitement de la demande et devis client | D1.1 | 1 | 5 | 0 | 90 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.3.4 | (Reserve Inventory & Determine Delivery Date) Réservation du stock et détermination de la date de livraison | D1.3 | 1 | 3 | 0 | 85 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.4.4 | (Consolidate Orders) Regrouper les commandes | D1.4 | 1 | 2 | 0 | 80 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.5.4 | (Build Loads) Constitution des chargements | D1.5 | 1 | 2 | 0 | 85 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.6.1 | (Route Shipments) Planification des itinéraires de livraison | D1.6 | 1 | 2 | 0 | 90 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.7.1 | (Select Carriers & Rate Shipments) Sélection du transporteur et tarification | D1.7 | 1 | 1,5 | 0 | 90 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.8.1 | (Receive Product from Source or Make) Réception du produit depuis le stock | D1.8 | 1 | 1 | 0 | 95 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.9.1 | (Pick Product) Prélèvement des bonbonnes en stock | D1.9 | 1 | 2 | 0 | 90 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.10.1 | (Pack Product) Conditionnement du produit pour expédition | D1.10 | 1 | 2 | 0 | 90 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.11.4 | (Load Vehicle & Generate Shipping Docs) Chargement du camion et génération du document d'expédition | D1.11 | 1 | 2 | 0 | 80 | RL.3.33 — Exactitude des articles livrés ; RL.3.35 — Exactitude des quantités livrées ; RL.2.1 — % de commandes livré… |

| sD1.12.4 | (Ship Product) Expédition des bonbonnes aux clients | D1.12 | 1 | 8 | 0 | 85 | AG.3.32 — Volume de livraison courant (nombre de commandes expédiées) ; RL.3.33 — Exactitude des articles livrés ; RL… |

| sP3.4.1 | (Establish Production Plans) Établir les plans de production (remplissage de gaz) | P3.4 | 1 | 2 | 0 | 90 | RS.3.123 — Temps de cycle ordonnancement production |


