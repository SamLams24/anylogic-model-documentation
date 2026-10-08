# Étape 5 bis — Corrections bloquantes avant validation graphique

Revue indépendante du commit `d76d77413a6cf816e5249eb9e62022e3ab6d83d0` : trois anomalies bloquantes relevées, corrigées ci-dessous. Aucun fichier ontologique original n'a été modifié ; aucune figure des autres extensions n'a été engagée ; la rédaction du chapitre n'a pas commencé.

## 1. F1 — sens des `owl:imports` inversé

**Anomalie** : plusieurs flèches pointaient de l'ontologie importée vers l'importeuse (sens inverse de la convention `owl:imports`). Le regroupement fusionné « Core v4.1.0 + Agent v1.0.0 + AER v1.0.0 » suggérait visuellement qu'ISA-95 importait les trois, alors qu'elle n'importe que Core 4.1.0.

**Correction** : toutes les flèches réorientées (Core → SCOPRO/SCOME/SCOBE ; Agent → Core ; AER → Core et Agent ; SCOBE → SCOME → SCOPRO ; Forecast/MTS → Core/Agent/AER v1.x anciens ; ISA-95 → Core v4.1.0 seul). La boîte fusionnée est remplacée par trois boîtes séparées (Core v4.1.0, Agent v1.0.0, AER v1.0.0).

**Preuve** : `TABLE_CONTROLE_IMPORTS.md`, douze lignes, chacune avec IRI importeur, IRI importée, fichier source, numéro de ligne, direction effectivement dessinée (relevée élément par élément dans le SVG, pas supposée depuis le libellé) et verdict de conformité. Douze conformes sur douze.

## 2. F2 et l'ancienne F3b — dépassement de la hauteur A4

**Anomalie** : `viewBox` de 920 et 1130 unités, soit respectivement 320 mm et 393 mm à l'insertion `\textwidth` — bien au-delà de la hauteur imprimable A4 (247 mm avec marges 2,5 cm). La compilation `pdflatex` réussissait sans erreur, ce qui masquait le problème : LaTeX laisse silencieusement une image déborder de la page sans erreur de compilation.

**Correction** : F2 scindée en F2 (bandes 1-3, 480 u / 167,6 mm) et **F2c** (bandes 4-6, 560 u / 195,5 mm, nouvelle figure). L'ancienne F3b scindée en **F3b** (chaîne de valeur, métriques N3/N2/N1/Composite, 468 u / 163,4 mm) et **F3c** (scores, attributs, évaluation globale, grades flous, 620 u / 216,4 mm). Nomenclature cohérente avec F2b déjà en place. Les sept figures du lot sont maintenant toutes ≤ 223,4 mm, sous le seuil de 247 mm.

**Annotations à 7,5 pt de l'ancienne F3b** : supprimées du dessin ; le contenu correspondant reformulé plus court et réparti entre F3b et F3c sans repasser sous 7 pt.

## 3. Validation PDF réelle et reproductible

**Méthode** : `PREUVE_RENDU_A4.pdf` (8 pages), compilé avec `pdflatex`, `geometry[showframe]` pour visualiser la zone imprimable exacte, une figure par page en `width=\textwidth`. Journal de compilation vérifié : **zéro avertissement `Overfull`/`Underfull \vbox`** — critère automatique et reproductible, distinct de la simple réussite de compilation. Chaque page relue visuellement : image et légende entièrement à l'intérieur du cadre, texte lisible. C'est cette vérification, et non la seule compilation, qui constitue la preuve de tenue en page.

## 4. Anomalie SCOBE — précision et exclusion du dessin

**Précision terminologique corrigée** dans `NOTE_TECHNIQUE_ANOMALIE_SCOBE.md` : l'IRI fautive `scobe:Benchmarking_project` **n'est pas absente du graphe fusionné** — vérification refaite avec `rdflib` : elle y figure exactement une fois, comme **objet** du triple que le Core déclare lui-même (`core:SCORPerformanceEvaluation rdfs:subClassOf scobe:Benchmarking_project`). Elle n'est en revanche **jamais sujet** d'aucun triple dans aucun des deux fichiers : aucun `rdf:type`, aucun axiome propre. La formulation précédente (« n'existe nulle part », « 0 triple ») prêtait à confusion sur ce point ; corrigée.

**Exclusion du dessin principal** : la figure F3c ne représente plus ni la classe tierce `scobe:Benchmarking_project` ni la flèche `rdfs:subClassOf`. Un encart rouge sur `SCORPerformanceEvaluation` signale le point de vigilance et renvoie à la note technique, sans présenter l'alignement comme une spécialisation validée. L'axiome historique complet (IRI exacte, ligne, comparaison avec `Benchmarking_Project` réellement déclarée dans SCOBE.owl) reste fidèlement conservé dans la note interne.

## 5. Contrôle visuel du lot complet

F3a recontrôlée : aucune flèche ne masque de libellé, hiérarchie `MappingRule` clairement séparée des encadrés de commentaire documentaire (fond gris, bordure différente des boîtes de classe). F2, F2c, F3b, F3c vérifiées après restructuration : plusieurs corrections de routage appliquées en cours de production (label `producesIndicator`/`hasObservationContext` déplacés hors des titres de bande en F2c ; arc `contributesToEvaluation` reroutée hors de la boîte `Agility` et chemin `producesEvaluation` reroutée hors de la boîte `Reliability` en F3c) — détail par figure dans `registre_figures.md`.

## 6. Périmètre scientifique préservé

AHP : aucune mention, dans aucune figure ni légende (vérifié pour les sept figures). Distinction SVU Framework / Core maintenue (F2c, encart Module A renvoyant à F2b). Modules A-N vs regroupements conceptuels : rappelé explicitement dans chaque légende F2/F2c. TBox/ABox : non reposé ici (déjà traité étape 4/5, pas remis en cause par cette passe). Dépendances validées vs génération antérieure non revalidée : distinction renforcée par la séparation en trois boîtes dans F1 (section 1 ci-dessus). Aucun fichier `.ttl`/`.owl` original modifié.

---

## Livrables de cette passe

| Fichier | Contenu |
|---|---|
| `TABLE_CONTROLE_IMPORTS.md` | Table exhaustive des 12 `owl:imports`, conformité direction par direction |
| `LIVRABLE_SCONTO_SVU/figures/{svg,sources,png}/F1...F3c` | Sept figures corrigées (voir détail dans `registre_figures.md`) |
| `LIVRABLE_SCONTO_SVU/figures/PREUVE_RENDU_A4.pdf` | Preuve de rendu A4 reproductible, 7 figures + page d'introduction |
| `LIVRABLE_SCONTO_SVU/figures/registre_figures.md` | Mis à jour pour le lot de sept figures |
| `LIVRABLE_SCONTO_SVU/NOTE_TECHNIQUE_ANOMALIE_SCOBE.md` | Précision sujet/objet corrigée ; traitement d'exclusion mis à jour |
| `LIVRABLE_SCONTO_SVU/figures/sources/F1_organisation_generale.dot` | Source Graphviz remise en cohérence avec le sens d'import corrigé |

Aucune ontologie modifiée. Aucune figure des autres extensions commencée. Rédaction du chapitre non engagée.
