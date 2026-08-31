# QA_CHECKLIST.md

## Vérification scientifique
- [ ] Chaque chiffre est rattaché à une source identifiable.
- [ ] Les fichiers comparés appartiennent au bon run ou sont explicitement présentés comme runs différents.
- [ ] Les métriques SCOR officielles sont distinguées des proxies internes.
- [ ] Les causalités décrites apparaissent dans les traces ou sont qualifiées comme interprétations.
- [ ] Les limites de stochasticité sont mentionnées lorsqu'elles affectent une comparaison.
- [ ] Aucune ancienne valeur n'est utilisée comme résultat actuel sans justification.

## Vérification rédactionnelle
- [ ] Aucun caractère de tiret long interdit.
- [ ] Aucun `---` ou `--` utilisé pour produire un tiret typographique.
- [ ] Aucun commentaire sur la collaboration, les corrections précédentes ou une IA.
- [ ] Aucun paragraphe ne répète simplement le tableau adjacent.
- [ ] Les phrases n'ont pas toutes la même structure.
- [ ] Les formulations creuses ont été supprimées.
- [ ] Les transitions sont motivées par le raisonnement, pas ajoutées mécaniquement.
- [ ] Les termes techniques sont constants.

## Vérification structurelle
- [ ] Le corps principal reste centré sur les résultats et leur interprétation.
- [ ] Les preuves exhaustives sont dans les annexes.
- [ ] Les figures du corps principal sont peu nombreuses et probantes.
- [ ] Les références croisées fonctionnent.
- [ ] La table des matières correspond au contenu réel.
- [ ] La liste des figures et la liste des tableaux sont à jour.

## Vérification LaTeX
- [ ] `python scripts/quality_check.py` passe sans erreur.
- [ ] XeLaTeX compile sans erreur bloquante.
- [ ] Aucun `??` de référence n'apparaît dans le PDF.
- [ ] Aucun tableau ou figure ne déborde de manière significative.
- [ ] Les images manquantes attendues utilisent le placeholder prévu.
- [ ] Les annexes démarrent correctement après `\appendix`.
