# AGENTS.md

## Mission
Ce dépôt contient la version LaTeX finale du document SCONTO-SVU appliqué à ZENER SA Togo. La mission est de produire un rapport technique et académique professionnel, lisible, traçable et directement soutenu par les preuves du modèle et des exports runtime.

Le document ne doit jamais donner l'impression d'un texte produit à partir d'un gabarit automatique. La priorité est la précision technique, la cohérence du raisonnement, la sobriété de la rédaction et la vérifiabilité des faits.

## Fichiers à lire avant toute modification
Avant de modifier le document, lire dans cet ordre :

1. `PROJECT_BRIEF.md`
2. `STYLE_GUIDE.md`
3. `SOURCE_POLICY.md`
4. `MODEL_EVOLUTION.md`
5. `DOCUMENT_PLAN.md`
6. `QA_CHECKLIST.md`
7. `sources/base_document_extrait.md`

Si des exports Excel, ABox TTL, JSON, ALP ou autres preuves sont ajoutés dans `sources/`, les analyser avant de modifier un passage qui dépend de leurs résultats.

`MODEL_EVOLUTION.md` est une contrainte de couverture fonctionnelle. Lors de toute restructuration, vérifier que les fonctionnalités consolidées qui y sont recensées conservent une destination claire dans le rapport ou les annexes.

## Règles impératives de rédaction

1. Ne jamais inventer un résultat, un timestamp, une métrique, un rôle d'agent, une causalité, une référence SCOR ou une valeur de PI.
2. En cas de conflit entre un ancien texte et un export runtime vérifiable, l'export runtime prévaut.
3. Ne jamais intégrer dans le rapport des éléments de conversation, de processus de correction, de collaboration avec une IA, de version intermédiaire ou de commentaire adressé à l'auteur.
4. Écrire en français académique et technique, avec des phrases naturelles. Éviter les formulations mécaniques et les paragraphes construits selon le même patron.
5. Le caractère U+2014 est interdit dans tout fichier LaTeX destiné au rendu. Les séquences LaTeX produisant un tiret long sont également interdites. Utiliser une virgule, un point, deux-points, un point-virgule ou reformuler la phrase.
6. Ne pas utiliser `---`, `--`, `\textemdash`, `\textendash`, `\emdash` ou `\endash` dans le texte narratif.
7. Les mots composés légitimes avec un tiret simple restent autorisés, par exemple `SCONTO-SVU`, `Make-to-Stock`, `multi-agents` si nécessaire.
8. Ne pas répéter un tableau en prose. La prose doit expliquer ce que le tableau permet de comprendre.
9. Ne pas multiplier les listes. Préférer des paragraphes structurés et des tableaux lorsque plusieurs faits doivent être comparés.
10. Les noms techniques stables ne doivent pas être remplacés par des synonymes stylistiques. Conserver `Source`, `Make`, `Deliver`, `AER`, `VSM`, `SCOR`, `PI`, les identifiants d'agents et les identifiants de postes.
11. Une section doit répondre à une question précise. Supprimer tout passage qui ne contribue pas à cette question.
12. Éviter les annonces de plan répétitives telles que « dans cette section, nous allons », « il convient de noter », « il est important de souligner », « on peut constater que ».
13. Éviter les conclusions artificielles à la fin de chaque sous-section. Conclure seulement lorsqu'une interprétation utile est nécessaire.
14. Ne pas présenter une association ou un proxy interne comme une métrique SCOR officielle.
15. Toute limitation de preuve doit être dite simplement, sans surjustification.

## Règles LaTeX

1. Compiler avec XeLaTeX.
2. Le point d'entrée est `main.tex`.
3. Ne pas modifier les polices et règles typographiques définies dans `preamble.tex` sans raison explicite.
4. Les chapitres sont placés dans `chapters/`, les annexes dans `appendices/`, les images dans `figures/` et les sources dans `sources/`.
5. Toutes les figures doivent utiliser `\FigureOrPlaceholder` jusqu'à ce que le fichier image existe. Le document doit compiler même si une image manque.
6. Chaque figure et tableau doit avoir une légende informative et un label stable.
7. Les tableaux trop longs doivent utiliser `longtable`, `tabularx` ou une annexe. Ne jamais réduire la police au point de nuire à la lecture.
8. Les valeurs numériques, unités et symboles doivent être cohérents dans tout le document.
9. Aucun élément visuel décoratif ne doit être ajouté s'il n'apporte pas de preuve ou d'aide à la compréhension.
10. Ne pas utiliser de packages LaTeX supplémentaires sans nécessité claire.

## Méthode de travail attendue

Pour chaque chapitre :

1. Identifier les faits établis dans les sources.
2. Distinguer faits, interprétation et limite méthodologique.
3. Réécrire le chapitre en supprimant les redondances avec les autres chapitres.
4. Déplacer en annexe les détails de preuve qui cassent la continuité du texte principal.
5. Vérifier les références croisées, tableaux, figures et unités.
6. Exécuter `python scripts/quality_check.py`.
7. Compiler avec `latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex` si `latexmk` est disponible, sinon compiler deux fois avec XeLaTeX.
8. Corriger tous les avertissements significatifs liés aux références, figures manquantes inattendues ou débordements importants.

## Contrôle final obligatoire

Avant de déclarer une tâche terminée :

- exécuter `python scripts/quality_check.py` ;
- vérifier qu'aucun caractère interdit n'existe ;
- vérifier qu'aucun marqueur `TODO`, `FIXME`, `CAPTURE À INSÉRER`, `à actualiser`, `version de travail` ou commentaire conversationnel ne subsiste dans la version destinée au rendu final ;
- compiler le document ;
- vérifier la table des matières, la liste des figures, la liste des tableaux et les annexes ;
- vérifier que chaque conclusion est soutenue par les sources disponibles.
