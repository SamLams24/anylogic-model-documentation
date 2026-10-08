# Étape 6 (partie 1) — Finalisation du premier lot graphique

Dernière passe de corrections graphiques sur le lot de sept figures, avant l'engagement de la rédaction scientifique de la section 3.5 (partie 2 de l'étape 6, traitée séparément). Revue des cinq figures signalées comme contenant des annotations sous 8 pt (F1, F2, F2c, F3b, F3c) et des deux défauts de routage nommés (F2c, F3c). Aucun fichier ontologique original modifié ; aucune figure des autres extensions engagée ; la rédaction du chapitre n'a pas commencé.

## 1. Remontée des annotations sous le seuil de 8 pt

Toutes les tailles de police sous 8 pt relevées dans F1 (6 pt), F2 (6,5 pt), F2c (6,5 pt), F3b/F3c (6,3 pt) ont été portées à 8 pt ou plus. Les notes de source secondaires (« Source : SCONTO_SVU_Core_v4.3.0.ttl… ») ont été retirées du corps des cinq dessins ; le contenu essentiel (fichier source, figure précédente/suivante) reste accessible dans le registre et, pour F3c, dans l'encadré Légende. Vérification automatique après coup (balayage des attributs `font-size` des cinq fichiers SVG) : taille minimale 8,0 pt dans chacun, aucune occurrence résiduelle sous ce seuil.

## 2. Défauts de routage nommés, corrigés

- **F2c — `producesIndicator` traversait le titre « Bande 4 »** : flèche reparcourue au-dessus du titre (jonction à `y = 70`, avant `y = 90` où commence le titre), libellé replacé hors de l'angle de la flèche. Sémantique OWL inchangée (même propriété, mêmes classes reliées).
- **F3c — `producesEvaluation` traversait l'encadré gris d'explication** : connecteur pointillé reparcouru pour passer sous l'encadré (`y = 250`, après le bas de l'encadré à `y = 238`) plutôt qu'à travers son coin inférieur gauche. Sémantique OWL inchangée.

## 3. Encart SCOBE retiré du dessin principal de F3c

L'encart rouge pleine largeur (« ⚠ Alignement SCOBE non représenté ici — volontairement exclu ») est remplacé par un renvoi `(¹)` en exposant sur le titre de la boîte `SCORPerformanceEvaluation`. La note complète (deux lignes, même contenu que l'ancien encart) est déplacée dans l'encadré Légende de la figure, avec renvoi explicite à `NOTE_TECHNIQUE_ANOMALIE_SCOBE.md`. Le dessin scientifique reste concentré sur les concepts correctement établis ; l'anomalie demeure documentée et n'est à aucun moment présentée comme une spécialisation validée. `NOTE_TECHNIQUE_ANOMALIE_SCOBE.md` mise à jour en conséquence (§ sur le traitement graphique). `viewBox` de F3c réduite de 620 u à 580 u après reflux du contenu.

## 4. Défauts supplémentaires trouvés pendant la relecture visuelle du rendu PNG (3x)

Le relèvement des tailles de police et le retrait de l'encart SCOBE ont chacun déplacé des éléments voisins ; la relecture visuelle systématique de chacune des cinq figures (rendu Chromium headless, inspection page à page) a fait apparaître cinq défauts non listés explicitement dans la consigne, corrigés par cohérence avec elle (« vérifie le résultat en PNG ») :

| Figure | Défaut constaté | Correction |
|---|---|---|
| F1 | La note du bloc « Génération antérieure », repassée à 8 pt, dépassait le bord droit de la `viewBox` (texte tronqué à l'affichage) | Reformulée plus courte, tient entièrement dans son encadré |
| F2c | Note « VSMIndicator : 30+ spécialisations… » traversée sur toute sa largeur par le connecteur vertical `measuredBy` | Scindée en deux fragments de part et d'autre du connecteur |
| F2c | Note « CorrespondenceRule, NormalizationRule : autres classes du Module J » traversée par le connecteur `producesMetric` | Scindée de la même façon |
| F3c | Libellé vertical `producesEvaluation (voie directe, depuis N1)`, pivoté à -90°, dépassait le haut de la `viewBox` (texte tronqué à l'affichage) | Raccourci à `producesEvaluation` seul (l'explication complète reste en légende), recentré sur son couloir |
| F3c | Texte de la boîte pointillée « Métriques SCOR (N1/N2/N3/Composite) — cf. Figure 3b » débordant largement de son cadre, empiétant sur la boîte « N1 » voisine | Raccourci à « Métriques SCOR (N1/N2/N3/Composite) » |

Aucun de ces cinq défauts ne modifie une relation, un nom de classe ou de propriété ; il s'agit uniquement de mise en page.

## 5. Validation PDF réelle et reproductible (refaite)

`PREUVE_RENDU_A4.pdf` recompilé à partir des PNG finaux de cette passe (`pdflatex`, `geometry[showframe]`, une figure par page en `\includegraphics[width=\textwidth]`, précédées d'une page d'introduction). Journal de compilation vérifié : **zéro avertissement `Overfull`/`Underfull \vbox`** après correction d'un artefact sans rapport avec le contenu des figures (indentation de paragraphe standard LaTeX ajoutant l'équivalent de l'alinéa par défaut devant chaque `\includegraphics` placé en début de paragraphe — corrigé par `\noindent`, sans aucune incidence sur les figures elles-mêmes). Les 8 pages relues visuellement : chaque figure et sa légende restent entièrement à l'intérieur du cadre imprimable affiché par `showframe`, texte lisible à l'échelle réelle.

## 6. Périmètre scientifique préservé

AHP : aucune mention, dans aucune figure ni légende (revérifié sur les sept figures). Distinction SVU Framework / Core maintenue. Modules A-N vs regroupements conceptuels en bandes : rappelé dans les légendes F2/F2c. Dépendances validées vs génération antérieure non revalidée : distinction maintenue dans F1. Aucun fichier `.ttl`/`.owl` original modifié. Aucune ontologie des autres extensions dessinée au-delà du périmètre déjà couvert (Agent/AER/ISA-95/Forecast-MTS apparaissent uniquement comme boîtes nommées dans F1, sans détail interne).

---

## Empreintes SHA-256 (sources SVG, rendus PNG, preuve PDF — état final de cette passe)

```
svg/F1_organisation_generale.svg       8fbce60e3b435fcf906799c9cfcfc5a909c7b70231a9d6ebc355be5572f464c1
svg/F2_concepts_core.svg               a02e8e6bab9a04d25935f7b684c5bedab9d6c991ee3549a5e7afebc655fdd3e5
svg/F2c_concepts_core_suite.svg        8eec8c6a81b0a4b00124fd23e5a3c1eb04c339d1fba5cc45f3c6250e8a1491ff
svg/F3b_chaine_valeur.svg              327603624b16ff95072c7d4c5e319645ed3c59d574284dfe65af81b280ebe5ea
svg/F3c_scores_attributs.svg           98976962be9586e3bc81238d27428ae88cb86a322d69639e3041e409456ee1e0

png/F1_organisation_generale.png       afbf9991e997aaea338e88d2a187656712756d044ac5395de7288b3ec8857562
png/F2_concepts_core.png               8266b3cd1fbeb9b3723dea310ea8fedc23851a23b55bac409f44e6633ffffc80
png/F2c_concepts_core_suite.png        7edaaa15d6585a3dcaae467326dd80e2b2ea7df50a57cad524096423326e0ed8
png/F3b_chaine_valeur.png              1912e2b9867abe74a5557ad6dd9719d5840b765cfb66a209a56b45e1faf2e3e8
png/F3c_scores_attributs.png           265867f1fc5eedff82689e09ea4e5dbb3714a99e6a2c41078c78f4127df926aa

PREUVE_RENDU_A4.pdf                    988d342ce4cb2620d35da623e1634bf587747ff60e7340d2b3913d757df07b71
```

(F2b et F3a, non modifiées à cette étape, conservent les empreintes publiées à l'étape 5 bis.)

---

## Livrables de cette passe

| Fichier | Contenu |
|---|---|
| `LIVRABLE_SCONTO_SVU/figures/{svg,sources,png}/F1, F2, F2c, F3b, F3c` | Cinq figures corrigées (police ≥ 8 pt, deux routages nommés, cinq défauts trouvés en relecture, encart SCOBE retiré) |
| `LIVRABLE_SCONTO_SVU/figures/PREUVE_RENDU_A4.pdf` | Preuve de rendu A4 recompilée, 7 figures + page d'introduction, zéro avertissement |
| `LIVRABLE_SCONTO_SVU/figures/registre_figures.md` | Mis à jour pour cette passe |
| `LIVRABLE_SCONTO_SVU/NOTE_TECHNIQUE_ANOMALIE_SCOBE.md` | § traitement graphique mis à jour (encart rouge → renvoi en légende) |

Aucune ontologie modifiée. Aucune figure des autres extensions engagée. Rédaction de la section 3.5 non commencée (objet de la partie 2 de l'étape 6, à traiter séparément).
