# Matrice des relations vérifiées (F1, F2, F2b, F3a, F3b)

Vérification faite avec `rdflib` 7.5.0 (parseur Turtle/RDF-XML structuré), pas par recherche textuelle. Pour chaque propriété dessinée : IRI complète (abrégée ici par son nom local, l'espace de noms du Core étant `http://www.sconto-vsm.org/core#` sauf indication contraire), domaine et portée exacts (y compris `owl:unionOf` résolu en liste de classes), `owl:inverseOf` le cas échéant. Les domaines/portées `owl:unionOf` sont des disjonctions de classes candidates, pas des contraintes de validation fermées : une instance de la propriété doit avoir un sujet/objet appartenant à au moins une des classes listées ; cela n'exclut pas qu'une instance appartienne aussi à d'autres classes non listées (sémantique de monde ouvert standard en OWL).

## Core — propriétés d'objet et de données

| Propriété | Type | Domaine (exact) | Portée (exacte) | Inverse |
|---|---|---|---|---|
| belongsToActor | ObjectProperty | scopro:SC_Entity | SupplyChainActor | — |
| ownsEquipment | ObjectProperty | SupplyChainActor | EquipmentElement | — |
| operatedByActor | ObjectProperty | EquipmentElement | SupplyChainActor | **ownsEquipment** |
| relatedToEquipment | ObjectProperty | RawEvent | EquipmentElement | — |
| generatedBy | ObjectProperty | RawEvent | **ObservableEntity** | — |
| generatesEvent | ObjectProperty | ObservableEntity | RawEvent | **generatedBy** |
| producesIndicator | ObjectProperty | RawEvent | VSMIndicator | — |
| computedFromEvent | ObjectProperty | VSMIndicator | RawEvent | — |
| hasObservationContext | ObjectProperty | VSMIndicator | ObservationContext | — |
| measuredBy | ObjectProperty | MicroActivity | VSMIndicator | — |
| aggregatesIndicator | ObjectProperty | AggregationRule | VSMIndicator | — |
| mapsToSCORN3 | ObjectProperty | MicroActivity | union(scopro:Process_Element, scopro:Task, SCORLevel3Process) | — |
| feedsSCORMetric | ObjectProperty | MicroActivity | union(SCORMetric, SCORCompositeMetric, SCORMetricN3, SCORMetricN2, SCORMetricN1) | — |
| producesMetric | ObjectProperty | AggregationRule | union(SCORMetric, SCORCompositeMetric, SCORMetricN3, SCORMetricN2, SCORMetricN1) | — |
| scoredByRule | ObjectProperty | union(SCORMetric, SCORCompositeMetric, SCORMetricN1, SCORMetricN2, SCORMetricN3) | NormalizationRule | — |
| isAggregatedInto | ObjectProperty | SCORMetric | SCORCompositeMetric | — |
| aggregatesTo | ObjectProperty | union(SCORMetricN3, SCORMetricN2) | union(SCORMetricN2, SCORMetricN1, SCORCompositeMetric) | — |
| belongsToPerformanceAttribute | ObjectProperty | union(SCORMetric, SCORCompositeMetric, SCORMetricN1, SCORMetricN2, SCORMetricN3) | SCORPerformanceAttribute | — |
| contributesToPerformanceAttribute | ObjectProperty | union(SCORMetric, SCORCompositeMetric, SCORMetricN1, SCORMetricN2, SCORMetricN3) | SCORPerformanceAttribute | — |
| contributesToEvaluation | ObjectProperty | SCORPerformanceAttribute | SCORPerformanceEvaluation | — |
| producesEvaluation | ObjectProperty | SCORMetricN1 | SCORPerformanceEvaluation | — |
| hasFuzzyGradeSet | ObjectProperty | union(SCORMetric, SCORCompositeMetric, SCORMetricN1, SCORMetricN2, SCORMetricN3, SCORPerformanceAttribute, SCORPerformanceEvaluation) | FuzzyPerformanceGradeSet | — |
| hasMetricValue | DatatypeProperty | union(SCORMetric, SCORCompositeMetric, SCORMetricN1, SCORMetricN2, SCORMetricN3) | xsd:decimal | — |
| hasPerformanceScore | DatatypeProperty | union(SCORMetric, SCORCompositeMetric, SCORMetricN1, SCORMetricN2, SCORMetricN3, SCORPerformanceAttribute, SCORPerformanceEvaluation) | xsd:decimal | — |
| hasMetricWeight | DatatypeProperty | union(SCORMetric, SCORCompositeMetric, SCORMetricN1, SCORMetricN2, SCORMetricN3) | xsd:decimal | — |
| hasAttributeWeight | DatatypeProperty | SCORPerformanceAttribute | xsd:decimal | — |
| isBenefitMetric | DatatypeProperty | union(SCORMetric, SCORCompositeMetric, SCORMetricN1, SCORMetricN2, SCORMetricN3) | xsd:boolean | — |

**Correction apportée à la suite de cette vérification structurée** : la Figure 2 (première version) dessinait `generatedBy` de `RawEvent` vers une classe nommée `EventSource`. La vérification révèle deux erreurs cumulées : (1) la portée réelle de `generatedBy` est `ObservableEntity`, pas `EventSource` ; (2) `EventSource` n'est de toute façon pas une classe reliée à `RawEvent` par une propriété — c'est une **spécialisation** (`rdfs:subClassOf`) d'`ObservableEntity`, au même titre que `PhysicalEntity`, `InformationSystem`, `HumanResource` et `MaterialEntity`. La figure corrigée montre désormais `ObservableEntity` comme la classe réellement reliée à `RawEvent` (par `generatedBy`/`generatesEvent`), avec ses cinq spécialisations réelles listées en note plutôt que l'une d'elles présentée à tort comme la cible de la relation.

**Deux propriétés distinctes à ne pas confondre** (même domaine, même portée, noms proches) : `belongsToPerformanceAttribute` et `contributesToPerformanceAttribute` sont deux propriétés différentes du fichier, non des doublons. Le `rdfs:comment` du Module I précise que `contributesToPerformanceAttribute` est une relation de contribution de score (« ne signifie pas une agrégation de valeur physique »), tandis que `belongsToPerformanceAttribute` exprime un rattachement structurel direct de la métrique à son attribut. F2 dessine la seconde (rattachement structurel, pertinent à un niveau conceptuel général), F3b dessine la première (pertinente pour le pipeline de score). Aucune des deux figures ne les présente comme équivalentes.

## Hiérarchie de spécialisation vérifiée (extrait pertinent pour F2/F2b/F3a/F3b)

| Classe | `rdfs:subClassOf` exact |
|---|---|
| PhysicalEntity, InformationSystem, HumanResource, MaterialEntity, EventSource | ObservableEntity |
| EquipmentElement, StorageEntity | PhysicalEntity |
| Product | MaterialEntity |
| WorkOrder | scopro:SC_Entity *(hors de la branche ObservableEntity)* |
| OperationalDataLayer, VSMLayer, SVMLLayer, SCORReferenceLayer | ArchitectureLayer |
| SCORLevel1Process, SCORLevel2Process | SCORProcess **et** scopro:Business_Process |
| SCORLevel3Process | SCORProcess **et** union(scopro:Process_Element, scopro:Task) |
| SCORMetricN3 | SCORMetric |
| SCORMetricN1, SCORMetricN2 | **SCORCompositeMetric** (pas SCORMetric directement) |
| SCORCompositeMetric | scome:Composite_Metric *(tierce)* |
| SCORPerformanceAttribute | scome:SC_Performance_Concept *(tierce)* |
| Reliability, Responsiveness, Agility, Cost, AssetManagement | SCORPerformanceAttribute **et** une classe scome: spécifique (SC_Reliability, SC_Responsiveness, SC_Agility, SC_Cost, SC_Assets) |
| SCORPerformanceEvaluation | scobe:Benchmarking_project *(IRI non résolue — voir `NOTE_TECHNIQUE_ANOMALIE_SCOBE.md`)* |

---

## Écart de décompte des restrictions Agent — explication

`ETAPE3_CONSOLIDATION_MODULES_DIAGRAMMES.md` indiquait 54 blocs `owl:Restriction` dans Agent 1.1.2. Une relecture structurée (nœuds distincts typés `owl:Restriction` dans le graphe RDF, via `rdflib`) en trouve **27** :

```
Nombre de noeuds distincts types owl:Restriction : 27
Repartition :
  someValuesFrom : 23
  allValuesFrom  : 4
  TOTAL          : 27
```

**Origine de l'écart** : le chiffre de 54 provenait d'un comptage par `grep -c` avec un motif combiné (`owl:Restriction\|someValuesFrom\|allValuesFrom\|...`), qui compte des **lignes correspondantes**, pas des blocs de restriction. Dans ce fichier, chaque restriction est formatée sur deux lignes distinctes :

```turtle
:MachineAgent rdfs:subClassOf [
    a owl:Restriction ;              ← ligne 1, correspond au motif
    owl:onProperty :representsMachine ;
    owl:someValuesFrom core:Machine   ← ligne 2, correspond aussi au motif
] .
```

27 restrictions × 2 lignes correspondantes chacune = 54 lignes comptées, confirmé en reproduisant exactement la commande d'origine (`grep -c` combiné → 54). **Le chiffre exact et correct, vérifié par analyse structurée du graphe, est 27 restrictions distinctes (23 existentielles, 4 universelles), et non 54.** `ETAPE3...md` contenait donc une erreur de méthode (comptage de lignes au lieu de blocs), corrigée ici. Aucune restriction de cardinalité numérique n'a été trouvée (confirmé également par `rdflib`, cohérent avec le grep initial).

Propriétés les plus contraintes (par nombre de restrictions existentielles/universelles portant sur elles) : `hasAgentRole` (10), `supervisesAgent` (4), `reportsToAgent` (4), les autres (`performedByAgent`, `representsActor`, `executesMicroActivity`, `storesObservation`, `traceOfMicroActivity`, `representsMachine`, `storesDecision`, `storesPerformanceRecord`) une seule chacune.
