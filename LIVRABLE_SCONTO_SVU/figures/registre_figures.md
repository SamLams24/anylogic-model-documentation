# Registre des figures — premier lot (F1, F2, F3)

Dossier : `LIVRABLE_SCONTO_SVU/figures/{sources,svg,png}/`. Les fichiers `sources/` et `svg/` sont identiques (SVG hand-codé, directement éditable dans un éditeur de texte ou un outil vectoriel acceptant le SVG — « équivalent » Draw.io au sens de la consigne, aucun outil Draw.io disponible dans cet environnement). Les `png/` sont des rendus à échelle 2x (chrome headless, fond blanc, sans transparence), adaptés à l'impression.

Ce premier lot est une version éditable, soumise à revue scientifique et visuelle avant la suite (modules restants, extensions, figure d'instanciation).

---

## F1 — Organisation générale de SCONTO-SVU

- **Fichier** : `F1_organisation_generale.{svg,png}`
- **Objectif** : situer le Core et les quatre extensions retenues (Agent, AER, Forecast/MTS, ISA-95), en distinguant les dépendances revalidées de celles qui ne le sont pas. AHP volontairement absent.
- **Emplacement proposé** : chapitre 3, section d'ouverture de la présentation ontologique.
- **Éléments représentés** : SCOPRO/SCOME/SCOBE (ontologies tierces, groupées) ; Core SCONTO-SVU v4.3.0 ; Agent Extension v1.1.2 ; AER Extension v1.1.2 ; Forecast/MTS v1.0.0 ; ISA-95 v1.0.0 ; six relations `owl:imports`, toutes vérifiées directement dans l'en-tête de chaque fichier source (aucune supposée).
- **Omissions volontaires** : détail interne des classes (hors périmètre de cette figure, demandé explicitement) ; versions intermédiaires du Core (4.0/4.1/4.2/4.2.1), regroupées sous l'étiquette unique « génération antérieure » puisque seules deux générations comptent pour la lecture (courante vs antérieure) ; AHP (exclusion scientifique, non un oubli).
- **Limites de représentation** : aucun test de cohérence conjoint (chargement par raisonneur) entre Forecast/MTS ou ISA-95 et le Core 4.3.0 n'a été réalisé — la figure ne représente donc qu'une absence d'alignement de version constatée, pas une incompatibilité logique démontrée (légende explicite sur la figure).
- **Sources ontologiques** : `SCONTO_SVU_Core_v4.3.0.ttl`, `SCONTO_VSM_Agent_Extension_v1.1.2.ttl`, `SCONTO_VSM_AER_Extension_v1.1.2.ttl`, `sconto-vsm-forecast-mts-extension_1.ttl`, `sconto-vsm-isa95-extension-v1.0.ttl`, `SCOPRO.owl`, `SCOME.owl`, `SCOBE.owl` (chemins et SHA-256 : voir `ETAPE4_FIGURES_F1_F2_F3.md`, section 2).

## F2 — Concepts fondamentaux du Core

- **Fichier** : `F2_concepts_core.{svg,png}`
- **Objectif** : présenter les classes structurantes du Core organisées en six regroupements conceptuels, dans l'esprit des figures principales de SCOPRO (Fig. 2-7 de l'article de référence).
- **Emplacement proposé** : chapitre 3, section d'architecture conceptuelle du Core.
- **Classes représentées (22)** : SC Entity (abstraite, importée) ; SupplyChainActor, SupplyChainNetwork ; EquipmentElement, StorageEntity, InformationSystem, Product, WorkOrder ; RawEvent, EventSource ; VSMIndicator, ObservationContext, CycleTime, OverallEquipmentEffectiveness (ces deux dernières à titre d'exemple de spécialisation) ; MicroActivity, CorrespondenceRule, NormalizationRule, AggregationRule ; SCORProcess, SCORMetric, SCORPerformanceAttribute, SCORCompositeMetric.
- **Relations représentées (12)** : belongsToActor, ownsEquipment, relatedToEquipment, generatedBy, producesIndicator, hasObservationContext, measuredBy, mapsToSCORN3, feedsSCORMetric, producesMetric, belongsToPerformanceAttribute, et deux spécialisations exemple de VSMIndicator.
- **Omissions volontaires (listées sur la figure même)** : executedAt, performedForActor, relatedToStorage, relatedToWorkOrder, contributesToPerformanceAttribute, governedBy, usesFunction, usesNormalizationMethod, aggregatesIndicator — relations réelles, non dessinées pour la lisibilité. Environ 25 classes additionnelles du Core non représentées (Machine, WorkCell, Warehouse, Buffer, Supermarket, ERP, MES, WMS, APS, CustomerOrder, ProductionOrder, 28 autres spécialisations de VSMIndicator, etc.).
- **Correction apportée pendant la production** : une première version montrait `SCORMetricN1`, `SCORMetricN2` et `SCORMetricN3` comme sous-classes directes de `SCORMetric`. Vérification faite dans le fichier : seule `SCORMetricN3` l'est ; `SCORMetricN1` et `SCORMetricN2` sont sous-classes de `SCORCompositeMetric`. La figure a été corrigée pour ne pas afficher une spécialisation inexacte ; le détail correct est renvoyé à la Figure 3.
- **Limite de représentation signalée sur la figure** : le Core déclare quatre classes `ArchitectureLayer` (Module A) correspondant aux couches du SVU Framework, mais la propriété `belongsToLayer` qui les relierait au reste du TBox n'est jamais assertée (0 occurrence) — la correspondance bandes/couches reste une lecture conceptuelle documentée, pas une assertion OWL.
- **Sources ontologiques** : `SCONTO_SVU_Core_v4.3.0.ttl`, modules A à J (lignes 74 à 1265).

## F3 — Modules I et J : référentiel SCOR, pipeline de performance et couche pivot

- **Fichier** : `F3_modules_I_J_pipeline_performance.{svg,png}`
- **Objectif** : détailler l'articulation entre processus SCOR, métriques, attributs de performance et couche pivot, en couvrant spécifiquement les apports V4.2/V4.3 (valeurs, scores, pondérations, grades flous) absents de F2.
- **Emplacement proposé** : chapitre 3, sous-section dédiée au référentiel SCOR et au pipeline de performance (après la présentation générale du Module J en lien avec F2).
- **Classes représentées (19)** : SCORProcess, SCORLevel1Process, SCORLevel2Process, SCORLevel3Process ; SCORMetric, SCORMetricN3, SCORCompositeMetric, SCORMetricN2, SCORMetricN1 ; SCORPerformanceAttribute, Reliability, Responsiveness, Agility, Cost, AssetManagement, SCORPerformanceEvaluation ; FuzzyPerformanceGradeSet ; `scobe:Benchmarking_project` (classe tierce, représentée pour montrer le point de vigilance) ; rappel du Module J (MicroActivity, NormalizationRule, AggregationRule).
- **Relations représentées (14)** : mapsToSCORN3, feedsSCORMetric, scoredByRule, producesMetric (pont Module J ↔ Module I) ; isAggregatedInto, aggregatesTo ×2 (chaîne de valeur N3→N2→N1) ; contributesToPerformanceAttribute, contributesToEvaluation, producesEvaluation (chaîne de score/attribut — voie alternative) ; belongsToPerformanceAttribute (implicite via contributesToPerformanceAttribute, non dupliqué) ; hasFuzzyGradeSet ×2 (représentatifs, domaine en union à 7 classes) ; rdfs:subClassOf ×9 (spécialisations) + 1 (SCORPerformanceEvaluation → scobe:Benchmarking_project).
- **Attributs listés en compartiment, non dessinés individuellement** : hasMetricValue, hasPerformanceScore, hasMetricWeight, isBenefitMetric (domaine en union sur les 5 classes de métrique) ; hasAttributeWeight (SCORPerformanceAttribute) ; hasGradeA à hasGradeF (FuzzyPerformanceGradeSet).
- **Omissions volontaires** : hasMetricCode, hasMetricUnit, hasFormulaRef, hasSCORLevel, hasProcessCode, hasAggregationMethod (propriétés descriptives, non liées au pipeline récent) ; détail complet du Module J (renvoyé à F2).
- **Point de vigilance mis en évidence sur la figure (non corrigé, conformément à la consigne de ne pas modifier l'ontologie)** : l'axiome `:SCORPerformanceEvaluation rdfs:subClassOf scobe:Benchmarking_project` (ligne 910 du fichier) référence une IRI (`scobe:Benchmarking_project`, p minuscule) qui ne correspond à aucune classe déclarée dans `SCOBE.owl` — celui-ci ne déclare que `Benchmarking_Project` (P majuscule). Les deux IRI sont distinctes en RDF. L'alignement sémantique visé par cet axiome n'est donc pas techniquement établi tel qu'écrit. Ce n'est pas une inconsistance logique (un résolveur RDF tolère une référence à une ressource non typée comme superclasse), ce qui explique pourquoi les validations par raisonneur déjà publiées (`C14_RAPPORT_ALIGNEMENT_FINAL.md`, 0 classe insatisfaisable) n'ont pas signalé le problème : une classe non résolue par erreur de casse ne rend rien insatisfaisable, elle rend simplement l'alignement inopérant.
- **Sources ontologiques** : `SCONTO_SVU_Core_v4.3.0.ttl`, Module I (lignes 770-1076) et Module J (lignes 1077-1265) ; `SCOBE.owl` (vérification de la classe `Benchmarking_Project`).

---

## Vérifications effectuées (séparées par type, conformément à la consigne)

### Vérification syntaxique
Chaque fichier SVG a été ouvert et rendu par un moteur de rendu web standard (Chromium/Edge en mode headless) sans erreur de analyse (parsing) XML. Les trois fichiers sont des documents SVG 1.1 valides (un seul élément racine `<svg>`, espaces de noms corrects, pas de balise non fermée).

### Contrôle de correspondance graphique (figure ↔ fichiers ontologiques)
Chaque classe et chaque relation dessinée a été vérifiée par recherche directe (`grep` du nom exact) dans le fichier `.ttl`/`.owl` source avant d'être intégrée à la figure ; aucune relation n'a été dessinée par analogie ou par supposition. Le tableau ci-dessus (listes « classes représentées » / « relations représentées ») constitue cette traçabilité pour chaque figure. Une erreur détectée pendant cette vérification (hiérarchie N1/N2/N3 en F2) a été corrigée avant livraison plutôt que découverte a posteriori.

### Validation logique par raisonneur
**Aucune n'a été exécutée dans cette passe.** Les figures sont des diagrammes de présentation, pas des fichiers OWL ; leur production ne nécessite pas de passage par un raisonneur. La validation par raisonneur déjà disponible est celle, antérieure, des fichiers ontologiques eux-mêmes (`C14_RAPPORT_ALIGNEMENT_FINAL.md`, HermiT, 0 classe insatisfaisable) — elle est citée en F1 mais n'a pas été relancée ici. Le point de vigilance relevé en F3 (casse `Benchmarking_project`/`Benchmarking_Project`) est un défaut d'alignement sémantique, pas une inconsistance logique détectable par un raisonneur standard tel qu'actuellement configuré dans ce projet ; une vérification par raisonneur dédiée à cette question précise n'a pas été tentée (hors périmètre technique de cette étape, qui exclut toute modification ou nouvelle exécution sur les artefacts ontologiques).

### Vérification visuelle
Chaque figure a été rendue en PNG (échelle 2x) et inspectée visuellement avant livraison : lisibilité du texte, absence de chevauchement de libellés, orientation correcte des flèches, cohérence des regroupements. Deux corrections ont été faites à ce titre : chevauchement de deux libellés en F2 (`mapsToSCORN3`/`feedsSCORMetric`) et réorganisation complète du routage des flèches de pont en F3 (les quatre relations Module J ↔ Module I traversaient initialement les boîtes du référentiel SCOR ; elles sont désormais routées dans un couloir dédié au-dessus des colonnes).
