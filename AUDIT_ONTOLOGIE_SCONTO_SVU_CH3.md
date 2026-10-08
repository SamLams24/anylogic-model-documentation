# Audit documentaire — refonte de la présentation de l'ontologie SCONTO-SVU (chapitre 3)

Document de première étape, pour validation. Aucun fichier source n'a été modifié, déplacé ni supprimé : cet audit est exclusivement un travail de lecture et de recoupement. Toutes les affirmations ci-dessous sont sourcées par un chemin de fichier exact ; lorsque la source est insuffisante pour trancher, cela est dit explicitement plutôt que supposé.

Trois explorations ont été menées en parallèle puis recoupées manuellement : (1) l'historique `evolution_project\` (packages C11 à C14.3), (2) les extensions AHP / Forecast-MTS / ISA-95 à la racine de `Downloads` et dans ses sous-dossiers, (3) les fichiers `SCOPRO.owl` / `SCOBE.owl` / `SCOME.owl`. La lecture de l'article de référence (*SCONTO: A Modular Ontology for Supply Chain Representation*, 16 pages, lu intégralement) complète cet audit pour calibrer le plan proposé en section 6.

---

## 1. Inventaire documentaire (chemins exacts)

### 1.1 Ontologies tierces (SCOPRO / SCOME / SCOBE)

Trois fichiers uniques, chacun dupliqué trois fois à l'identique (MD5 confirmés octet pour octet) :

| Fichier | Occurrences |
|---|---|
| `SCOPRO.owl` | `C:\Users\LENOVO\Desktop\Projet Supply Chain\Ontology Making\SCOPRO.owl` (ouvert dans l'IDE) ; `...\evolution_project\SCONTO_SVU_S2_2_C11_FINAL_REASONER_READY_PACKAGE\SCOPRO.owl` ; `...\C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCOPRO.owl` |
| `SCOBE.owl` | mêmes trois emplacements |
| `SCOME.owl` | mêmes trois emplacements |

Copies texte brutes identiques (probablement pour lecture/partage) : `C:\Users\LENOVO\Downloads\scopro.txt`, `scobe.txt`, `scome.txt`.

### 1.2 Noyau Core (ligne « réaligneé », `evolution_project\`)

| Fichier | Version | mtime |
|---|---|---|
| `evolution_project\SCONTO_SVU_SCHEMA_COMPLETE_Core4.2_Agent1.1_AER1.1_SCOPRO_SCOME_SCOBE.ttl` (bloc interne Core) | 4.2.0 | 2026-08-11 11:21 |
| `evolution_project\SCONTO_SVU_S2_2_C11_FINAL_REASONER_READY_PACKAGE\SCONTO_SVU_Core_v4.2.1.ttl` (= copie C13) | 4.2.1 | 2026-08-11 11:48 / 14:18 |
| `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCONTO_SVU_Core_v4.3.0.ttl` (= copie C14.3) | **4.3.0** | 2026-08-11 18:03 / 2026-08-13 16:11 |

### 1.3 Noyau Core (racine `Downloads`, ligne antérieure à la réalignement)

| Fichier | Version | mtime |
|---|---|---|
| `Downloads\sconto_vsm_v4_corrected.ttl` | 4.0.0 | 2026-05-29 |
| `Downloads\sconto-vsm-v4.1.ttl` | 4.1.0 | 2026-06-01 |

### 1.4 Extensions Agent / AER (ligne réalignée)

| Fichier | Version | Import Core |
|---|---|---|
| `evolution_project\SCONTO_VSM_Agent_Extension_v1.1_CURRENT_ARCHITECTURE.ttl` | 1.1.0 | core/4.2.0 |
| `...\C11...\SCONTO_VSM_Agent_Extension_v1.1.1.ttl` (= C13) | 1.1.1 | core/4.2.1 |
| `...\C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCONTO_VSM_Agent_Extension_v1.1.2.ttl` (= C14.3) | **1.1.2** | core/4.3.0 |
| `evolution_project\SCONTO_VSM_AER_Extension_v1.1.ttl` | 1.1.0 | core/4.2.0, agent/1.1.0 |
| `...\C11...\SCONTO_VSM_AER_Extension_v1.1.1.ttl` (= C13) | 1.1.1 | core/4.2.1, agent/1.1.1 |
| `...\C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCONTO_VSM_AER_Extension_v1.1.2.ttl` (= C14.3) | **1.1.2** | core/4.3.0, agent/1.1.2 |

### 1.5 Extensions AHP, Forecast/MTS, ISA-95 (racine `Downloads`, jamais intégrées à la ligne réalignée)

| Fichier | mtime | Version | Imports |
|---|---|---|---|
| `Downloads\sconto-vsm-ahp-extension.ttl` | 2026-06-03 20:53 | 1.0.0 | core/**4.1.0**, agent/**1.0.0**, aer/**1.0.0** |
| `Downloads\sconto-vsm-forecast-mts-extension.ttl` | 2026-06-03 21:42 | 1.0.0 | core/4.1.0, agent/1.0.0, aer/1.0.0, **+ ahp/1.0.0** |
| `Downloads\sconto-vsm-forecast-mts-extension_1.ttl` (= `docs_new\...`) | **2026-06-04 22:14** (plus récent) | 1.0.0 (même versionIRI) | core/4.1.0, agent/1.0.0, aer/1.0.0 (**sans AHP**) |
| `Downloads\sconto-vsm-isa95-extension-v1.0.ttl` (= `docs_new\...`) | 2026-06-02 21:00 | 1.0.0 | core/4.1.0 **uniquement** |

### 1.6 Diagrammes (sources .drawio, racine `Downloads` sauf indication)

- `SCONTO_VSM_v4_1_corrige.drawio` (2026-06-08 17:30, 5 pages : Core, Agent, AER, ISA-95, Forecast) — source retenue pour `01_CORE`, `02_AGENT`, `03_AER` dans le dossier de supervision.
- `SCONTO_VSM_AHP_extension.drawio`, `SCONTO_VSM_Forecast_MTS_extension.drawio`, `sconto_isa95_extension_v1.0.drawio` — sources retenues pour `04_AHP`, `05_FORECAST_MTS`, `06_ISA95`.
- `sconto_vsm_v4_class_diagram.puml` / `_FIXED.puml` / `_REALIGNED.puml` (30/05–31/05, tous explicitement « v4.0 »).
- **`sconto_svu_core_main_concepts.drawio`** (`Downloads\`, 2026-07-01 20:18, et copie identique dans `DocumentsToSend\`) — diagramme non répertorié dans `ONTOLOGIES_DIAGRAMMES_SUPERVISION`, découvert dans cet audit (détail en section 5).
- `SendToMrsANAKPA\sconto_svu_core_main_concepts (1).drawio` + rendus `.png`/`.svg`/`.jpg` — **version anglaise** du même diagramme (labels traduits, structure identique), avec exports visuels déjà disponibles.

### 1.7 Dossier de supervision déjà constitué

`work on documentation\ONTOLOGIES_DIAGRAMMES_SUPERVISION\` (`DRAWIO\01_CORE.drawio` à `06_ISA95.drawio`, `ARCHIVES_SOURCE\`, `PDF\`, `PNG\`, `MANIFESTE.md`, `README.md`) — déjà produit dans ce même travail, sert de base de départ pour la cartographie des diagrammes (section 5).

### 1.8 Documents de description/critique (racine `Downloads`, non relus intégralement dans cet audit)

`description_sconto_vsm_v4.md` (cite explicitement l'intégration SCOPRO/SCOME/SCOBE, voir section 3), `SCONTO-VSM_Description_Complete*.docx` (plusieurs variantes), `Analyse des critiques sur l'ontologie SCONTO-VSM.pdf`/`.docx`, `Description_SCONTO_VSM_AHP_Extension.md` (+ variante `_1.md`, taille identique).

---

## 2. Matrice des versions et de leur fiabilité

| Ontologie/extension | Version la plus avancée trouvée | Fichier de référence | Fiabilité |
|---|---|---|---|
| Core | **4.3.0** | `evolution_project\...\C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCONTO_SVU_Core_v4.3.0.ttl` | Élevée — testée par raisonneur (HermiT), 0 classe insatisfaisable d'après `C14_RAPPORT_ALIGNEMENT_FINAL.md` |
| Agent Extension | **1.1.2** | même package, `SCONTO_VSM_Agent_Extension_v1.1.2.ttl` | Élevée — diff 1.1.1→1.1.2 vérifié : seuls le pointeur d'import Core et la versionIRI changent, aucune classe modifiée |
| AER Extension | **1.1.2** | même package, `SCONTO_VSM_AER_Extension_v1.1.2.ttl` | Élevée, même constat que ci-dessus |
| AHP | 1.0.0 (unique version existante) | `Downloads\sconto-vsm-ahp-extension.ttl` | **Faible** — n'a jamais été migrée au-delà de Core 4.1.0 / Agent 1.0.0 / AER 1.0.0, jamais revalidée par le raisonneur avec la ligne actuelle |
| Forecast/MTS | 1.0.0, variante du 04/06 sans lien AHP (la plus récente) | `Downloads\sconto-vsm-forecast-mts-extension_1.ttl` | **Faible**, même constat de non-migration ; de plus, deux variantes de contenu partagent le même numéro de version (voir §4) |
| ISA-95 | 1.0.0 (unique version existante) | `Downloads\sconto-vsm-isa95-extension-v1.0.ttl` | **Faible** pour la même raison de non-migration, mais modélisation interne simple (dépendance Core uniquement) et cohérente avec elle-même |
| SCOPRO / SCOME / SCOBE | sans version explicite (ontologies tierces figées, 2014) | voir §1.1 | Élevée — jamais modifiées, chargées et testées par raisonneur à chaque génération du Core |

**Constat central, à reporter explicitement dans le chapitre** : AHP, Forecast/MTS et ISA-95 ne dépendent pas seulement d'une version « un peu ancienne » de l'Agent Extension (ce que signalait déjà `MANIFESTE.md`) : elles dépendent d'une génération de Core entièrement antérieure à la branche de réalignement (**4.1.0**, alors que la version courante est **4.3.0**) et d'un Agent Extension à l'état **1.0.0** (alors que la version courante est **1.1.2**, laquelle a changé l'identité des agents opérationnels et le format de rapport de supervision). Aucune des trois extensions n'a donc été revalidée depuis la réalignement.

---

## 3. Cartographie vérifiée des modules et dépendances

### 3.1 Distinction technique/conceptuelle (demandée explicitement)

1. **Ontologies techniques (fichiers OWL/RDF/Turtle)** : SCOPRO.owl, SCOME.owl, SCOBE.owl (tierces) ; Core (`.ttl`) ; Agent Extension (`.ttl`) ; AER Extension (`.ttl`) ; AHP, Forecast/MTS, ISA-95 (`.ttl`, non maintenues).
2. **Extensions dépendant du Core ou d'autres extensions** : voir graphe d'imports ci-dessous, entièrement vérifié par lecture directe des en-têtes `owl:imports`, aucune dépendance supposée.
3. **Modules conceptuels internes** : dans SCONTO (article de référence), SCOPRO est structuré en trois dimensions (Structure, Process, Resource — Fig. 2, 3, 7 de l'article). Dans le Core SCONTO-SVU, le diagramme `sconto_svu_core_main_concepts.drawio` (section 5) distingue six bandes thématiques : *Architecture and Logistics Network*, *Operational Entities*, *Operational Events*, *VSM and Observation Context*, *SVU pivot Module*, *SCOR reference framework*. Ce sont des regroupements conceptuels internes au Core, pas des ontologies séparées.
4. **Classes et propriétés** : détaillées par fichier en section 1 (échantillons fournis par les sous-agents, à affiner lors de la rédaction).
5. **Couches fonctionnelles du « SVU Framework »** — **correction apportée après lecture du manuscrit** (`Manuscrit_these_ManawaAnakpa (7)-pages-2.pdf`, chapitre 3, p. 88-125) : le SVU Framework est bien documenté comme cadre fonctionnel distinct de l'ontologie. Les sections 3.3 et 3.4 du manuscrit le définissent explicitement comme le *SCOR-VSM Unification Framework*, organisé en quatre couches (Data Layer, VSM Layer, SVU Layer, SCOR Layer) plus un mécanisme de gouvernance (*Strategic and Tactical Governance*) ; la section 3.5 formalise ensuite ce cadre à travers l'ontologie SCONTO-SVU. Le texte est explicite sur cette distinction : « Le SVU Framework définit l'architecture conceptuelle du modèle [...] L'ontologie SCONTO-SVU formalise ensuite cette architecture dans un modèle sémantique structuré. » La correspondance entre ces couches et les classes réelles du Core est détaillée en section 3.4 ci-dessous. Point résiduel, non une erreur mais une nuance terminologique à noter : le Core nomme en interne sa couche pivot `SVMLLayer` (« SVML – SCOR-VSM **Mapping** Layer », `SCONTO_SVU_Core_v4.3.0.ttl` ligne 92), alors que le manuscrit et le diagramme à six bandes emploient « SVU » (SCOR-VSM **Unification**). Les deux désignent la même couche pivot (normalisation, mapping, agrégation), mais l'acronyme interne de l'ontologie (SVML) et celui du manuscrit/diagramme (SVU) ne sont pas identiques.

### 3.2 Graphe de dépendances par imports (`owl:imports`, vérifié fichier par fichier)

```
SCOPRO  (racine, 0 import)
  ← SCOME   (importe SCOPRO)
      ← SCOBE   (importe SCOME)

Core 4.x  → importe SCOPRO, SCOME, SCOBE directement (les trois, de façon redondante
            mais inoffensive puisque owl:imports est transitif)

Agent 1.1.x  → importe Core (pointeur de version aligné : 1.1.1→4.2.1, 1.1.2→4.3.0)
AER 1.1.x    → importe Core ET Agent (même génération que ci-dessus)

AHP 1.0.0            → importe Core 4.1.0, Agent 1.0.0, AER 1.0.0   [ligne obsolète]
Forecast/MTS 1.0.0   → importe Core 4.1.0, Agent 1.0.0, AER 1.0.0   [ligne obsolète]
                        (variante du 03/06 seulement : + AHP 1.0.0, lien retiré le 04/06)
ISA-95 1.0.0         → importe Core 4.1.0 UNIQUEMENT                [ligne obsolète]
```

**Point de vigilance explicitement demandé** : Forecast/MTS n'importe **pas** AHP dans sa version retenue (la plus récente, du 4 juin). Un import vers AHP a bien existé dans une version antérieure d'une journée (3 juin), avec sept propriétés de liaison (`forecastSupportsDecisionProblem`, etc.), puis a été retiré. Ce retrait n'est pas documenté ailleurs que par la comparaison directe des deux fichiers — c'est un fait de modélisation réel, pas une hypothèse, mais il n'a jamais été formalisé dans un changelog.

ISA-95 ne dépend que du Core et le dit explicitement dans son commentaire d'en-tête : *« L'extension NE redéfinit AUCUNE classe du noyau. Elle réutilise les classes core: [...] »*.

### 3.3 Intégration des ontologies tierces dans le Core

Confirmée par citation directe de `description_sconto_vsm_v4.md` : *« L'ontologie SCONTO-VSM v4.0 est une ontologie OWL 2 DL [...] via les modules de SCONTO : SCOPRO, SCOME et SCOBE »*. Le Core étend ces modules par héritage (`rdfs:subClassOf`), notamment `scopro:SC_Entity` (racine de toute entité du Core), `scome:Performance_Attribute`, `scome:Atomic_Metric`, `scome:Composite_Metric`. Ce schéma d'héritage a été vérifié cohérent avec le contenu réel des fichiers `.owl` (noms de classes correspondants confirmés par recherche directe), **à la différence** d'un fichier de mapping alternatif trouvé dans le dossier Desktop (`sconto_extension_and_mapping.txt`, `mapping_existing_to_scopro.csv`) qui emploie des noms de classes et un espace de noms (`industrialonto.github.io/SCOPRO`) absents des fichiers réellement utilisés — à écarter de la rédaction (voir inconsistance 7, section 4).

---

## 4. Inconsistances détectées entre les sources

1. **Renommage VSM → SVU partiel et non synchronisé dans l'espace de noms.** L'IRI du Core reste `http://www.sconto-vsm.org/core` jusqu'à la version 4.3.0 incluse, alors que le `rdfs:label`/titre de ce même fichier affiche déjà « SCONTO-SVU v4.3.0 ». Le renommage est donc une évolution de désignation (noms de fichiers, labels), pas un changement d'identité ontologique (l'IRI technique reste `sconto-vsm.org`).

2. **Renommage appliqué de façon asymétrique selon les fichiers.** Dans `evolution_project`, les fichiers Core ont été renommés `SCONTO_SVU_Core_v4.2.1.ttl` / `v4.3.0.ttl` dès le paquet C11 (11 août), mais les extensions Agent et AER ont conservé le préfixe `SCONTO_VSM_Agent_Extension_*` / `SCONTO_VSM_AER_Extension_*` même dans le paquet le plus récent (C14.3, 13 août). Le Core porte le nouveau nom, les extensions encore l'ancien.

3. **Commentaires OWL formels non resynchronisés avec les sauts de version** (distinct du changelog en commentaire `#`, qui lui est à jour) :
   - `SCONTO_SVU_Core_v4.3.0.ttl` : le `rdfs:comment` de l'axiome d'ontologie recopie le texte de la version 4.2 (« Version 4.2 : conserve intégralement... »).
   - `SCONTO_VSM_Agent_Extension_v1.1.2.ttl` : dit encore « réutilise le noyau Core v4.2 » alors que l'import réel cible 4.3.0.
   - `SCONTO_VSM_AER_Extension_v1.1.2.ttl` : cite encore « Core v4.2.1 et Agent Extension v1.1.1 » alors que ses propres `owl:imports` ciblent 4.3.0 et 1.1.2. C'est l'écart le plus net entre un texte descriptif interne et les déclarations `owl:imports` du même fichier.
   Si l'un de ces commentaires est cité dans le chapitre, préférer le `owl:versionIRI` et le changelog `#`, vérifiés exacts, plutôt que le `rdfs:comment`.

4. **`catalog-v001.xml` à la racine de `evolution_project` pointe vers des fichiers absents** (`SCONTO_SVU_Core_v4.2.0.ttl`, `SCONTO_VSM_Agent_Extension_v1.1.0.ttl` n'existent pas sous ce nom à cet endroit) — reliquat d'un environnement de travail antérieur, à ne pas utiliser tel quel pour recharger l'ontologie dans Protégé depuis ce dossier.

5. **AHP / Forecast-MTS / ISA-95 jamais portées sur la ligne réalignée** — détaillé en section 2 et 3.2, confirmé par imports directs, pas supposé.

6. **Forecast/MTS : deux contenus distincts sous le même numéro de version** (`1.0.0`), différenciables uniquement par la date de modification (3 juin 21h42 vs 4 juin 22h14) et par `diff` — l'un lié à AHP, l'autre non. Le numéro de version ne permet pas, à lui seul, de savoir à quelle variante un document ou un diagramme se réfère ; seule la comparaison de contenu le permet.

7. **Mapping SCOPRO alternatif incompatible avec les fichiers réels.** `Desktop\...\Ontology Making\sconto_extension_and_mapping.txt` et `mapping_existing_to_scopro.csv` proposent des classes (`scopro:EquipmentModule`, `scopro:Activity`, `scobe:Metric`...) et un espace de noms (`industrialonto.github.io/SCOPRO`) qui ne correspondent à rien dans les fichiers `.owl` réellement chargés (lesquels utilisent `Equipment`, `Process_Element`, `Business_Process`, `Task`, et placent `Metric` dans SCOME et non SCOBE). Piste de mapping à ne pas retenir dans la rédaction.

8. **Étiquette de page cosmétique.** La page « Core » du fichier `SCONTO_VSM_v4_1_corrige.drawio` est intitulée en interne « SCONTO-VSM v4.0 », alors que le fichier et son contenu correspondent à la version 4.1 corrigée. Simple oubli de renommage de page, sans conséquence sur le contenu, à corriger silencieusement si la figure est reprise.

---

## 5. Inventaire des diagrammes existants et verdict de réutilisation

| Diagramme | Source | Version représentée | Verdict |
|---|---|---|---|
| `01_CORE.drawio` | page 1 de `SCONTO_VSM_v4_1_corrige.drawio` | Core 4.1 (corrigé) | **À corriger** : diagramme UML détaillé, utilisable comme base, mais à vérifier contre les apports du Module N (4.2/4.3 : pipeline de performance, `hasMetricValue`, `hasPerformanceScore`, grades flous) qui datent d'après le 8 juin et ne sont probablement pas représentés |
| `02_AGENT.drawio` | page 2, même fichier | Agent 1.1.1-cohérent | **Conservable** : le diff 1.1.1→1.1.2 ne touche aucune classe, le diagramme reste représentatif |
| `03_AER.drawio` | page 3, même fichier | AER 1.1.1-cohérent | **Conservable**, même constat |
| `04_AHP.drawio` | `SCONTO_VSM_AHP_extension.drawio` | AHP 1.0.0 (seule version existante) | **Conservable** tel quel (identique octet pour octet à sa source, classes vérifiées correspondantes) — mais représente une extension non migrée (voir §2) |
| `05_FORECAST_MTS.drawio` | `SCONTO_VSM_Forecast_MTS_extension.drawio` | Forecast/MTS 1.0.0, variante **sans** lien AHP | **Conservable**, correspond à la version la plus récente ; signaler dans la légende qu'une variante antérieure liait l'extension à AHP |
| `06_ISA95.drawio` | `sconto_isa95_extension_v1.0.drawio` | ISA-95 1.0.0 (seule version) | **Conservable**, classes vérifiées correspondantes |
| `sconto_vsm_v4_class_diagram*.puml` (3 fichiers) | racine `Downloads` | Core **4.0** explicitement | **À refaire** : antérieur même à la version 4.1 retenue pour 01_CORE ; intérêt archivistique seulement (effort de correction V3→V4) |
| `ARCHIVES_SOURCE\*.drawio` (Agent/AER v1.0 et v1.1 intermédiaire) | déjà classées | pré-réalignement | **Archive uniquement**, déjà traité ainsi dans `MANIFESTE.md` |
| **`sconto_svu_core_main_concepts.drawio`** (FR, racine + `DocumentsToSend`) et sa **traduction anglaise** (`SendToMrsANAKPA`, avec rendus PNG/SVG/JPG déjà disponibles) | non catalogué jusqu'ici | Core, daté du 1er juillet (postérieur à la version 4.1 corrigée, classes vérifiées cohérentes à 90/114 occurrences avec Core 4.3.0) | **Nouvelle découverte, candidat fort pour la figure d'organisation générale** — voir §5.1 |

### 5.1 `sconto_svu_core_main_concepts.drawio` : la figure la plus proche de la Fig. 1 de l'article de référence

Ce diagramme, absent du dossier de supervision existant, organise les concepts du Core en six bandes thématiques horizontales (*Architecture and Logistics Network*, *Operational Entities*, *Operational Events*, *VSM and Observation Context*, *SVU pivot Module*, *SCOR reference framework*), toutes rattachées à la classe abstraite racine `SC Entity`. C'est une carte d'organisation conceptuelle, pas un diagramme UML complet (pas de multiplicités ni d'attributs détaillés) — exactement le registre de la Fig. 1 de l'article SCONTO (« SCONTO organization », trois boîtes SCOPRO/SCOME/SCOBE), à ceci près qu'ici les six bandes sont internes au seul Core, et non une organisation des modules de haut niveau.

Deux usages possibles pour le chapitre, à trancher en section 8 :
- en garder l'esprit pour une **figure d'organisation générale de SCONTO-SVU** (Core + cinq extensions, sur le modèle strict de la Fig. 1 de l'article), à construire spécifiquement, en everything plus simple que ce diagramme à six bandes ;
- et/ou réutiliser ce diagramme à six bandes tel quel (après vérification des apports du Module N) comme **figure de détail du Core**, en complément de la figure générale.

La version anglaise dispose déjà d'exports visuels (`SendToMrsANAKPA\img\...png/.svg/.jpg`), la version française n'a qu'un export SVG non confirmé lisible. Original modifiable dans les deux langues.

---

## 6. Plan proposé pour la nouvelle présentation (chapitre 3)

Calibré sur la progression effective de l'article de référence (survol du cadre global → module central détaillé par dimensions, avec définitions, diagrammes et tableaux → contraintes → cas d'application), adapté au fait que SCONTO-SVU est, lui, un noyau central (Core) plus cinq extensions plutôt que trois sous-ontologies pairs.

1. **Vue d'ensemble** — positionnement de SCONTO-SVU par rapport à SCONTO (SCOPRO/SCOME/SCOBE, héritage par sous-classement) et par rapport à SCOR/VSM ; figure d'organisation générale (Core + 5 extensions, dépendances orientées, convention graphique simple — section 7, figure F1).
2. **Architecture du Core** — les six bandes conceptuelles (architecture/réseau, entités opérationnelles, événements, VSM/contexte d'observation, module pivot SVU, cadre SCOR), présentées progressivement comme SCOPRO présente ses trois dimensions dans l'article.
3. **Présentation détaillée des modules du Core** — une sous-section par bande, avec définitions textuelles courtes, un tableau de relations/contraintes par classe pivot (sur le modèle des Tables 1 à 9 de l'article), et le diagramme de classes correspondant.
4. **Positionnement et dépendances des extensions** — Agent, AER (dépendance confirmée au Core réaligné) puis AHP, Forecast/MTS, ISA-95 (dépendance confirmée à une génération antérieure, à dire explicitement comme limite plutôt que la cacher ou la corriger silencieusement).
5. **Diagrammes de classes et associations** — un diagramme par module/extension (section 5), chacun avec légende et renvoi au tableau de contraintes correspondant.
6. **Contraintes et relations formelles** — table récapitulative des contraintes majeures (disjonctions, cardinalités, restrictions `owl:imports`), sur le modèle des encadrés « Constraints » de l'article.
7. **Exemple d'instanciation / traçabilité** — à partir d'un export ABox réel disponible (ex. `SCONTO_SVU_ABOX_DataCo_Global_RUN_...` ou l'ABox ZENER SA Togo citée dans les paquets d'évolution), sur le modèle de l'étude de cas de l'article (Fig. 8-10).

---

## 7. Figures à produire

| Figure | Objet | Sources nécessaires |
|---|---|---|
| **F1 — Organisation générale SCONTO-SVU** | Core + 5 extensions, dépendances orientées (style Fig. 1 de l'article) | À construire ; s'inspirer de `sconto_svu_core_main_concepts.drawio` pour le registre graphique, mais à un niveau Core+extensions, pas intra-Core |
| **F2 — Carte des six bandes du Core** | Détail conceptuel du Core | `sconto_svu_core_main_concepts.drawio` (FR ou EN), à vérifier/compléter contre Core 4.3.0 (Module N) |
| **F3 — Diagramme de classes Core** | Détail UML du Core | `01_CORE.drawio`, à corriger contre 4.3.0 |
| **F4 — Diagramme de classes Agent** | — | `02_AGENT.drawio`, conservable |
| **F5 — Diagramme de classes AER** | — | `03_AER.drawio`, conservable |
| **F6 — Diagramme de classes AHP** | — | `04_AHP.drawio`, conservable (avec mention de non-migration) |
| **F7 — Diagramme de classes Forecast/MTS** | — | `05_FORECAST_MTS.drawio`, conservable (avec mention de non-migration et de l'ancien lien AHP) |
| **F8 — Diagramme de classes ISA-95** | — | `06_ISA95.drawio`, conservable |
| **F9 — Exemple de traçabilité (instanciation)** | Cas réel, sur le modèle des Fig. 8-10 de l'article | Un export ABox réel à sélectionner (ex. run DataCo ou ZENER SA Togo) |

---

## 8. Éléments encore incertains, à valider avant la rédaction finale

1. ~~« SVU Framework » comme couche fonctionnelle distincte~~ — **résolu par lecture directe du manuscrit** (§3.1 point 5 ci-dessus, corrigé). Le SVU Framework (quatre couches + gouvernance, §3.2-3.4 du manuscrit) est bien distinct de sa formalisation ontologique SCONTO-SVU (§3.5). Aucune validation humaine supplémentaire nécessaire sur ce point ; seule la nuance d'acronyme SVML (ontologie) / SVU (manuscrit, diagramme) reste à harmoniser ou à expliquer dans le texte.
2. **Usage de `sconto_svu_core_main_concepts.drawio`** : à valider s'il doit servir de base à la figure générale (F1), à la figure de détail du Core (F2), ou aux deux avec un niveau de détail différent — et confirmer s'il doit être vérifié/complété pour les apports 4.2/4.3 (Module N, pipeline de performance) avant tout usage dans le chapitre.
3. **Contenu du Module N (4.2/4.3)** : identifié par son changelog (`hasMetricValue`, `hasPerformanceScore`, `FuzzyPerformanceGradeSet`, instanciation du cas « Company A ») mais pas encore confronté classe par classe au diagramme `01_CORE.drawio` ni au diagramme à six bandes — à faire avant de déclarer F2/F3 à jour.
4. **Paquet C12** (`evolution_project\SCONTO_SVU_S2_2_C12_FINAL_TRACEABILITY_TEST_PACKAGE.zip`) : jamais extrait dans cet environnement ; son contenu (Core 4.2.1/Agent 1.1.1/AER 1.1.1, sans SCOPRO/SCOME/SCOBE) a été lu via l'archive mais pourrait mériter une extraction si le chapitre doit documenter la continuité C11→C12→C13→C14.
5. **Fichier `SCONTO_SVU_C09_BUNDLE_Core4.2_Agent1.1_ABox.ttl`** : mélange axiomes TBox et données d'instance sous un nom qui suggère une pure ABox ; à vérifier si son contenu TBox est bien redondant avec l'Agent 1.1.0 confirmé, ou s'il contient un apport non repris ailleurs.
6. **Deux fichiers `Description_SCONTO_VSM_AHP_Extension.md` et `_1.md`, de taille identique** : contenu non diffé dans cet audit, à comparer avant citation si l'un des deux doit être utilisé comme source textuelle.
7. ~~Fichiers `SCONTO_SVU_Agent_Extension_v1-02.docx` / `SCONTO_SVU_AER_Extension_v1-02.docx`~~ — **résolu** : leur texte (extrait après coup) montre qu'il s'agit de la description de l'**Agent Extension v1.0** et de l'**AER Extension v1.0** (« SCONTO-VSM Agent Extension v1.0 », « SCONTO-VSM AER Communication Extension v1.0 », toutes deux adossées au « Core Ontology v4.1 »). Le suffixe « v1-02 » du nom de fichier est donc une révision de document (2e révision du livrable), pas un numéro de version ontologique distinct ; ces deux fichiers décrivent la ligne **pré-réalignement** (1.0, Core 4.1), pas la ligne 1.1.1/1.1.2. Point informatif supplémentaire : ils portent la mention « SAP INNOVATIONS SARL, École Polytechnique de Lomé · UTBM, Promotion 2025-2026 ».
8. **ABox à retenir pour F9** : plusieurs runs existent (DataCo, ZENER SA Togo) ; le choix dépend du cas que le chapitre veut illustrer, à trancher avec vous plutôt que supposé ici.
9. **Paquet le plus autoritaire entre C14 et C14.3** : C14 est le plus complet en tant que bundle ontologique autonome (SCOPRO/SCOME/SCOBE + catalogue inclus) ; C14.3 est chronologiquement postérieur mais n'apporte aucune évolution de schéma (fichiers `.ttl` identiques à C14, confirmé par diff) — recommandation de cet audit : **citer C14 comme référence du schéma**, en notant que C14.3 est l'état projet le plus récent sans évolution ontologique. À valider.

---

*Fin du rapport d'audit. Dans l'attente de votre validation avant toute modification du manuscrit ou génération définitive de figures.*
