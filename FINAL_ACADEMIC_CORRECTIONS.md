# Corrections académiques finales

## Périmètre

Ce rapport suit les constats de `FINAL_EXAMINER_REVIEW.md`. Les résultats numériques, le modèle ALP, les exports Excel et les ABox n'ont pas été modifiés.

## Bloqueurs

Aucun bloqueur n'était recensé dans la revue initiale.

## Constats majeurs

1. Absence de bibliographie et de citations: `RESOLU`.

   Dix références primaires ont été ajoutées dans `references.tex`. Les citations couvrent SCOR v12, ISA-95, la VSM, l'EOQ, l'AHP, la théorie des ensembles flous et les approches de mesure intégrée de la performance. La bibliographie est placée après la conclusion et avant les annexes.

2. Reproductibilité du pipeline flou et provenance de `AG.1.1`: `ACCEPTE_AVEC_JUSTIFICATION`.

   Le chapitre 7 décrit la normalisation Bottom et Perfect, les six centres des grades, l'agrégation pondérée, la défuzzification et le calcul final du PI. Il distingue la théorie générale, les méthodes publiées et l'adaptation interne de SCONTO-SVU. Pour `AG.1.1`, le code établit un calcul fondé sur l'historique du débit avec un repli neutre à 0,5. L'export ne conserve pas la branche suivie. Cette absence de provenance runtime est désormais explicitement signalée dans le chapitre 7 et l'annexe D. Aucune validation quantitative supplémentaire n'est revendiquée.

3. Identification académique de la page de garde: `RESTE_OUVERT`.

   Le dépôt ne fournit pas de données fiables sur l'auteur, l'établissement, la formation ou le diplôme, l'encadrement et l'année académique. Ces éléments n'ont pas été inventés. La page de garde doit être complétée après réception du canevas et des informations institutionnelles.

## Constats mineurs

1. Date de remise: `RESTE_OUVERT`.

   La date affichée reste « Août 2026 ». Le contexte disponible ne permet pas d'établir qu'elle doit être remplacée par septembre 2026. Statut interne: `DATE_A_CONFIRMER`.

2. Liste des sigles incomplète: `RESOLU`.

   ISA-95, RDF, GPL, CMD, REAPPRO, RL, RS, AG, CO et AM ont été ajoutés. La largeur des libellés a été ajustée pour préserver leur lisibilité.

3. Catégorie de `MaterialAvailable` dans la figure 4.1: `RESOLU`.

   La figure a été régénérée par `scripts/generate_evidence_figures.ps1`. `MaterialAvailable` possède désormais une catégorie visuelle et une légende propres aux messages de disponibilité.

## Contrôles

- Contrôle de qualité: réussi, aucune occurrence bloquante.
- Compilation: deux passes XeLaTeX réussies après la dernière modification.
- Citations indéfinies: 0.
- Références bibliographiques: 10, toutes citées.
- PDF: 39 pages au format A4.
- Revue visuelle: liste des sigles, figure 4.1, chapitre 7, bibliographie et annexe D contrôlés.
- Valeurs probatoires: inchangées.

## Verdict après corrections

`CORRECTIONS_MAJEURES_REQUISES`

La bibliographie, la méthode du PI et les trois corrections techniques documentaires sont traitées. La page de garde demeure un constat majeur ouvert tant que les données institutionnelles ne sont pas fournies. La date officielle de remise reste également à confirmer.
