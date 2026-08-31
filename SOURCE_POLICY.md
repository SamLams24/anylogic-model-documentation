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

## Règles en cas de conflit

1. Deux fichiers d'un même run doivent être rapprochés par `runId`.
2. Une valeur issue d'un ancien run ne doit pas être utilisée pour commenter un nouveau scénario sans l'indiquer clairement.
3. Une valeur absente d'une source ne doit pas être reconstruite à partir d'une intuition.
4. Un mécanisme visible dans le code mais non démontré par un run doit être présenté comme `implémenté` ou `prévu`, pas comme `observé`.
5. Un comportement observé dans un run ne doit pas être généralisé à tous les runs sans campagne comparative.
6. Les proxies internes doivent être nommés comme tels.

## Registre de sources
Mettre à jour `sources/SOURCE_REGISTER.md` à chaque ajout d'un fichier de preuve. Pour chaque fichier, noter : nom, type, runId si applicable, rôle, chapitre concerné et statut de validation.
