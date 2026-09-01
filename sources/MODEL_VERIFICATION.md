# Vérification du modèle consolidé

## Identification de l'artefact

| Champ | Valeur vérifiée |
|:--|:--|
| Fichier | `sources/model/SCONTO_SVU_FINAL.alp` |
| Nature | Projet AnyLogic XML, version AnyLogic 8.9.8, unité de temps du modèle `Second` |
| Modèle | `SCONTO_SVU_GENERIC10-2` |
| SHA-256 | `2D67AD5E44F051F64E01E887ADC5BB8C628F9D57A32B3CD9842455240D4C024F` |
| Portée légitime | Chapitres 2 à 9 et annexes techniques, pour l'existence des mécanismes uniquement |

La correction temporelle a ensuite été construite et exécutée depuis `SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp`, SHA-256 `C4DF051A98498B4D8FCA7D5964A2DEC809DDCE100523EDB2C7A1E25CA2276B66`. La copie promue `SCONTO_SVU_FINAL_VALIDATED.alp` porte la même empreinte. Le run associé est documenté dans `sources/runs/vsm_validation/RUN_VERIFICATION.md`.

Le contrôle porte sur la présence du mécanisme dans le fichier ALP. Le statut `IMPLEMENTE` ne signifie pas qu'un résultat quantitatif a été obtenu pour tous les mécanismes. Les observations propres au Run B sont documentées séparément.

## Couverture fonctionnelle

| Fonctionnalité | Statut dans `MODEL_EVOLUTION.md` | Preuve exacte trouvée dans l'ALP | Fonction ou variable | Statut probatoire final | Chapitre cible | Remarque |
|:--|:--|:--|:--|:--|:--|:--|
| Distinction `CMD_*` et `REAPPRO_*` | Fonction consolidée | Création de `REAPPRO_` à la ligne 2568, comptages séparés aux lignes 8841 et 8847, filtres clients aux lignes 12179 à 12192 | `declencherProductionAutonome`, `nombreCommandesClientes`, `nombreOrdresStockAutonomes` | IMPLEMENTE | 2, 3, 4, 6 | Le Run B contient `CMD_1` et `REAPPRO_1`. |
| Politique autonome de stock produit fini | Fonction consolidée | Evaluation périodique et décision de lancement aux lignes 2441 à 2553 | `verifierPolitiqueStockProduit` | IMPLEMENTE | 2, 4, 8 | L'existence ne démontre pas un optimum global. |
| Point de commande produit fini | Fonction consolidée | Calcul stock de sécurité plus demande pendant délai à la ligne 2474 | `pointCommandeProduit` | IMPLEMENTE | 2, 4, 8 | Paramètre de politique de stock. |
| Quantité économique de Wilson | Fonction consolidée | Formule générique à la ligne 980, appel produit à la ligne 2478 et bornage à la ligne 1001 | `calculerQuantiteEconomique`, `bornerQuantiteLot` | IMPLEMENTE | 2, 4, 8 | Le bornage est une règle de stabilité du modèle. |
| Politique autonome matière | Fonction consolidée | Boucle de besoins nets à partir de la ligne 1023 et déclenchement si le seuil est atteint à la ligne 1144 | `calculerBesoinsNets` | IMPLEMENTE | 2, 4, 8 | Le Run B montre un approvisionnement GPL. |
| Stock projeté et réceptions attendues | Fonction consolidée | Somme des réceptions et calcul du stock projeté aux lignes 1133 à 1141 | `totalReceptionsAttendues`, `stockProjete`, `receptionsAttendues` | IMPLEMENTE | 2, 4, 8 | Les réceptions sont des objets datés, pas un crédit immédiat. |
| Initialisation des stocks | Invariant de reproductibilité | Chargement JSON matière à la ligne 14525, initialisation produit et matière aux lignes 3617 à 3654, initialisation multi-produit à la ligne 6644 | `initialiserStocksProduits`, `stockInitialConfigure` | IMPLEMENTE | 2, 8 | Les valeurs du JSON prévalent après chargement. |
| Source avant Make lorsque la matière manque | Chaîne contrôlée consolidée | L'analyse de stock orientée est définie à la ligne 2590 et la matière disponible est transmise de Source à Make dans la chaîne AER | `analyserStockCommandeOrchestree`, `calculerBesoinsNets` | IMPLEMENTE | 4 | L'ordre Source puis Make est aussi observé dans le Run B. |
| Crédit du stock produit fini | Correction consolidée | Incrément du stock physique hors jetons visuels aux lignes 44107 à 44110 | `niveauStock`, `estFluxVisuelSeulement` | IMPLEMENTE | 4 | Le crédit se produit au stockage M1.5. |
| Réveil de la commande cliente | Correction consolidée | Réanalyse immédiate des commandes en attente aux lignes 11596 à 11609 | `analyserStockCommandeOrchestree` | IMPLEMENTE | 4 | Le réveil intervient après clôture de l'ordre autonome. |
| Décrément du stock à la satisfaction client | Correction consolidée | Décrément direct aux lignes 6694 à 6697, appel après production aux lignes 11681 à 11693 | `consommerStockFiniProduit` | IMPLEMENTE | 4, 6 | Le Run B termine avec un stock fini nul. |
| Exclusion des `REAPPRO_*` des KPI clients | Correction consolidée | Exclusion dans `verifierFillRate` aux lignes 12179 à 12192 et dans le Takt Time aux lignes 7827 à 7839 | `verifierFillRate`, `calculerTaktTimeSec` | IMPLEMENTE | 6, 7 | Les ordres internes restent visibles dans les traces. |
| Taux de service et remplissage | Fonction consolidée | Fonctions de service et de ponctualité aux lignes 6723 et 12171 à 12219 | `tauxServiceGlobal`, `verifierFillRate`, `verifierConformiteLivraison` | IMPLEMENTE | 6, 7 | Les dénominateurs portent sur les commandes clientes closes. |
| WIP physique hors jetons visuels | Correction consolidée | Exclusion par type et identifiant aux lignes 4408 à 4425 | `wipReelSansJetonsVisuels`, `estFluxVisuelSeulement` | IMPLEMENTE | 6 | Une animation ne constitue pas une entité physique. |
| Rebuts et reprises | Fonction consolidée | Compteurs et remontées KPI aux lignes 45948 à 46020, taux aux lignes 6782 à 6801 | `notifierRebut`, `notifierRework`, `tauxRebutPct`, `tauxReprisePct` | IMPLEMENTE | 4, 6, 8 | Le Run B donne zéro, mais ne valide pas une campagne qualité. |
| Echelle temporelle | Fonction consolidée | `simToRealSeconds = 600` à la ligne 2070 et conversion Source, Deliver, Plan et Return à la ligne 2250 | `simToRealSeconds`, `dureePourSimulation` | IMPLEMENTE | 2, 4, 6, 8 | Make conserve sa dynamique propre. |
| Retard fournisseur déterministe | Fonction consolidée | Ciblage, facteur et délai effectif aux lignes 3152 à 3177, compteurs aux lignes 3191 à 3204 | `retardFournisseurTestActif`, `facteurRetardFournisseur`, `enregistrerRetardFournisseurForce` | IMPLEMENTE | 5, 8 | Le Run B vérifie 6 h nominales et 12 h effectives pour le GPL. |
| `SupplierDelayAlert` | Fonction consolidée | Emission à la ligne 3233 | `tracerFluxHierarchique` | IMPLEMENTE | 5 | Message structuré observé dans le Run B. |
| Propagation vers Make et Deliver | Fonction consolidée | Chaîne `OperationalException`, `ProcessDeviationReport`, `RevisedMaterialAvailability`, `RevisedProductionCompletionDate`, `RevisedDeliveryPlan` aux lignes 3235 à 3244 | `enregistrerRetardFournisseurForce` | IMPLEMENTE | 5 | Les six messages sont structurés dans l'ABox du Run B. |
| Panne machine | Fonction consolidée | Processus panne et réparation aux lignes 43438 à 43490, escalade immédiate aux lignes 49657 à 49700 | `MachineSim`, `signalerPanne`, `enPanne` | IMPLEMENTE | 5, 8 | Aucune panne n'est validée par le Run B. |
| Détection de goulot | Fonction consolidée | Evaluation de l'état courant aux lignes 49790 à 49832 | `detecterGoulot`, `tailleFile`, `wtMoyen` | IMPLEMENTE | 5, 6 | Les résultats historiques restent secondaires. |
| Blackboard | Architecture consolidée | Classe `BlackboardAgent`, journaux AER et publication d'observations, notamment lignes 45865, 46869 et 49849 | `BlackboardAgent` | IMPLEMENTE | 3, 5 | Le Run B contient des traces de publication, sans valider chaque boucle historique. |
| AER | Architecture consolidée | Routage hiérarchique et messages typés, notamment lignes 3233 à 3244 et 7329 à 7378 | `AERMessage`, `tracerFluxHierarchique` | IMPLEMENTE | 3, 5 | Les messages de retard du Run B sont structurés dans Excel et TTL. |
| Arbitrage AHP | Fonction consolidée | Matrice et score aux lignes 46889 à 46944, décision aux lignes 46950 à 47020 | `scorerGoulotAHP`, `prendreDecisionAHP` | IMPLEMENTE | 5 | Aucun résultat AHP du Run B n'est utilisé comme preuve de performance globale. |
| Séparation AHP et PI | Invariant méthodologique | Commentaire et agrégation du PI aux lignes 48635 à 48645 | `calculerPIGlobal`, `prendreDecisionAHP` | IMPLEMENTE | 5, 7, 9 | L'AHP arbitre localement, le PI agrège RL, RS, AG, CO et AM. |
| KPI VSM | Fonction consolidée | Cycle, attente, Lead Time, débit, WIP, qualité et disponibilité construits dans le pipeline à partir de la ligne 48476 | `calculerPIGlobal`, `KPIBundle` | IMPLEMENTE | 6 | Les valeurs du Run B restent soumises à la divergence Waiting Time Excel et ABox. |
| Pipeline SCOR vers PI | Fonction consolidée | Construction par attributs RL, RS, AG, CO et AM aux lignes 48476 à 48645 | `calculerPIGlobal`, `MetriqueN3`, `FuzzyGradeSet` | IMPLEMENTE | 7 | Le proxy `PROXY.AG.SYSTEM_UTILIZATION` est explicitement identifié à la ligne 48573. |
| Export Excel | Fonction consolidée | Fonction d'export à la ligne 20452 et appel final après clôture à la ligne 5383 | `exporterToutesLesTablesExcel` | IMPLEMENTE | 1, annexes D et E | Un classeur primaire du Run B est présent. |
| Export ABox | Fonction consolidée | Fonction d'export à la ligne 8304 et appel de clôture à la ligne 5382 | `exporterABoxRuntimeTTL` | IMPLEMENTE | 1, 3, 5, annexe E | Une ABox primaire du Run B est présente. |
| Flux Return | Fonction consolidée | Catalogue SCOR Return aux lignes 241 à 248 et chaîne temporisée aux lignes 4351 à 4386 | `CATALOGUE_SCOR_N3`, `declencherRetourClient` | IMPLEMENTE | 4, 8 | Return n'est pas exécuté dans le Run B. |
| Garde ISA-95 finale | Contrainte de non-régression | Condition exacte `isa95Hierarchy.size()==190 && isa95Assignments.size()==71` à la ligne 22401 | `isa95Hierarchy`, `isa95Assignments` | IMPLEMENTE | 3, annexe E | Les anciennes valeurs 179 et 64 sont écartées. |

## Conclusion probatoire

Les mécanismes recensés dans `MODEL_EVOLUTION.md` ont une destination et une preuve d'implémentation dans le modèle final. Le run VSM valide en plus la liaison `CMD_1` et `REAPPRO_1`, la séparation des périmètres temporels, les six indicateurs VSM, l'alimentation de Responsiveness et le calcul du PI dans le cadre du modèle. Cette promotion ne transforme pas les autres scénarios non rejoués en résultats expérimentaux.
