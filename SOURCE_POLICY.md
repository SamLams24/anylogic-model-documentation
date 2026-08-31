# SOURCE_POLICY.md

## Hiérarchie des preuves

### Niveau 1 : preuves runtime
Priorité maximale :

- exports Excel de clôture ;
- ABox TTL portant le même `runId` ;
- traces `Propagation agents et flux` ;
- `Execution Brute` ;
- tableaux KPI ;
- pipeline SCOR vers PI ;
- audit AER ;
- modèle ALP et configuration JSON lorsqu'une logique doit être vérifiée.

### Niveau 2 : document de base
`sources/base_document_extrait.md` sert à récupérer la matière déjà rédigée, les tableaux, les termes et la structure historique. Il ne doit pas être traité comme preuve supérieure à un export runtime.

### Niveau 3 : références académiques et normatives
Les définitions VSM, SCOR, AHP, fuzzy logic et méthodes d'agrégation doivent provenir de références réelles et vérifiables. Ne jamais inventer une référence bibliographique, un DOI, une année ou une pagination.

## Statuts probatoires obligatoires

La nature de la source et le statut probatoire sont deux informations distinctes. Toute affirmation technique ou expérimentale doit recevoir l'un des statuts suivants :

1. `IMPLEMENTE` : mécanisme confirmé dans le modèle ALP ou sa configuration, sans preuve nécessaire d'une exécution donnée. La rédaction emploie « Le modèle permet » ou « Le modèle implémente ».
2. `OBSERVE_SECONDAIRE` : résultat ou comportement décrit par un document historique, `MODEL_EVOLUTION.md` ou une autre source secondaire, mais dont l'artefact runtime primaire n'est pas disponible dans `sources/`. La rédaction emploie « Une exécution antérieure documentée fait apparaître » ou « Le document de référence rapporte ».
3. `VALIDE_EXPERIMENTALEMENT` : résultat vérifié directement dans un artefact primaire identifié. Le scénario et, lorsqu'il existe, le `runId` sont indiqués. La rédaction peut employer « L'exécution montre », « Les résultats mesurés indiquent » ou « La trace confirme ».
4. `DISPONIBLE_NON_VALIDE` : capacité activable sans validation expérimentale suffisante. La rédaction emploie « Cette capacité est prévue pour » ou « Le mécanisme peut être activé », sans conclusion quantitative.

Un résultat ne reçoit le statut `VALIDE_EXPERIMENTALEMENT` qu'après vérification de l'artefact primaire, calcul de son SHA-256 et inscription dans `sources/SOURCE_REGISTER.md`. Le statut `IMPLEMENTE` ne vaut pas validation expérimentale. Le statut `OBSERVE_SECONDAIRE` ne devient pas expérimental par répétition dans plusieurs documents secondaires.

## Règles en cas de conflit

1. Deux fichiers d'un même run doivent être rapprochés par `runId`.
2. Une valeur issue d'un ancien run ne doit pas être utilisée pour commenter un nouveau scénario sans l'indiquer clairement.
3. Une valeur absente d'une source ne doit pas être reconstruite à partir d'une intuition.
4. Un mécanisme visible dans le code mais non démontré par un run reçoit le statut `IMPLEMENTE`, pas `VALIDE_EXPERIMENTALEMENT`.
5. Un comportement observé dans un run ne doit pas être généralisé à tous les runs sans campagne comparative.
6. Les proxies internes doivent être nommés comme tels.

## Conditions de promotion d'un statut

Le passage de `OBSERVE_SECONDAIRE` ou `DISPONIBLE_NON_VALIDE` à `VALIDE_EXPERIMENTALEMENT` exige un artefact primaire lisible, un scénario identifié, un `runId` lorsqu'il existe, un contrôle de cohérence des timestamps et un lien explicite entre la valeur publiée et sa feuille, sa trace ou son individu ABox. Une paire Excel et ABox n'est dite synchronisée qu'après rapprochement du `runId` et de l'instant de clôture.

## Registre de sources
Mettre à jour `sources/SOURCE_REGISTER.md` à chaque ajout d'un fichier de preuve. Pour chaque fichier, noter au minimum : identifiant interne, chemin, nom original, nature, scénario, `runId` si applicable, rôle probatoire, statut de vérification, SHA-256 et chapitres autorisés. Un artefact attendu mais absent porte explicitement la valeur `ABSENT_A_FOURNIR`.
