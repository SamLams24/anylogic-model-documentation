# Étape 3 — Consolidation documentaire, cartographie des quatorze modules du Core et validation fine des diagrammes

Ce document complète `AUDIT_ONTOLOGIE_SCONTO_SVU_CH3.md` et `ETAPE2_VALIDATION_ARCHITECTURE_SCONTO_SVU_CH3.md`. Toutes les données ci-dessous proviennent d'une lecture directe et d'une recherche systématique (`grep`, extraction par script) dans `SCONTO_SVU_Core_v4.3.0.ttl` (paquet C14), `SCONTO_VSM_Agent_Extension_v1.1.2.ttl`, `SCONTO_VSM_AER_Extension_v1.1.2.ttl`, les fichiers Forecast/MTS et ISA-95 retenus, et les six diagrammes `.drawio` concernés. Aucun artefact ontologique n'a été modifié.

---

## 1. Synchronisation Git

- **Racine du dépôt** : `C:/Users/LENOVO/Downloads/work on documentation`
- **Remote** : `origin` → `https://github.com/SamLams24/anylogic-model-documentation.git`
- **Branche de départ** : `documentation-latex-rewrite` (contenait de nombreuses modifications et fichiers non suivis étrangers à cette mission — non touchés)
- **Branche créée pour cette mission** : `docs/sconto-svu-ontology-audit`, à partir de `documentation-latex-rewrite`
- **Fichiers publiés** : uniquement les trois rapports Markdown de la mission (`AUDIT_ONTOLOGIE_SCONTO_SVU_CH3.md`, `ETAPE2_VALIDATION_ARCHITECTURE_SCONTO_SVU_CH3.md`, et le présent fichier à la prochaine synchronisation). Aucun fichier modifié ou non suivi appartenant à d'autres travaux n'a été ajouté.
- **Commit publié (étapes 1-2)** : `f700973c9fb14bbcb465362041b7221de911fb92`
- **Lien pull request proposé par GitHub** : https://github.com/SamLams24/anylogic-model-documentation/pull/new/docs/sconto-svu-ontology-audit
- **Liens directs vers les rapports** (sur la branche) :
  - https://github.com/SamLams24/anylogic-model-documentation/blob/docs/sconto-svu-ontology-audit/AUDIT_ONTOLOGIE_SCONTO_SVU_CH3.md
  - https://github.com/SamLams24/anylogic-model-documentation/blob/docs/sconto-svu-ontology-audit/ETAPE2_VALIDATION_ARCHITECTURE_SCONTO_SVU_CH3.md

Le présent document sera ajouté au même commit lors de la prochaine synchronisation (section 9).

Aucun remote n'a dû être créé (il existait déjà) ; aucune réécriture d'historique, aucun `push --force`, aucun artefact ontologique inclus.

---

## 2. Arbitrages scientifiques confirmés

- **Chapitre 3** : SVU Framework, formalisation ontologique SCONTO-SVU, architecture conceptuelle du Core, modules/classes/propriétés/relations, mécanismes d'unification SCOR-VSM.
- **Chapitre 4** : architecture multi-agents, Agent Extension, AER Extension, alignement ISA-95, diagrammes conceptuels correspondants.
- **Chapitres expérimentaux** : prévision, replanification, politiques Make-to-Stock, Forecast/MTS lorsque pertinent.
- **Conséquence actée** : Forecast/MTS sort du périmètre du chapitre 3 (le point resté ouvert dans `ETAPE2...md` §6 est maintenant tranché et corrigé sur place).
- **AHP** : confirmé totalement exclu de tout livrable destiné au manuscrit (figures, texte, légendes, tableaux). Rien de nouveau à signaler, aucun fichier historique supprimé.

---

## 3. Matrice exhaustive des quatorze modules du Core 4.3.0

Avertissement de méthode, conforme à votre remarque : les **six bandes** du diagramme `sconto_svu_core_main_concepts.drawio` sont un regroupement éditorial du diagramme, absent de l'OWL lui-même. Les **quatorze modules A-N** sont, eux, la structuration réelle du fichier `.ttl` (délimitée par des commentaires `# MODULE X`). Les deux ne se recouvrent pas terme à terme : plusieurs modules techniques peuvent relever d'une même bande, et un module peut contenir à la fois des classes TBox et des exemples d'instances.

**Fait nouveau important** : le Module A déclare une **typologie formelle de quatre couches architecturales**, sous forme de classes `rdfs:subClassOf :ArchitectureLayer` : `OperationalDataLayer` (« Shop-floor / Operational Data Layer »), `VSMLayer` (« VSM Observation Layer »), `SVMLLayer` (« SVML – SCOR-VSM Mapping Layer »), `SCORReferenceLayer` (« SCOR Reference Layer »). Ces quatre classes correspondent, une à une, aux quatre couches du SVU Framework décrites au manuscrit (§3.4) — c'est une correspondance plus directe et plus fiable que le rattachement aux six bandes, détaillée en section 4.

| Module | Nom exact (commentaire du fichier) | Fonction conceptuelle | Classes principales | Propriétés importantes | Relations intermodules vérifiées | Bande(s) la/les plus proche(s) | Niveau de représentation dans les diagrammes |
|---|---|---|---|---|---|---|---|
| **A** | Couches architecturales | Typologie formelle des quatre couches fonctionnelles du cadre (Data/VSM/SVML/SCOR) | `ArchitectureLayer`, `OperationalDataLayer`, `VSMLayer`, `SVMLLayer`, `SCORReferenceLayer` | `belongsToLayer` (domaine `scopro:SC_Entity`, portée `ArchitectureLayer`) — **déclarée mais jamais utilisée dans le fichier** (0 assertion trouvée) | Aucune relation structurelle vers les autres modules au-delà de la propriété `belongsToLayer`, elle-même non exploitée | *Architecture and Logistics Network* (approximatif ; le diagramme ne reprend pas les 4 classes elles-mêmes) | `01_CORE.drawio` : la classe générique `ArchitectureLayer` est présente, les 4 sous-classes **absentes** ; diagramme à six bandes : même constat |
| **B** | Chaîne logistique et acteurs | Réseau logistique et typologie des acteurs | `SupplyChainActor`, `SupplyChainNetwork`, `FocalCompany`, `Supplier`, `CustomerActor`, `LogisticsProvider`, `SubsidiaryActor` | `hasActor`/`participatesInNetwork` (inverses), `upstreamOf`/`downstreamOf` (inverses), `belongsToActor` | `belongsToActor` : domaine `scopro:SC_Entity` (toute entité du Core peut être rattachée à un acteur) — relie B à l'ensemble du Core | *Architecture and Logistics Network* | `01_CORE.drawio` : classe pivot `SupplyChainActor`/`SupplyChainNetwork` présents, sous-classes `FocalCompany`/`Supplier` absentes du sondage ; six bandes : classes pivot présentes, sous-classes absentes |
| **C** | Structure opérationnelle générique | Hiérarchie physique générique (site → atelier → poste → équipement) | `PhysicalEntity`, `EquipmentElement`, `Machine`, `WorkCell`, `Workstation`, `HumanResource`, `InformationSystem`, `ObservableEntity` | `ownsEquipment` (B→C), `operatedByActor` (C→B), `isSubEquipmentOf` | Vers B (`ownsEquipment`/`operatedByActor`) ; `ObservableEntity` sert de superclasse générique réutilisée par G (`generatedBy`/`generatesEvent`) et H (`observedEntity`) | *Operational Entities* | `01_CORE.drawio` : `EquipmentElement`/`HumanResource`/`InformationSystem` présents, `Machine`/`WorkCell` absents du sondage ; six bandes : mêmes classes pivot présentes, spécialisations absentes |
| **D** | Stockage, WIP et flux matière | Lieux de stockage et leur position dans le flux | `StorageEntity`, `Warehouse`, `Buffer`, `Supermarket`, `FIFOLane`, `InputBuffer`, `OutputBuffer`, `StorageZone`, `StorageUnit` | `storesMaterial` (D→C), `locatedBefore`/`locatedAfter`/`locatedBetweenUpstream`/`locatedBetweenDownstream` (D→C), `hasCapacity`, `hasCurrentQuantity` | Vers C (localisation relative aux équipements) | *Operational Entities* | `01_CORE.drawio` : `StorageEntity` présent, sous-classes (`Warehouse`, `Buffer`, `Supermarket`) absentes du sondage ; six bandes : `StorageEntity` présent seul |
| **E** | Systèmes d'information et rôles informationnels | Rôles des systèmes d'information (ERP, MES, WMS, APS) dans le flux de données | `ERP`, `MES`, `WMS`, `APS`, `InformationFlowRole`, `PlanningRole`, `ExecutionControlRole`, `DataAcquisitionRole`, `InventoryManagementRole` | `hasInformationFlowRole` (C→E), `receivesDataFrom`/`sendsInstructionTo` | Vers C (`InformationSystem` porte un `InformationFlowRole`) | *Operational Entities* | `01_CORE.drawio` : aucune des classes sondées (`ERP`/`MES`/`WMS`/`APS`) trouvée — **module le moins représenté graphiquement** ; six bandes : même constat |
| **F** | Ressources humaines, produits et ordres | Acteurs humains opérationnels, produits, ordres de fabrication/commande | `Operator`, `Supervisor`, `MaintenanceTechnician`, `Product`, `RawMaterial`, `SemiFinishedProduct`, `FinishedProduct`, `Component`, `WorkOrder`, `ProductionOrder`, `PurchaseOrder`, `CustomerOrder` | `concernsProduct`, `hasQuantity` | `WorkOrder` referencé par G (`relatedToWorkOrder`), H (`observedWorkOrder`), J (`relatesToWorkOrder`) — F est une cible fréquente des modules dynamiques | *Operational Entities* | `01_CORE.drawio` : `Product`/`WorkOrder` présents, `CustomerOrder`/`ProductionOrder` absents du sondage ; six bandes : mêmes classes pivot seulement |
| **G** | Événements bruts et observations | Capture des événements de terrain (couche Data Layer) | `RawEvent`, `EventSource` | `generatedBy`/`generatesEvent` (G↔C), `relatedToActor` (G→B), `relatedToEquipment` (G→C), `relatedToStorage` (G→D), `relatedToWorkOrder` (G→F), `hasEventTimestamp`, `hasEventType`, `hasEventValue`, `hasRawPayload` | Hub de références sortantes vers B, C, D, F ; alimente H via `producesIndicator` | *Operational Events* (correspondance conceptuelle documentée avec la **Data Layer** du manuscrit, non assertée dans l'OWL) | `01_CORE.drawio` : `RawEvent` présent, `EventSource` absent du sondage ; six bandes : `RawEvent` présent |
| **H** | Indicateurs VSM et contexte d'observation | Transformation des événements bruts en indicateurs (couche VSM Layer) | `VSMIndicator` et 30+ spécialisations (`CycleTime`, `LeadTime`, `TaktTime`, `OverallEquipmentEffectiveness`, `Availability`, `DefectRate`...), `ObservationContext` | `computedFromEvent` (H←G), `producesIndicator` (G→H), `hasObservationContext`, `observedActor/Entity/Equipment/Storage/Product/WorkOrder` (H→B/C/D/F) | Reçoit de G, référence B/C/D/F pour le contexte d'observation, alimente J via `measuredBy`/`aggregatesIndicator` | *VSM and Observation Context* (correspondance conceptuelle documentée avec la **VSM Layer**, non assertée dans l'OWL) | `01_CORE.drawio` : `VSMIndicator`/`ObservationContext` présents, spécialisations concrètes (`CycleTime`, `OEE`) absentes du sondage ; six bandes : classes pivot seulement |
| **I** | Référentiel SCOR et métriques [corrigé V4.1] | Processus et métriques SCOR, pipeline de scoring de performance (couche SCOR Layer) | `SCORProcess`, `SCORLevel1/2/3Process`, `SCORMetric`, `SCORMetricN1/N2/N3`, `SCORCompositeMetric`, `SCORPerformanceAttribute`, `Reliability`/`Responsiveness`/`Agility`/`Cost`/`AssetManagement`, `SCORPerformanceEvaluation`, `FuzzyPerformanceGradeSet` | `isMetricOfProcess`, `belongsToPerformanceAttribute`, `contributesToPerformanceAttribute`/`contributesToEvaluation`, `aggregatesTo`/`isAggregatedInto`, `hasFuzzyGradeSet`, `hasMetricValue`, `hasPerformanceScore`, `hasMetricWeight`, `hasAttributeWeight`, `hasGradeA`-`hasGradeF` | Reçoit de J (`scoredByRule`, `mapsToSCORN3`, `feedsSCORMetric`, `producesMetric` — tous des *unions* incluant des classes I) ; hérite de `scopro`/`scome`/`scobe` (Core↔SCONTO) | *SCOR reference framework* (correspondance conceptuelle documentée avec la **SCOR Layer**, non assertée dans l'OWL) | `01_CORE.drawio` : classes pivot (`SCORProcess`, `SCORMetric`, `SCORPerformanceAttribute`) présentes, mais **aucun des éléments ajoutés en V4.2/V4.3** (`hasMetricValue`, `hasPerformanceScore`, `FuzzyPerformanceGradeSet`, pondérations) — 0 occurrence, voir section 4 ; six bandes : même constat |
| **J** | Couche pivot **SVML** [propriétés mises à jour V4.1] | Normalisation, correspondance/mapping, agrégation : passage des indicateurs VSM aux métriques SCOR (couche SVU/SVML Layer) | `MicroActivity`, `MappingRule`, `CorrespondenceRule`, `NormalizationRule`, `NormalizationMethod`, `AggregationRule`, `AggregationFunction` (classe), `ActorScope`/`LineScope`/`MachineScope`/`StorageScope`/`SupplyChainScope`/`WorkshopScope`/`WorkstationScope` | `triggeredBy` (J←G), `executedAt`/`executedByResource`/`performedForActor` (J→C/B), `measuredBy`/`aggregatesIndicator` (J←H), `mapsToSCORN3`/`feedsSCORMetric`/`producesMetric`/`scoredByRule` (J↔I, via `owl:unionOf`), `governedBy`, `usesFunction`, `usesNormalizationMethod` | **Module le plus connecté** : relié à G, H, B, C, F (en entrée) et à I (en sortie, par unions de classes) — confirme son rôle de pivot décrit dans le manuscrit | *SVU pivot Module* (correspondance conceptuelle documentée avec la **SVU/SVML Layer**, non assertée dans l'OWL) | `01_CORE.drawio` : `MicroActivity`/`CorrespondenceRule`/`NormalizationRule`/`AggregationRule` tous présents (couverture correcte) ; six bandes : mêmes classes présentes — **module le mieux représenté dans les deux diagrammes** |
| **K** | Fonctions d'agrégation génériques | Individus réutilisables de `AggregationFunction` | *(pas de nouvelle classe — individus)* : `Sum`, `Average`, `WeightedAverage`, `Minimum`, `Maximum`, `Ratio`, `Count`, `LastKnownValue`, `Difference` | — (instances, pas de propriétés propres) | Individus utilisés par les règles du Module L via `usesFunction` | *SVU pivot Module* (contenu d'exemple, pas structurant) | `01_CORE.drawio` : `AggregationFunction` (la classe, Module J) présente ; les individus eux-mêmes ne sont pas un objet de diagramme de classes — non pertinent à représenter sous cette forme |
| **L** | Exemples de règles génériques d'agrégation | Individus illustratifs de `AggregationRule` avec formules concrètes | *(individus)* : `Rule_InventoryLevel_From_InOutEvents`, `Rule_WIP_Between_Equipments`, `Rule_CycleTime_Machine_To_Line`, `Rule_Availability_From_Uptime_Downtime`, `Rule_OEE_From_Availability_Performance_Quality` | `usesFunction`, `appliesToScope`, `aggregatesFromScope`/`aggregatesToScope`, `hasFormula` | Instances du Module J, illustrant son fonctionnement | — (exemples, hors périmètre conceptuel de F2) | Non représentés dans les diagrammes conceptuels (attendu, ce sont des exemples ABox) |
| **M** | Exemple minimal d'instanciation générique | Jeu d'instances minimal pour test/démonstration | *(individus)* | — | ABox illustrative | — | Non pertinent pour F2 ; candidat secondaire pour F9 si un exemple minimal est préféré à un run réel |
| **N** | Étude de cas « Company A » [ajout V4.2] | Instanciation complète d'un cas d'étude, traçabilité jusqu'aux questions de compétence du Tableau 5 de la thèse | *(individus)*, utilisant les propriétés du Module I (`hasMetricValue`, `hasPerformanceScore`, `contributesToPerformanceAttribute`...) | — | ABox utilisant les propriétés I et les règles J/K/L | — | Non pertinent pour F2 (conceptuel) ; **candidat principal pour F9** (exemple d'instanciation/traçabilité), sous réserve de confirmer s'il est préféré à un run ABox ZENER SA Togo réel (incertitude déjà notée) |

**Lecture d'ensemble** : les modules A à J forment le TBox conceptuel proprement dit (14 classes dans le noyau le plus connecté, le Module J, jusqu'à 37 dans le Module H qui liste toutes les spécialisations d'indicateur VSM). Les modules K à N sont des couches d'instances (ABox), de granularité croissante : fonctions réutilisables (K), règles d'exemple (L), instanciation minimale (M), étude de cas complète (N). Cette distinction TBox/ABox au sein même de la numérotation A-N n'était pas explicite dans l'audit initial et mérite d'être dite dans le chapitre, ne serait-ce que pour expliquer pourquoi F2 (conceptuelle) s'arrête au Module J et pourquoi F9 (instanciation) s'appuie sur M/N.

---

## 4. Module I vs Module N : clarification de l'apparente contradiction

**Confirmation de la correction déjà actée** : le pipeline de mesure et de performance (`hasMetricValue`, `hasPerformanceScore`, `FuzzyPerformanceGradeSet`, `hasMetricWeight`, `hasAttributeWeight`, `hasGradeA`-`hasGradeF`, `hasAggregationMethod`, `hasFormulaRef`) est **physiquement déclaré dans le Module I** (lignes 770-1076 du fichier), pas dans le Module N. Le Module N (lignes 1409 et suivantes) ne fait qu'**utiliser** ces propriétés pour instancier le cas « Company A » — il ne les définit pas.

**Clarification de la contradiction apparente relevée dans mon rapport précédent** (« aucun diagramme ne représente ces apports » / « `01_CORE.drawio` serait plus complet ») :

- `SCORPerformanceEvaluation` et le nom interne `SVML` (couche pivot), présents dans `01_CORE.drawio` mais absents du diagramme à six bandes, **existaient déjà avant les apports V4.2/V4.3** : le changelog du Core indique que `SCORPerformanceEvaluation` a été réalignée en **V4.1** (« alignée sur scobe:Benchmarking_project »), et `SVMLLayer` est déclarée dans le Module A sans mention de version récente. `01_CORE.drawio`, construit à partir de `SCONTO_VSM_v4_1_corrige.drawio` (8 juin), a donc pu représenter ces éléments en toute cohérence : ils faisaient déjà partie du Core à cette date.
- En revanche, **aucun élément propre à V4.2/V4.3** (`hasMetricValue`, `hasPerformanceScore`, `FuzzyPerformanceGradeSet`, `hasMetricWeight`, `hasAttributeWeight`) n'apparaît dans `01_CORE.drawio`, pour la même raison : ce diagramme est antérieur à l'introduction de ces éléments (V4.2 du Core a été constituée le 10-11 août dans `evolution_project`, soit deux mois après le 8 juin).

**Il n'y a donc pas de contradiction** : « plus complet » s'entendait pour les éléments pré-V4.2 ; les deux diagrammes sont à égalité (absence totale) sur les éléments propres à V4.2/V4.3. Ma formulation précédente prêtait à confusion en ne distinguant pas ces deux strates ; c'est corrigé ici.

### Liste exacte des éléments manquants à ajouter pour que F2 (ou une figure de détail du Module I) couvre le pipeline de performance

**Classes manquantes** : `FuzzyPerformanceGradeSet`.

**Propriétés manquantes** : `hasMetricValue`, `hasPerformanceScore`, `hasMetricWeight`, `hasAttributeWeight`, `hasGradeA`, `hasGradeB`, `hasGradeC`, `hasGradeD`, `hasGradeE`, `hasGradeF`, `hasAggregationMethod`, `hasFormulaRef`, `isBenefitMetric`, `hasBottomValue`/`hasPerfectValue` (ces deux dernières déclarées dans le Module J, sur `NormalizationRule`, mais fonctionnellement liées au scoring du Module I).

**Relations à ajouter** : `hasFuzzyGradeSet` (métrique → `FuzzyPerformanceGradeSet`), `contributesToPerformanceAttribute`/`contributesToEvaluation`, et les trois relations-pont déjà identifiées comme unions de classes (`scoredByRule`, `mapsToSCORN3`, `feedsSCORMetric`, `producesMetric` — ces deux dernières partent du Module J mais ciblent des classes du Module I et doivent donc apparaître sur une figure qui couvre les deux modules, cohérent avec le fait que J et I sont les deux modules les plus interconnectés).

Ce travail est un **ajout graphique**, pas une correction d'une erreur des diagrammes existants : rien n'y est faux, une partie du Module I n'y est simplement pas encore représentée.

---

## 5. Clarification SVML / SVU Layer

Recherche faite directement dans `SCONTO_SVU_Core_v4.3.0.ttl` :

- **Nature exacte** : `:SVMLLayer` est une `owl:Class`, sous-classe de `:ArchitectureLayer` (Module A), au même rang que les trois autres couches (`OperationalDataLayer`, `VSMLayer`, `SCORReferenceLayer`).
- **IRI** : `http://www.sconto-vsm.org/core#SVMLLayer` (préfixe `:` du fichier, résolu sur le namespace du Core).
- **Annotations** : `rdfs:label "SVML – SCOR-VSM Mapping Layer"@en` ; `rdfs:comment "Couche pivot de normalisation, mapping et agrégation reliant les observations VSM aux processus et métriques SCOR."@fr`.
- **Propriétés et relations associées** : aucune propriété ne porte explicitement sur `SVMLLayer` elle-même (pas de restriction, pas d'assertion `belongsToLayer` vers elle — voir ci-dessous). Les classes et propriétés qui *réalisent* fonctionnellement cette couche sont celles du **Module J** (`MicroActivity`, `CorrespondenceRule`, `NormalizationRule`, `AggregationRule`, et les relations `mapsToSCORN3`/`feedsSCORMetric`/`scoredByRule`), sans lien de `rdfs:subClassOf` ou de propriété explicite vers `SVMLLayer` elle-même.
- **Équivalence conceptuelle avec la SVU Layer du manuscrit** : la description fonctionnelle est **identique mot pour mot au principe** décrit en §3.4.3 du manuscrit (trois fonctions : normalisation technique, mapping sémantique, agrégation). Le `rdfs:comment` de `SVMLLayer` dit très exactement cela. Il s'agit donc, par la fonction et le contenu, de la même couche pivot. Seul l'acronyme diffère (**SVML** dans l'ontologie, **SVU** dans le manuscrit et le diagramme à six bandes).

**Fait technique supplémentaire, à ne pas confondre avec une erreur, mais à signaler** : la propriété `belongsToLayer` (qui permettrait de rattacher formellement une classe/instance à l'une des quatre couches, y compris `SVMLLayer`) est **déclarée mais jamais utilisée** dans tout le fichier `SCONTO_SVU_Core_v4.3.0.ttl` — aucune classe du Module G, H, I ou J n'est explicitement assertée comme appartenant à `OperationalDataLayer`, `VSMLayer`, `SVMLLayer` ou `SCORReferenceLayer`. Le rattachement modules G→Data, H→VSM, J→SVML, I→SCOR que j'établis dans ce document (section 3) **repose sur une lecture thématique des noms et des `rdfs:comment`**, pas sur une assertion OWL explicite. C'est une divergence réelle, bien que mineure, entre la documentation du cadre (manuscrit, très explicite sur les quatre couches) et son implémentation ontologique (la typologie des couches existe mais n'est pas connectée au reste du TBox).

**Conséquences pour les figures et le texte** :
- Pour F2, j'écarterais une correspondance présentée comme « assertée dans l'OWL » entre modules et couches ; je la présenterais comme une **lecture motivée**, avec cette réserve explicite en légende ou en note de bas de figure.
- Pour le texte du chapitre, une phrase d'explicitation suffit, par exemple : « la couche que l'ontologie nomme techniquement SVML (SCOR-VSM Mapping Layer, classe `SVMLLayer`) correspond à la SVU Layer décrite en §3.4 ; l'acronyme diffère, la fonction (normalisation, mapping, agrégation) est identique, telle que formulée dans le commentaire de la classe elle-même. »
- **Aucune modification d'identifiant ontologique n'a été faite ni n'est recommandée** : renommer `SVMLLayer` en `SVULayer` dans le `.ttl` casserait la continuité de version sans bénéfice scientifique ; la divergence s'explique dans le texte, pas dans l'ontologie.

---

## 6. Validation fine des diagrammes (classes / relations / spécialisations / cardinalités / absences / obsolescences)

Méthode : recherche directe, par nom exact de classe et de propriété, dans chaque fichier `.drawio`, plus recherche des marqueurs de restriction OWL (`owl:Restriction`, `someValuesFrom`, `allValuesFrom`, cardinalités).

### 6.1 Core (`01_CORE.drawio` et diagramme à six bandes)

| Critère | `01_CORE.drawio` | Diagramme à six bandes |
|---|---|---|
| Classes réellement présentes | Classes pivot de chaque module A-J présentes ; spécialisations concrètes (ex. `Machine`, `Warehouse`, `ERP`, `CycleTime`) largement absentes du sondage | Classes pivot seulement, niveau encore plus schématique |
| Relations représentées | Non vérifié exhaustivement dans cette passe (hors périmètre prioritaire) | idem |
| Spécialisations | Hiérarchies de haut niveau visibles, détail des feuilles absent | Idem, plus sommaire encore |
| Cardinalités / restrictions | **Aucune** (`Core_v4.3.0.ttl` lui-même ne contient d'ailleurs aucun `owl:Restriction` — le Core utilise seulement `rdfs:domain`/`rdfs:range` simples, pas de restrictions OWL formelles) | Aucune, pour la même raison |
| Éléments absents | Les quatre classes `ArchitectureLayer` (Module A), le pipeline de performance V4.2/V4.3 du Module I (section 4) | Les mêmes, plus les spécialisations de modules C à H |
| Éléments potentiellement obsolètes | Aucun relevé (pas de classe supprimée depuis la version source du diagramme) | Idem |

**Conclusion** : aucune incompatibilité à masquer ici — le Core n'a pas de restrictions formelles à représenter, donc ce critère n'est pas une lacune des diagrammes sur ce point précis. La lacune réelle reste la couverture du Module I récent (section 4).

### 6.2 Agent (`02_AGENT.drawio`) et AER (`03_AER.drawio`)

**Vous aviez raison de mettre en garde** : la présence de 100 % des classes ne garantit pas la complétude scientifique. Vérification faite au niveau des relations et des contraintes :

| Critère | Agent 1.1.2 (`02_AGENT.drawio`) | AER 1.1.2 (`03_AER.drawio`) |
|---|---|---|
| Classes réellement présentes | **29/29** classes contrôlées présentes | **42/42** classes contrôlées présentes |
| Relations (propriétés objet) représentées | **18/19** propriétés sondées présentes comme libellés d'association ; **absente : `coordinatesProcess`** (0 occurrence) | **14/14** propriétés sondées présentes |
| Spécialisations | Hiérarchie `HolonAgent` → `StrategicAgent`/`TacticalAgent`/`CoordinatorAgent`/`OperationalPilotAgent`/`OperationalExecutionAgent` visible | Hiérarchie des types de messages (`ExecutionMessage` → `ExecutionStartMessage`/`...DelayMessage`/`...FailureMessage`/etc.) à vérifier visuellement, classes présentes |
| Cardinalités / restrictions | **Essentiellement absentes** : le fichier source déclare **54 blocs `owl:Restriction`** (ex. « un `MachineAgent` représente au moins un `core:Machine` » via `someValuesFrom`, « un `StrategicAgent` ne représente que des `SupplyChainActor` » via `allValuesFrom`) ; le diagramme ne contient qu'**une seule occurrence du texte « OWL Restrictions »**, qui est une entrée de légende, pas une restriction effectivement dessinée | Même constat : légende « OWL Restrictions » présente une fois, **aucune des restrictions réelles du fichier source n'est représentée graphiquement** |
| Éléments absents | `coordinatesProcess` (relation) ; l'ensemble des 54 restrictions (contraintes de typage, cardinalités implicites via `someValuesFrom`/`allValuesFrom`) | L'ensemble des restrictions réelles (non comptées individuellement dans cette passe, mais confirmées absentes du rendu graphique) |
| Éléments potentiellement obsolètes | `SupervisorAgent` est conservé dans le fichier comme « alias historique » (cf. `rdfs:comment` du fichier source) ; présent dans le diagramme (1 occurrence) — correct de le garder visible mais à légender comme alias, pas comme niveau actif de la hiérarchie | `SupervisorReport` coexiste avec `OperationalPilotReport` dans le fichier (l'un déprécié au profit de l'autre, selon la documentation déjà citée dans l'audit) ; les deux sont présents dans le diagramme — même recommandation de légende |

**Conclusion** : les classes et la plupart des relations sont fidèlement représentées, mais **aucune cardinalité ni restriction OWL réelle n'est dessinée dans aucun des deux diagrammes** — seule une légende générique l'annonce. Pour une figure scientifiquement complète au sens de votre consigne (« les contraintes et cardinalités devront être représentées fidèlement »), un **travail de complément est nécessaire** avant publication, pas seulement une vérification de présence de classes.

### 6.3 Forecast/MTS (`05_FORECAST_MTS.drawio`) et ISA-95 (`06_ISA95.drawio`) — deux axes distincts

**Axe 1 — fidélité du diagramme à son fichier d'origine** : élevée pour les deux. `05_FORECAST_MTS.drawio` est identique octet pour octet à sa source et correspond à la variante retenue (sans AHP, déjà vérifié dans l'audit). `06_ISA95.drawio` est identique à sa source, seule version existante.

**Axe 2 — alignement de l'extension avec le Core actuellement retenu (4.3.0)** : **correction de formulation apportée sur votre demande**. Le fait vérifié est que les deux extensions importent Core **4.1.0** (Forecast/MTS importe en plus Agent 1.0.0/AER 1.0.0), au lieu de 4.3.0/1.1.2. Cela établit une **absence d'alignement de version et de revalidation** avec la ligne actuelle ; cela ne démontre pas, à soi seul, une incompatibilité logique. Aucun test de cohérence (chargement conjoint dans un raisonneur) n'a été effectué entre Forecast/MTS ou ISA-95 et le Core 4.3.0 dans cet audit, donc aucune incompatibilité ne peut être affirmée comme établie. Ce n'est pas un défaut du diagramme, c'est une limite de validation de l'extension elle-même, déjà consignée dans l'audit et dans `ETAPE2...md` section 2 — **à ne pas masquer dans le chapitre**, comme vous le demandez, mais à formuler avec cette précision : « non revalidées avec la ligne courante », pas « incompatibles ». La formulation déjà proposée (§2 de `ETAPE2...md`) reste recommandée : présenter la structure conceptuelle sans affirmer ni une interopérabilité technique démontrée, ni une incompatibilité démontrée, avec Core 4.3.0.

**Cardinalités/restrictions** : même constat que pour Agent/AER — les fichiers sources contiennent des restrictions réelles (9 pour Forecast/MTS, 10 pour ISA-95), les diagrammes n'en représentent aucune au-delà de la légende « OWL Restrictions ».

### 6.4 Registre graphique des documentations officielles SCOPRO/SCOME/SCOBE

Limite à signaler : je dispose du registre graphique complet de **SCOPRO** (Fig. 2-7 de l'article de référence, lues intégralement : diagrammes UML par dimension, tables de relations et de contraintes en regard). Je n'ai pas accédé aux figures UML propres de **SCOME** et **SCOBE** (la documentation OnToology en ligne citée par l'article n'a pas été consultée, environnement hors ligne). Les diagrammes Agent/AER/Forecast-MTS/ISA-95 actuels suivent déjà, dans leur registre graphique propre (boîtes de classes, flèches de spécialisation, losanges d'association), une convention proche de celle de SCOPRO observée dans l'article, mais je ne peux pas confirmer qu'ils suivent spécifiquement celle de SCOME/SCOBE faute d'avoir vu ces figures. À traiter comme une limite de preuve, pas comme un point résolu.

---

## 7. Matrice définitive des figures par chapitre

| ID | Titre | Chapitre | Sources OWL | Fiabilité graphique actuelle | Production immédiate possible ? | Reste à faire |
|---|---|---|---|---|---|---|
| F1 | Organisation générale de SCONTO-SVU | 3 | Imports réels de tous les `.ttl` retenus | Aucune source existante | Non | Conception complète (convention validé/non revalidé) |
| F2 | Architecture conceptuelle du Core (modules A-J) | 3 | Modules A à J, Core 4.3.0 | Base disponible (`sconto_svu_core_main_concepts.drawio` ou `01_CORE.drawio`), incomplète sur le Module I récent et sur les 4 classes du Module A | Non | Ajouter les éléments listés en section 4 ; clarifier le statut « lecture motivée » du rattachement couches/modules (section 5) |
| F3 (fusionnée dans F2) | — | — | — | — | — | Supprimée, pour éviter la redondance UML/conceptuel déjà signalée |
| F4 | Diagramme de classes Agent | 4 | Agent 1.1.2 | Classes et relations vérifiées correctes ; **cardinalités/restrictions absentes** | Oui pour classes/relations ; non pour une figure présentée comme « complète » au sens de vos critères | Ajouter une représentation (même partielle) des restrictions majeures, ou légender explicitement leur absence |
| F5 | Diagramme de classes AER | 4 | AER 1.1.2 | Même constat que F4 | Idem | Idem |
| F6 (AHP) | — | — | — | — | **Exclue définitivement** | — |
| F7 | Diagramme de classes Forecast/MTS | Chapitre expérimental concerné (prévision/MTS) | `sconto-vsm-forecast-mts-extension_1.ttl` (Core 4.1.0/Agent 1.0.0, non revalidé) | Fidèle à sa source ; non revalidé avec Core 4.3.0 (absence d'alignement, pas d'incompatibilité démontrée) ; restrictions absentes du rendu | Oui, avec légende obligatoire sur la non-revalidation et l'absence de restrictions dessinées | Confirmer l'emplacement exact dans les chapitres expérimentaux avec vous |
| F8 | Diagramme de classes ISA-95 | 4 | `sconto-vsm-isa95-extension-v1.0.ttl` (Core 4.1.0, non revalidé) | Même constat que F7 | Oui, même légende | Aucune hors légende |
| F9 | Exemple d'instanciation et traçabilité | 3 | Module N (Company A) ou run ABox réel (ZENER SA Togo) | Aucune source graphique existante | Non | Choisir entre l'exemple Module N (déjà dans l'ontologie, prêt à illustrer) et un run réel (incertitude déjà notée) |

---

## 8. Blocages encore présents

1. **Choix du run/exemple pour F9** : Module N (« Company A », déjà dans l'ontologie) vs un run ABox réel ZENER SA Togo — à trancher avec vous.
2. **Emplacement exact de F7** dans les chapitres expérimentaux (quel chapitre précis parmi ceux consacrés à la prévision/MTS) — non précisé par votre dernière consigne.
3. **Représentation des cardinalités/restrictions** pour F4, F5, F7, F8 : aucun des diagrammes existants ne les représente actuellement ; une figure jugée scientifiquement complète selon vos critères du point 6 nécessite soit un complément graphique (ajouter les restrictions réelles, au moins les plus significatives), soit une légende assumant explicitement cette limite. Le choix entre les deux reste à valider avec vous.
4. **Divergence SCOME/SCOBE** (déjà posée dans `ETAPE2...md` §7) : toujours non résolue, documentation OnToology non consultée (environnement hors ligne).
5. **Registre graphique SCOME/SCOBE** : je n'ai vu que celui de SCOPRO (article de référence) ; je ne peux pas confirmer l'alignement des diagrammes Agent/AER/Forecast-MTS/ISA-95 sur un registre SCOME/SCOBE que je n'ai pas consulté (section 6.4).
6. **Relations et spécialisations d'`01_CORE.drawio`** : vérifiées pour les classes pivot uniquement dans cette passe ; une vérification exhaustive relation par relation (comme celle faite pour Agent/AER) n'a pas été faite pour le Core faute de temps dans cette itération — à faire avant la production définitive de F2 si une garantie complète est requise.

---

*Document soumis pour validation. Aucune rédaction finale ni production massive de figures n'a été engagée. Le prochain geste technique (commit + push de ce fichier) attend votre feu vert implicite via cette passe, conformément à votre demande de clôturer la consolidation documentaire.*
