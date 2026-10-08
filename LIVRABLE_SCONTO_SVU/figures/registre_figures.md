# Registre des figures — premier lot, version corrigée (étape 5)

Dossier : `LIVRABLE_SCONTO_SVU/figures/{sources,svg,png}/`. Remplace la version précédente (étape 4) : F1 corrigée (AHP retirée), F2 corrigée (hiérarchie ObservableEntity rectifiée) et accompagnée d'une figure dédiée au Module A (F2b), et F3 scindée en F3a (unification VSM-SCOR) et F3b (évaluation de performance) pour rester lisible à la largeur de composition réelle. L'ancienne F3 (fichier unique) a été retirée du livrable.

**Échelle de composition.** Toutes les figures sont dessinées dans un système de coordonnées où 1 unité SVG = 1 point PostScript à l'insertion en pleine largeur de texte (`\includegraphics[width=\textwidth]`, testé à 455,24 pt soit 160 mm). Les tailles de police déclarées dans chaque SVG sont donc directement les tailles d'impression finales. Un test de rendu dans un document LaTeX minimal (`pdflatex`, `article`, marges 2,5 cm) a été exécuté pour chaque figure et le PDF obtenu relu page par page.

---

## F1 — Organisation générale de SCONTO-SVU

- **Fichier** : `F1_organisation_generale.{svg,dot,png}`
- **Correction imposée appliquée** : toute mention d'AHP a été retirée du dessin (sous-titre et note de périmètre) ; `registre_figures.md` et les rapports d'audit conservent seuls la trace de cette exclusion, conformément à la consigne (« les documents internes d'audit peuvent conserver l'historique »).
- **Annotations allégées** : la légende ne porte plus que l'essentiel (convention de trait, convention de boîte, renvoi au registre) ; le détail des tests de raisonneur et des générations de version a été déplacé ici.
- **Lisibilité** : testée à 160 mm (`\textwidth`) — toutes les annotations ≥ 8 pt, texte principal 9,5-13,5 pt. Aucun chevauchement, aucune flèche traversant une boîte (deux croisements corrigés : libellés `owl:imports` déplacés hors du tracé des flèches Core→Agent/AER et Forecast-MTS/ISA-95→génération antérieure).
- **Source alternative** : `F1_organisation_generale.dot` (Graphviz), preuve de concept — voir section « Sources éditables ».

## F2 — Concepts fondamentaux du Core

- **Fichier** : `F2_concepts_core.svg`/`.png`
- **Correction majeure appliquée** : la relation `generatedBy` reliait à tort `RawEvent` à une classe `EventSource` présentée comme sa portée. Vérification structurée (rdflib) : la portée réelle de `generatedBy` est `ObservableEntity` ; `EventSource` est une spécialisation (`rdfs:subClassOf`) d'`ObservableEntity`, au même titre que `PhysicalEntity`, `InformationSystem`, `HumanResource`, `MaterialEntity` — pas une classe reliée par une propriété. La figure montre désormais `ObservableEntity` comme cible réelle de `generatedBy`, avec une note renvoyant à la hiérarchie exacte plutôt que de la redessiner intégralement (lisibilité).
- **Vérification des liens B-J (demandée)** : chaque flèche de cette figure (`belongsToActor`, `ownsEquipment`, `relatedToEquipment`, `generatedBy`, `producesIndicator`, `hasObservationContext`, `measuredBy`, `mapsToSCORN3`, `producesMetric`, `belongsToPerformanceAttribute`) a été confrontée à son domaine/sa portée exacts via `rdflib` — détail : `MATRICE_RELATIONS_VERIFIEES.md`. Aucune direction ni aucun domaine n'a dû être corrigé au-delà du cas `generatedBy`/`ObservableEntity`.
- **Module A traité séparément** : les quatre classes `ArchitectureLayer` ne sont plus esquissées ici ; un encart de vigilance renvoie à F2b.
- **Lisibilité** : testée à 160 mm, annotations ≥ 8,3 pt. Quatre corrections de routage après la première passe (libellés `ownsEquipment`, `relatedToEquipment`, `mapsToSCORN3`, `hasObservationContext` déplacés hors des tracés et des titres de bande).

## F2b — Module A : typologie des couches architecturales *(nouvelle figure)*

- **Fichier** : `F2b_module_a_layers.svg`/`.png`
- **Contenu** : les quatre classes réelles `OperationalDataLayer`, `VSMLayer`, `SVMLLayer`, `SCORReferenceLayer`, toutes `rdfs:subClassOf ArchitectureLayer` — hiérarchie OWL exacte, pas une reconstruction.
- **Aucun lien `belongsToLayer` inventé** : la figure ne dessine aucune flèche entre ces classes et le reste du Core, et l'encart de vigilance répète explicitement que cette propriété existe mais n'est jamais assertée (0 occurrence, vérifié `rdflib`).
- **Correspondances fonctionnelles** : présentées sous forme de texte (« ↔ Data Layer », etc.), explicitement qualifiées de « correspondance conceptuelle documentée (manuscrit §3.4), non assertée dans l'OWL » — pas un trait de relation, pour ne pas laisser croire à une assertion OWL.
- **Lisibilité** : testée à 160 mm, annotations ≥ 9,3 pt, aucun chevauchement.

## F3a — Unification VSM-SCOR (Module J)

- **Fichier** : `F3a_unification_vsm_scor.svg`/`.png`
- **Contenu** : `MappingRule` → `CorrespondenceRule`/`NormalizationRule` ; `MicroActivity` ; pont vers `SCORLevel3Process` (`mapsToSCORN3`) et `SCORMetric` (`feedsSCORMetric`) ; retour `scoredByRule`.
- **Relations vérifiées** : les quatre propriétés de pont sont vérifiées par `rdflib` avec leurs domaines/portées exacts (unions de classes) — voir `MATRICE_RELATIONS_VERIFIEES.md`. Les unions complètes sont données en toutes lettres dans un encart plutôt que simplifiées en une seule classe sans avertissement.
- **Lisibilité** : testée à 160 mm, annotations ≥ 8 pt. Corrections : le tracé `scoredByRule` traversait initialement `MicroActivity` et l'encart de définitions ; routé par la marge droite. Sous-titre de `SCORLevel3Process` raccourci (débordait du cadre de la boîte).

## F3b — Évaluation de performance (Module I)

- **Fichier** : `F3b_evaluation_performance.svg`/`.png`
- **Contenu** : deux chaînes explicitement distinguées, conformément au `rdfs:comment` du fichier source :
  1. **Chaîne de valeur** (`aggregatesTo`, rouge) : `SCORMetricN3` → `SCORMetricN2` → `SCORMetricN1`/`SCORCompositeMetric`, plus `isAggregatedInto` (`SCORMetric` → `SCORCompositeMetric`).
  2. **Chaîne de score/contribution** (noir) : toute métrique → `contributesToPerformanceAttribute` → `SCORPerformanceAttribute` (+ 5 spécialisations RL/RS/AG/CO/AM) → `contributesToEvaluation` → `SCORPerformanceEvaluation`, avec la voie alternative documentée `producesEvaluation` (depuis N1) tracée en pointillés distincts.
  3. Grades flous (`FuzzyPerformanceGradeSet`, 6 grades) et pondérations (`hasMetricWeight`, `hasAttributeWeight`), avec domaines en union donnés en toutes lettres.
- **Traitement de l'anomalie SCOBE** : l'axiome `SCORPerformanceEvaluation rdfs:subClassOf scobe:Benchmarking_project` est représenté par une flèche rouge en pointillés vers une boîte tierce grisée, accompagnée d'un encart « Point de vigilance — non résolu, non modifié » qui cite l'axiome exact et renvoie à `NOTE_TECHNIQUE_ANOMALIE_SCOBE.md`. **Ce lien n'est jamais présenté comme une spécialisation validée.**
- **Lisibilité** : testée à 160 mm, annotations ≥ 8,3 pt. Trois débordements de texte hors cadre corrigés après la première passe (lignes de domaine en union trop longues, raccourcies ou reformatées sur deux lignes ; légende finale scindée en deux lignes).

---

## Matrice des relations vérifiées

Table complète (IRI, domaine, portée exacts, `owl:inverseOf`, spécialisations) : `../MATRICE_RELATIONS_VERIFIEES.md`. Contient aussi l'explication de l'écart de décompte des restrictions Agent (54 lignes `grep` ↔ 27 nœuds `owl:Restriction` réels).

## Anomalie SCORPerformanceEvaluation / SCOBE

Analyse technique (vérification IRI par `rdflib`, démonstration que l'IRI référencée n'est déclarée nulle part) et analyse sémantique (quatre alternatives de modélisation, non tranchées) : `../NOTE_TECHNIQUE_ANOMALIE_SCOBE.md`. Aucun fichier OWL n'a été modifié.

## Sources éditables — choix du format

**SVG dessiné à la main (format retenu pour toutes les figures).** Chaque figure reste un fichier `.svg` texte, éditable dans tout éditeur ou outil vectoriel. Avantage décisif ici : contrôle précis du placement de chaque libellé hors des tracés de flèches, nécessaire à la densité de F2/F3a/F3b et à la contrainte de lisibilité à 160 mm — un algorithme de disposition automatique ne garantit pas cela.

**Graphviz DOT — évalué, fourni en complément pour F1 (`F1_organisation_generale.dot`).** Avantage réel : le graphe est déclaré comme données (nœuds/arêtes), pas comme coordonnées — ajouter un nœud ou une arête ne demande aucun recalcul de position. Limite constatée en le testant sur F1 : la disposition automatique ne respecte pas la convention graphique déjà retenue (couloir dédié pour les libellés de pont, boîtes de légende positionnées librement) sans un travail de réglage des contraintes de rang comparable à celui du SVG manuel — gain net surtout pour des graphes simples comme F1, pas démontré pour F2/F3a/F3b dans le temps disponible pour cette étape.

**PlantUML — non retenu.** Pertinent pour des diagrammes de classes UML stricts, mais les figures F2/F2b/F3a/F3b mêlent diagrammes de classes, notes de traçabilité positionnées, et encarts de vigilance : un rendu PlantUML standard ne reproduit pas cette mise en page sans détournement important de la syntaxe.

**Draw.io — non testé.** Aucun outil Draw.io (CLI ou application) n'est disponible dans cet environnement d'exécution pour produire ou vérifier un export ; resterait l'option la plus proche des conventions déjà utilisées dans `ONTOLOGIES_DIAGRAMMES_SUPERVISION/DRAWIO/`, à évaluer si une édition interactive (hors ligne de commande) est souhaitée pour la suite.

**Recommandation** : conserver le SVG manuel comme format de source pour ce lot (déjà produit et vérifié) ; envisager Graphviz DOT pour les futures figures simples de type dépendance (comme F1) si le volume de figures à produire augmente, lorsque pouvoir ajouter un nœud ou une arête sans retoucher les coordonnées devient un gain net.

---

## Vérifications effectuées (séparées par type)

### Vérification syntaxique
Chaque SVG rendu sans erreur par Chromium (headless) ; `F1_organisation_generale.dot` validé par `dot -Tsvg` (Graphviz 14.1.2) sans erreur.

### Contrôle de correspondance graphique
Chaque classe et relation vérifiée par analyse structurée du graphe RDF (`rdflib` 7.5.0), pas par recherche textuelle seule — voir `MATRICE_RELATIONS_VERIFIEES.md`. Deux erreurs détectées et corrigées avant livraison : la relation `generatedBy`/`EventSource` (F2) et la hiérarchie `SCORMetricN1/N2` (détectée à l'étape précédente, reconfirmée ici).

### Validation logique par raisonneur
Aucune nouvelle exécution dans cette passe. Le point de vigilance SCOBE (F3b) est documenté comme un défaut d'alignement sémantique non détectable par un raisonneur standard (argumenté dans `NOTE_TECHNIQUE_ANOMALIE_SCOBE.md`), pas comme une inconsistance logique.

### Vérification de lisibilité à l'échelle réelle
Chaque figure incluse dans un document LaTeX minimal (`pdflatex`, `\includegraphics[width=\textwidth]`, 160 mm) et relue page par page. Toutes les annotations ≥ 8 pt (cible 9-10 pt largement atteinte pour le texte principal). Aucune flèche ne traverse une classe dans la version finale ; chevauchements et débordements détectés lors de cette relecture ont été corrigés avant livraison (détail par figure ci-dessus).
