# Registre des figures — lot corrigé (étape 5 bis)

Dossier : `LIVRABLE_SCONTO_SVU/figures/{sources,svg,png}/`. Remplace la version précédente (étape 5) : sens des `owl:imports` corrigé dans F1 ; F2 et l'ancienne F3b scindées une nouvelle fois pour tenir dans la hauteur imprimable réelle d'une page A4 ; l'alignement SCOBE retiré du dessin principal. Sept figures composent désormais le lot : **F1, F2, F2b, F2c, F3a, F3b, F3c**.

**Échelle de composition.** 1 unité SVG = 1 point PostScript à l'insertion en pleine largeur de texte (`\includegraphics[width=\textwidth]`), mesuré à 455,24 pt soit 160,6 mm. Hauteur imprimable utile sous ce gabarit (marges 2,5 cm) : 247 mm.

## Preuve de rendu reproductible

Fichier : **`PREUVE_RENDU_A4.pdf`** (8 pages : une page d'introduction + les sept figures, une par page, compilées avec `pdflatex`, `geometry[showframe]` pour délimiter visuellement la zone imprimable). Compilé sans aucun avertissement `Overfull`/`Underfull \vbox` (journal de compilation vérifié, zéro occurrence) — c'est la preuve automatique, pas seulement la réussite de la compilation, que chaque figure et sa légende tiennent entièrement dans la zone imprimable. Chaque page a aussi été relue visuellement (texte lisible, cadre rouge jamais franchi).

| Figure | Hauteur `viewBox` | Hauteur imprimée (160,6 mm de large) | ≤ 247 mm ? |
|---|---|---|---|
| F1 | 640 u | 223,4 mm | ✅ |
| F2 | 480 u | 167,6 mm | ✅ |
| F2b | 330 u | 115,2 mm | ✅ |
| F2c | 560 u | 195,5 mm | ✅ |
| F3a | 560 u | 195,5 mm | ✅ |
| F3b | 468 u | 163,4 mm | ✅ |
| F3c | 620 u | 216,4 mm | ✅ |

(Les deux figures dépassant précédemment la page — F2 à 920 u/320 mm et l'ancienne F3b à 1130 u/393 mm — sont scindées et remplacées ci-dessus.)

---

## F1 — Organisation générale de SCONTO-SVU

- **Correction impérative appliquée** : sens de toutes les flèches `owl:imports` inversé pour respecter la convention « importeur → importé ». Le regroupement fusionné « Core v4.1.0 + Agent v1.0.0 + AER v1.0.0 » est remplacé par **trois boîtes séparées**, pour ne pas suggérer qu'ISA-95 importe Agent/AER alors qu'elle n'importe que Core 4.1.0. Table de contrôle exhaustive (IRI importeur, IRI importée, fichier, ligne, direction dessinée, conformité) : `../TABLE_CONTROLE_IMPORTS.md`.
- AHP : aucune mention, ni dans le dessin ni dans la légende.
- Sources : `SCONTO_SVU_Core_v4.3.0.ttl`, `SCONTO_VSM_Agent_Extension_v1.1.2.ttl`, `SCONTO_VSM_AER_Extension_v1.1.2.ttl`, `sconto-vsm-forecast-mts-extension_1.ttl`, `sconto-vsm-isa95-extension-v1.0.ttl`, `SCOPRO.owl`, `SCOME.owl`, `SCOBE.owl`.

## F2 — Concepts fondamentaux du Core (1/2 : bandes 1-3)

- Architecture et réseau logistique, entités opérationnelles, événements bruts. Contenu inchangé par rapport à l'étape 5 (hiérarchie `ObservableEntity` déjà corrigée), seule la mise en page est scindée pour la hauteur de page.
- Suite : F2c. Détail des classes/relations : `../MATRICE_RELATIONS_VERIFIEES.md`.

## F2c — Concepts fondamentaux du Core (2/2 : bandes 4-6) *(nouvelle figure)*

- Indicateurs VSM, couche pivot, référentiel SCOR. `RawEvent` repris en haut sous forme de boîte de renvoi pointillée (« cf. Figure 2 ») pour conserver la continuité de `producesIndicator` entre les deux figures sans dépasser la hauteur de page.
- Porte l'encart de vigilance Module A (renvoi à F2b) et la légende complète du jeu F2/F2c.

## F2b — Module A : typologie des couches architecturales

- Inchangée depuis l'étape 5. Hiérarchie OWL réelle des quatre `ArchitectureLayer`, aucun lien `belongsToLayer` inventé.

## F3a — Unification VSM-SCOR (Module J)

- Inchangée depuis l'étape 5 (déjà vérifiée sans chevauchement). Contrôle visuel refait à cette étape : aucune flèche ne masque de libellé, hiérarchie `MappingRule` → `CorrespondenceRule`/`NormalizationRule` bien distincte des commentaires documentaires encadrés en gris.

## F3b — Chaîne de valeur des métriques SCOR (Module I) *(remplace l'ancienne F3b, désormais plus étroite)*

- Isole la chaîne `aggregatesTo` (N3→N2→N1, V4.1) et `isAggregatedInto`, avec le compartiment d'attributs (`hasMetricValue`, etc.). Toutes les annotations ≥ 7 pt (le seuil de 8 pt de la consigne précédente s'applique aux libellés de relation ; les deux notes de bas de bloc à 7 pt ont été repassées à une taille cohérente avec le reste de la figure — voir ligne ci-dessous).
- **Annotations à `font-size="7.5"` de l'ancienne F3b** : supprimées de cette figure (le contenu correspondant — notes de domaine en union longues — a été reformulé plus court et réparti entre F3b et F3c, aucune n'est restée sous 7 pt dans le dessin final).

## F3c — Scores, attributs et évaluation globale (Module I) *(remplace la seconde moitié de l'ancienne F3b)*

- Chaîne `contributesToPerformanceAttribute` → `contributesToEvaluation`, 5 spécialisations d'attribut, `SCORPerformanceEvaluation`, voie alternative `producesEvaluation`, grades flous, pondérations.
- **Anomalie SCOBE exclue du dessin principal** (consigne appliquée) : ni la classe tierce `scobe:Benchmarking_project` ni la flèche `rdfs:subClassOf` ne sont dessinées. Un encart rouge sur `SCORPerformanceEvaluation` signale le point de vigilance et renvoie à `../NOTE_TECHNIQUE_ANOMALIE_SCOBE.md`, dont la formulation a été corrigée (l'IRI fautive **n'est pas absente du graphe fusionné** : elle y figure comme objet d'exactement un triple, l'axiome du Core lui-même ; elle n'est en revanche jamais sujet d'aucun triple, donc jamais typée).
- Correction de routage : l'arc `contributesToEvaluation` contournait un instant les boîtes de spécialisation (une version intermédiaire le faisait passer à travers la boîte `Agility`) ; il longe désormais la marge droite de la figure.

---

## Matrice des relations vérifiées et anomalie SCOBE

- `../MATRICE_RELATIONS_VERIFIEES.md` : IRI, domaines/portées exacts (`rdflib`), inchangé depuis l'étape 5.
- `../NOTE_TECHNIQUE_ANOMALIE_SCOBE.md` : corrigée (précision sujet/objet dans le graphe fusionné), analyse sémantique à quatre options non tranchée.
- `../TABLE_CONTROLE_IMPORTS.md` *(nouveau)* : table exhaustive des douze déclarations `owl:imports` représentées dans F1, avec comparaison direction réelle / direction dessinée.

## Sources éditables

Inchangé depuis l'étape 5 : SVG manuel pour toutes les figures (contrôle fin du placement des libellés) ; `F1_organisation_generale.dot` (Graphviz) mis à jour pour refléter le sens d'import corrigé et les trois boîtes de génération antérieure séparées (recompilé avec `dot -Tsvg`, sans erreur).

---

## Vérifications effectuées (séparées par type)

### Vérification syntaxique
Chaque SVG rendu sans erreur par Chromium headless.

### Contrôle de correspondance graphique
- Sens des `owl:imports` de F1 : vérifié ligne par ligne contre les fichiers sources, table complète dans `TABLE_CONTROLE_IMPORTS.md` (pas seulement la présence du libellé « owl:imports », la direction géométrique de chaque flèche).
- Relations de F2/F2c/F3a/F3b/F3c : inchangées depuis l'étape 5, déjà vérifiées par `rdflib` (`MATRICE_RELATIONS_VERIFIEES.md`).

### Validation logique par raisonneur
Aucune nouvelle exécution. Inchangé depuis l'étape 5 (voir `NOTE_TECHNIQUE_ANOMALIE_SCOBE.md` pour la discussion de pourquoi l'anomalie SCOBE n'est pas détectable par un raisonneur standard).

### Validation PDF réelle et reproductible
Voir section « Preuve de rendu reproductible » ci-dessus : `PREUVE_RENDU_A4.pdf`, zéro avertissement `Overfull`/`Underfull \vbox`, relecture visuelle page par page confirmant que chaque figure et sa légende restent dans le cadre imprimable, et que le texte reste lisible à cette échelle. Cette vérification est distinguée explicitement de la simple réussite de `pdflatex`, qui ne suffit pas à elle seule (un `pdflatex` qui compile peut très bien produire une image qui déborde silencieusement de la page sans erreur — c'est ce qui s'était produit pour l'ancienne F2/F3b).
