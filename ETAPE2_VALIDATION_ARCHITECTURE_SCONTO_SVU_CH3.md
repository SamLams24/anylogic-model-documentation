# Étape 2 (corrigée) — Validation de l'architecture documentaire et préparation de la refonte scientifique (chapitre 3)

Ce document corrige et remplace la première version de l'étape 2, à la suite de vos arbitrages du [message de retour]. Il s'appuie sur `AUDIT_ONTOLOGIE_SCONTO_SVU_CH3.md` (déjà corrigé sur le point 1, voir ci-dessous) et sur une vérification technique directe des fichiers `.ttl` et `.drawio` (grep, comparaison de classes, pas seulement un raisonnement par différentiel de version). Aucun artefact ontologique ni fichier du manuscrit n'a été modifié.

---

## 1. Correction du point relatif au SVU Framework

Confirmé et corrigé, directement dans `AUDIT_ONTOLOGIE_SCONTO_SVU_CH3.md` (section 3.1 point 5, et section 8 point 1, modifiées sur place). Rappel de ce que la lecture du manuscrit établit :

- **SVU Framework** = *SCOR-VSM Unification Framework*, cadre fonctionnel décrit en §3.2-3.4 du manuscrit, organisé en quatre couches (**Data Layer**, **VSM Layer**, **SVU Layer**, **SCOR Layer**) plus un mécanisme de **gouvernance stratégique/tactique**.
- **SCONTO-SVU** = *Semantic Supply Chain Ontology for SCOR-VSM Unification*, formalisation ontologique de ce cadre, présentée en §3.5.
- Citation du manuscrit (p. 89) : « Le SVU Framework définit l'architecture conceptuelle du modèle [...] L'ontologie SCONTO-SVU formalise ensuite cette architecture dans un modèle sémantique structuré [...] assurant notamment la représentation des contextes d'observation, des micro-activités, des règles de normalisation, de correspondance, d'agrégation et de traçabilité. »

**Nuance d'acronyme non résolue, à traiter dans la rédaction** : le Core nomme en interne sa couche pivot `SVMLLayer`, avec le label anglais « SVML – SCOR-VSM **Mapping** Layer » (`SCONTO_SVU_Core_v4.3.0.ttl`, ligne 92), alors que le manuscrit et le diagramme à six bandes emploient « SVU » (SCOR-VSM **Unification**). Même couche, deux acronymes. Une phrase d'explicitation dans le chapitre (« la couche implémentée sous le nom technique SVML correspond à la SVU Layer décrite en §3.4 ») suffit ; aucune modification de l'ontologie n'est nécessaire ni souhaitée à ce stade.

---

## 2. Exclusion scientifique d'AHP

Inchangée par rapport à l'étape précédente. Aucun artefact historique supprimé. Rappel du constat déjà établi : la version retenue de Forecast/MTS (la plus récente, 4 juin) n'importe déjà pas AHP, donc l'exclusion ne nécessite aucune réécriture de sa description.

---

## 3. Architecture graphique — F1 et F2

### F1 — Organisation globale de SCONTO-SVU

Contenu requis : Core + extensions scientifiquement retenues (Agent, AER, Forecast/MTS, ISA-95), avec distinction visuelle explicite entre :
- dépendances **validées** (Agent 1.1.2 → Core 4.3.0 ; AER 1.1.2 → Core 4.3.0 + Agent 1.1.2), testées par raisonneur ;
- dépendances **non revalidées** (Forecast/MTS 1.0.0 → Core 4.1.0/Agent 1.0.0 ; ISA-95 1.0.0 → Core 4.1.0), génération antérieure à la ligne courante.

Convention graphique suggérée : un style de trait plein pour les dépendances validées, un style de trait pointillé (ou une couleur de fond distincte, sobre, compatible niveaux de gris) pour les dépendances non revalidées, avec une légende explicite. Aucune source graphique existante ne couvre ce périmètre exact (Core + 4 extensions avec ce double statut) — **F1 reste intégralement à construire**.

### F2 — Architecture conceptuelle du Core

Base retenue : `sconto_svu_core_main_concepts.drawio` et ses six regroupements conceptuels (*Architecture and Logistics Network*, *Operational Entities*, *Operational Events*, *VSM and Observation Context*, *SVU pivot Module*, *SCOR reference framework*).

Conformément à votre consigne, trois niveaux sont à ne pas confondre et à traiter séparément dans F2 :
1. **Architecture de fichiers** : un seul fichier `.ttl` (`SCONTO_SVU_Core_v4.3.0.ttl`) — non pertinent pour F2, pertinent seulement pour l'inventaire documentaire.
2. **Regroupement conceptuel** : les six bandes, qui sont un regroupement éditorial du diagramme, pas une structure déclarée dans l'OWL. L'ontologie elle-même ne porte pas de classe ou d'annotation « bande » — c'est une lecture de présentation, à assumer comme telle dans la légende de F2.
3. **Hiérarchie de classes réelle** : le fichier `.ttl` est structuré en **quatorze modules internes explicitement nommés** (commentaires `# MODULE A` à `# MODULE N`), bien plus fins que les six bandes. Table de correspondance vérifiée (section 4 ci-dessous).

F2 devra, comme demandé, s'inspirer du registre des figures UML de SCOPRO/SCOME/SCOBE (classes structurantes, relations principales, spécialisations, cardinalités, contraintes) **uniquement pour les éléments réellement déclarés** dans les modules du Core — pas de restitution de cardinalités ou de contraintes qui ne figureraient pas explicitement dans le `.ttl`.

---

## 4. Vérification technique des diagrammes

### 4.1 Les quatorze modules internes du Core 4.3.0 (fait nouveau, non présent dans l'audit initial)

Extraits directement des commentaires de structuration du fichier (`SCONTO_SVU_Core_v4.3.0.ttl`) :

| Module | Intitulé interne | Bande du diagramme à six bandes la plus proche |
|---|---|---|
| A | Couches architecturales | *Architecture and Logistics Network* |
| B | Chaîne logistique et acteurs | *Architecture and Logistics Network* |
| C | Structure opérationnelle générique | *Operational Entities* |
| D | Stockage, WIP et flux matière | *Operational Entities* |
| E | Systèmes d'information et rôles informationnels | *Operational Entities* |
| F | Ressources humaines, produits et ordres | *Operational Entities* |
| G | Événements bruts et observations | *Operational Events* |
| H | Indicateurs VSM et contexte d'observation | *VSM and Observation Context* |
| I | Référentiel SCOR et métriques [corrigé V4.1] | *SCOR reference framework* |
| J | Couche pivot **SVML** [propriétés mises à jour V4.1] | *SVU pivot Module* |
| K | Fonctions d'agrégation génériques | *SVU pivot Module* |
| L | Exemples de règles génériques d'agrégation | *SVU pivot Module* (exemples, pas des classes structurantes) |
| M | Exemple minimal d'instanciation générique | — (instanciation ABox, hors périmètre conceptuel de F2) |
| N | Étude de cas « Company A » [ajout V4.2] | — (instanciation ABox, candidat pour F9, pas pour F2) |

**Correction factuelle par rapport à l'audit initial** : le changelog du Core attribue l'ajout du Module N à la version 4.2, ce qui avait laissé entendre, dans l'audit, que les apports du pipeline de performance (`hasMetricValue`, `hasPerformanceScore`, `FuzzyPerformanceGradeSet`, poids de métriques/attributs) se trouvaient dans ce module. **Vérification directe (localisation par ligne) : ces propriétés et classes sont physiquement situées dans le Module I** (« Référentiel SCOR et métriques », lignes 770-1076), pas dans le Module N. Le Module N (lignes 1409 et suivantes) ne contient que l'instanciation du cas d'étude « Company A » (données d'exemple utilisant ces propriétés, pas leur définition). Cette précision importe pour F2 : c'est la représentation du **Module I**, pas du Module N, qui doit être vérifiée et complétée.

### 4.2 Couverture réelle des apports V4.2/V4.3 dans les deux diagrammes Core (vérification par recherche directe, pas par supposition)

| Élément ajouté en V4.2/V4.3 (Module I) | `sconto_svu_core_main_concepts.drawio` (six bandes) | `01_CORE.drawio` |
|---|---|---|
| `hasMetricValue` | **Absent** (0 occurrence) | **Absent** (0 occurrence) |
| `hasPerformanceScore` | **Absent** | **Absent** |
| `FuzzyPerformanceGradeSet` | **Absent** | **Absent** |
| `hasMetricWeight` | **Absent** | **Absent** |
| `hasAttributeWeight` | **Absent** | **Absent** |
| `SCORPerformanceEvaluation` | **Absent** | Présent (3 occurrences) |
| Couche pivot, sous son nom interne `SVML` | **Absent** (la bande correspondante est nommée « SVU pivot Module », pas « SVML ») | Présent (3 occurrences, le diagramme utilise bien le nom interne SVML) |
| `ArchitectureLayer` / `OperationalDataLayer` (Module A) | Présent partiellement (`ArchitectureLayer` : 2 occurrences ; `OperationalDataLayer` : absent) | Présent (`ArchitectureLayer` : 7 ; `OperationalDataLayer` : 2) |

**Conclusion vérifiée, plus précise que dans l'audit initial** : les deux diagrammes datent d'avant les apports du pipeline de performance (V4.2/V4.3 du Module I) et ne les représentent ni l'un ni l'autre. `01_CORE.drawio`, plus détaillé, couvre mieux le Module A et une partie du Module I (`SCORPerformanceEvaluation`, `SVML`) que le diagramme à six bandes, qui reste plus schématique. **Aucun des deux ne peut servir de F2 définitive sans un complément dédié au Module I** (pipeline de scoring, grades flous, pondérations) — ce complément est un ajout graphique à faire, pas une correction d'erreur.

### 4.3 Agent et AER : vérification structurelle complète, pas seulement le différentiel 1.1.1→1.1.2

Recherche directe des classes réelles d'Agent 1.1.2 et d'AER 1.1.2 (29 classes/propriétés extraites pour Agent, 42 pour AER) dans `02_AGENT.drawio` et `03_AER.drawio` :

- `02_AGENT.drawio` contient bien `HolonAgent`, `StrategicAgent`, `TacticalAgent`, `CoordinatorAgent`, `OperationalPilotAgent`, `OperationalExecutionAgent`, `SupervisorAgent`, `MachineAgent`, `BlackboardAgent`, `OperationalAgent`, `AgentPerformanceRecord`, `computesSCORMetric` — toutes présentes, aucune absente.
- `03_AER.drawio` contient bien `OperationalPilotReport`, `SupervisorReport` (les deux, conformément à la coexistence historique/actuelle déjà documentée), `AccountabilityReport`, `MachineReport`, `AERRoutingRule`, `AERCorrelation`, `ExceptionReport`, `ReplanningRequestMessage`, `MachineExecutionMessage` — toutes présentes.

**Conclusion** : la vérification structurelle directe confirme ce que le raisonnement par différentiel de version avait seulement supposé. `02_AGENT.drawio` et `03_AER.drawio` sont bien structurellement conformes à Agent 1.1.2 et AER 1.1.2, pas seulement « probablement inchangés depuis 1.1.1 ». Ce sont les deux diagrammes les plus solidement vérifiés de tout l'inventaire.

---

## 5. Versions et compatibilité

**Identité des artefacts C14/C14.3 confirmée** (déjà établie dans l'audit par `diff`, rappelée ici sur votre demande) : les quatre fichiers `.ttl` de `SCONTO_SVU_C14_3_COLLEAGUE_VALIDATED_JSON_INTEGRATION_TEST_PACKAGE` sont octet pour octet identiques à ceux de `SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE`. **C14 reste la référence du schéma** (bundle complet avec SCOPRO/SCOME/SCOBE et catalogue), **C14.3 est l'état projet postérieur sans évolution de schéma**. Aucun changement par rapport à l'audit.

Forecast/MTS et ISA-95 : confirmé, non présentées comme alignées sur Core 4.3.0 (formulation déjà proposée en étape 2, section 2 — reprise ci-dessous section 7). Aucune modification d'import ni d'IRI n'a été faite ni n'est prévue.

---

## 6. Organisation scientifique — répartition chapitre 3 / chapitre 4

Correction majeure par rapport à la proposition précédente, qui plaçait à tort Agent, AER et ISA-95 dans la section 3.5. Nouvelle répartition, conforme à votre consigne :

- **Chapitre 3** : Core et formalisation de l'unification SCOR-VSM. Couvre F1 (organisation générale, pour situer les extensions sans les détailler), F2 (architecture conceptuelle du Core), et la présentation des modules A à L du Core avec leurs tableaux de contraintes.
- **Chapitre 4** : architecture multi-agents, Agent Extension, AER Extension, alignement ISA-95. Couvre F4 (classes Agent), F5 (classes AER), F8 (classes ISA-95).
- **Chapitres expérimentaux** : prévision, replanification, politiques Make-to-Stock, exploitation de Forecast/MTS. **Confirmé par votre arbitrage du tour suivant** : Forecast/MTS ne figure donc pas dans le chapitre 3 par défaut — ce point, laissé ouvert dans la version précédente de ce document, est désormais tranché (voir `ETAPE3_CONSOLIDATION_MODULES_DIAGRAMMES.md`, section 2, pour la matrice de figures à jour).

Conséquence sur la matrice de figures (section 9) : F4, F5 et F8 changent de chapitre cible par rapport à la version précédente de ce document. F1 doit rester suffisamment générale pour ne pas empiéter sur le détail que le chapitre 4 développera — elle montre l'existence et le statut des dépendances, pas la structure interne de chaque extension.

---

## 7. Documentation SCONTO : divergence SCOME/SCOBE non résolue

Vérification demandée, faite à partir des fichiers OWL réellement utilisés (pas d'hypothèse) :

**Texte de l'article de référence** (p. 2, section 2) : *« SCONTO is organized in three complementary sub-ontologies: SC processes (SCOPRO), performance evaluation (SCOBE) and benchmarking (SCOME), which are shown in Fig. 1. »* — l'article associe donc **SCOBE → évaluation de performance** et **SCOME → benchmarking**.

**Contenu réel des fichiers `.owl` utilisés dans le projet** (vérifié par lecture directe des métadonnées et des classes, cf. audit §1.1 et rapport de l'agent dédié) :
- `SCOME.owl` : `rdfs:comment = "Supply Chain Ontology Mesurement"` ; classes `Metric`, `Composite_Metric`, `Performance_Attribute`, `SC_Performance_Concept`, `SC_Reliability`, `SC_Cost`, `SC_Agility`, échelles de mesure — contenu de **mesure/évaluation de performance**.
- `SCOBE.owl` : classes `Benchmarking_Project`, `Benchmarking_Group`, `Group_Evaluation_Criterion`, `Reference_Group`, `Reference_Practice`, `Reference_Value` — contenu de **benchmarking**.

Les fichiers réels associent donc l'inverse de la phrase de l'article : **SCOME → évaluation/mesure de performance**, **SCOBE → benchmarking**. C'est également cette seconde association (fichiers réels) que suit le Core SCONTO-SVU lui-même, qui hérite de `scome:Performance_Attribute` et `scome:Atomic_Metric`/`scome:Composite_Metric` pour ses propres métriques de performance (cf. audit §3.3).

**Je ne tranche pas cette divergence.** Les deux sources sont sourcées précisément ci-dessus ; il peut s'agir d'une inversion dans la phrase de l'article, d'une évolution des ontologies SCOPRO/SCOME/SCOBE postérieure à la publication de l'article, ou d'une autre explication qui demande une vérification externe (la documentation OnToology citée par l'article, à l'adresse `https://industrialonto.github.io/SCOPRO/OnToology/SCOPRO.owl/documentation/index-en.html`, n'a pas été consultée dans cet environnement hors ligne). **Recommandation pour le chapitre** : décrire SCOME et SCOBE selon le contenu réel des fichiers `.owl` effectivement importés par le Core (SCOME = mesure, SCOBE = benchmarking), puisque c'est ce contenu qui est techniquement utilisé, tout en signalant en note que la phrase introductive de l'article source associe les deux noms dans l'ordre inverse. **Validation humaine utile** si vous disposez d'un accès à la documentation OnToology ou à une version plus récente de l'article qui permettrait de trancher l'origine de cette divergence.

---

## 8. Livrables graphiques

Dossier `figures/` avec exports PNG, SVG et sources éditables : pris en compte pour la phase de production (non engagée à ce stade). Convention de nommage et sobriété graphique (lisibilité en niveaux de gris, représentation fidèle des cardinalités et contraintes attestées) à appliquer à F1 et F2 en priorité dès leur construction.

---

## 9. Matrice corrigée des figures — emplacement, sources, fiabilité, vérifications restantes

| ID | Titre | Chapitre | Sources OWL | Fiabilité de la source graphique existante | Peut être produite maintenant ? | Vérification technique restante |
|---|---|---|---|---|---|---|
| F1 | Organisation globale de SCONTO-SVU | 3 | Imports réels de tous les `.ttl` retenus (section 5) | Aucune source existante, à construire | **Non** — conception graphique à faire (convention trait plein/pointillé) | Aucune, les faits de dépendance sont déjà vérifiés |
| F2 | Architecture conceptuelle du Core | 3 | Modules A-L du Core 4.3.0 | `sconto_svu_core_main_concepts.drawio` : partiel (Module I absent) ; `01_CORE.drawio` : plus complet mais sans le pipeline de scoring/pondérations | **Non** — nécessite un complément Module I avant finalisation | Compléter la représentation du Module I (scoring, grades flous, pondérations) dans l'une des deux bases, à choisir |
| F4 | Diagramme de classes Agent | 4 | Agent 1.1.2 | `02_AGENT.drawio` — **vérifié structurellement conforme** (29 classes contrôlées, toutes présentes) | **Oui** | Aucune |
| F5 | Diagramme de classes AER | 4 | AER 1.1.2 | `03_AER.drawio` — **vérifié structurellement conforme** (classes contrôlées, toutes présentes) | **Oui** | Aucune |
| F7 | Diagramme de classes Forecast/MTS | 3 (provisoire, à confirmer) | `sconto-vsm-forecast-mts-extension_1.ttl` (Core 4.1.0/Agent 1.0.0, non revalidé) | `05_FORECAST_MTS.drawio`, conservable | **Oui**, avec légende obligatoire sur la non-revalidation | Confirmer le rattachement chapitre 3 vs 4 avec vous |
| F8 | Diagramme de classes ISA-95 | 4 | `sconto-vsm-isa95-extension-v1.0.ttl` (Core 4.1.0, non revalidé) | `06_ISA95.drawio`, conservable | **Oui**, avec la même légende | Aucune hors légende |
| F9 | Exemple d'instanciation et traçabilité | 3 | Un export ABox réel (run ZENER SA Togo recommandé, à nommer précisément avec vous) | Module N (Core) comme modèle de structure d'exemple, mais à base de données réelles, pas celles du Module N lui-même | **Non** — choix du run requis | Désigner le run ABox exact |

*(F3, F6 : supprimées de la matrice — F3 est fusionnée dans F2 pour éviter la redondance UML/conceptuel signalée en §3 ; F6 était la figure AHP, hors périmètre.)*

**Ce qui peut être produit immédiatement, sans nouvelle vérification** : F4, F5, et F7/F8 sous réserve de leur légende de non-revalidation.
**Ce qui nécessite une validation ou un complément avant production** : F1 (conception à faire), F2 (complément Module I), F9 (choix du run), et la question du rattachement chapitre de F7 (Forecast/MTS, section 6).

---

*Document soumis pour validation. Aucune rédaction finale ni génération définitive de figure n'a été engagée.*
