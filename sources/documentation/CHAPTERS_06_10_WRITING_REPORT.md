# Rapport de rédaction des chapitres 6 à 10

## Périmètre réalisé

Les cinq chapitres conceptuels de la partie II et III ont été rédigés intégralement:

1. les processus Plan, Source, Make, Deliver et Return;
2. agents, décisions et communications AER;
3. mesures VSM;
4. métriques, SCOR et Performance Index;
5. ISA-95, ontologie et traçabilité.

Ces chapitres ciblent des lecteurs académiques, analystes et développeurs, avec un niveau de technicité intermédiaire à avancé conforme à la matrice de rédaction. Aucun chapitre 1 à 5 ni 11 à 15 n'a été modifié pendant cette tranche.

## Sources utilisées

La rédaction s'appuie en priorité sur `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp`, sur le JSON courant `sources/model/scenario_ZENER_RETARD_FOURNISSEUR.json`, sur `sources/runs/vsm_validation/RUN_VERIFICATION.md` et `abox_final.ttl`, ainsi que sur `sources/VSM_FIX_IMPLEMENTATION.md`, `sources/MODEL_VERIFICATION.md` et `sources/SOURCE_REGISTER.md`. Les chapitres 3 à 10 du rapport scientifique consolidé ont servi de source secondaire vérifiée pour la formulation et la mise en contexte, notamment `03-architecture-agents.tex`, `04-execution-bout-en-bout.tex`, `05-adaptation-aer.tex`, `06-analyse-vsm.tex` et `07-scor-et-pi.tex`.

Le fichier candidat modifié localement par l'utilisateur, `sources/model/SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp`, n'a été ni lu comme source, ni modifié, ni ajouté à la tranche.

## Figures produites

Quinze figures nouvelles ont été créées par extension du générateur `documentation/scripts/generate_documentation_figures.ps1`:

| ID | Fichier | Type | Fonction |
|---|---|---|---|
| DOC-A12 | `workflow_scor.png` | Diagramme d'activité | Enchaînement Plan, Source, Make, Deliver, avec Return en branche disponible. |
| DOC-A13 | `graphe_micro_activites.png` | Graphe pédagogique | Extrait représentatif des prédécesseurs et jonctions, pas les 71 postes individuels. |
| DOC-A14 | `hierarchie_agents.png` | Hiérarchie | Cinq niveaux de décision et position du Blackboard. |
| DOC-A15 | `sequence_aer.png` | Diagramme de séquence UML | Six messages de la propagation du retard fournisseur. |
| DOC-A16 | `blackboard_tracabilite.png` | Diagramme d'activité | Chaîne événement, observation, partage, décision, instruction, exécution, compte rendu. |
| DOC-A17 | `ledger_vsm.png` | Ligne temporelle | Sept instants clés du run de validation. |
| DOC-A18 | `calcul_va_nva.png` | Diagramme de calcul | Construction du PCE estimé à partir du traitement, de l'attente et du taux VA. |
| DOC-A19 | `wip_debit_takt.png` | Schéma relationnel | WIP, débit observé et takt time lus ensemble. |
| DOC-A20 | `pipeline_scor_pi.png` | Diagramme d'activité | Pipeline central du chapitre, de la valeur physique au PI. |
| DOC-A21 | `echelle_bottom_perfect.png` | Échelle annotée | Principe Bottom/Perfect illustré avec CO.1.1. |
| DOC-A22 | `deux_usages_ahp.png` | Comparaison de flux | AHP local et PI global présentés comme deux chaînes disjointes. |
| DOC-A23 | `hierarchie_isa95.png` | Arbre hiérarchique | Six niveaux ISA-95 du modèle. |
| DOC-A24 | `affectations_isa95.png` | Diagramme de classes | Principe de la relation `executedAt`. |
| DOC-A25 | `tbox_abox_run.png` | Schéma de traçabilité | Articulation TBox, ABox et export Turtle d'un run. |

Toutes les figures ont été générées puis inspectées visuellement à la résolution native. Aucune capture d'écran n'a été utilisée ou inventée pour cette tranche: les cinq chapitres reposent exclusivement sur des schémas reproductibles et sur les preuves déjà archivées.

## Diagrammes UML produits

Deux diagrammes de séquence UML (`sequence_aer.png`, ainsi que la séquence déjà présente pour la sélection JSON n'entrant pas dans cette tranche), sept diagrammes d'activité (`workflow_scor.png`, `blackboard_tracabilite.png`, `calcul_va_nva.png`, `pipeline_scor_pi.png`, et les diagrammes déjà comptés dans les tranches précédentes), un graphe pédagogique, une ligne temporelle, un schéma relationnel, une échelle annotée, une comparaison de flux, un arbre hiérarchique et un diagramme de classes complètent le registre des chapitres 6 à 10.

## Valeurs runtime utilisées

Toutes les valeurs numériques proviennent du run de validation `RUN_1773129600000_1788264883846`, concordantes entre `results_final.xlsx` et `abox_final.ttl` selon `RUN_VERIFICATION.md`:

* Order Processing Time 18 116,83756052 s, Order Waiting Time 46 924,40300189 s, Order Fulfillment Lead Time 65 041,24056241 s, identité additive vérifiée;
* ZENER Process Time 59,38852156 s, ZENER Waiting Time 12,69587399 s, PCE estimé 0,70870898, soit environ 70,9 pour cent, qualifié `ESTIME`;
* scores d'attribut RL 7,5, RS 5,94733671, AG 4,73462025, CO 0, AM 9,70588235, poids 0,40/0,20/0,10/0,15/0,15, PI 6,11881172/10;
* métriques macro RS.2.1 1,60096154 s, RS.2.2 26,0695401 s, RS.2.3 67,12341232 s, RS.2.5 absente car Return non exécuté;
* débit observé 1,536 entité par heure et proxy d'utilisation système 0,134 pour Agility;
* score AHP local de 0,730 pour le goulot détecté sur `sM1.3.1`, décision `REBALANCE`;
* structure ISA-95: 190 noeuds, 71 affectations, garde vérifiée dans l'ALP et dans l'ABox du run.

## Distinctions importantes conservées

Le PCE ZENER reste qualifié `ESTIME` partout où il apparaît, avec la réserve sur les taux de valeur ajoutée configurés. Le PI est systématiquement présenté avec la formulation imposée: « avec les profils de normalisation retenus par le modèle, cette exécution conduit à un PI de 6,119/10 », jamais comme une performance réelle de l'entreprise. L'AHP local et le PI sont présentés comme deux mécanismes distincts, sans lien causal démontré, y compris dans la figure dédiée. `CO.1.1` est explicitement décrit comme un ratio coût sur chiffre d'affaires, pas comme un taux de livraison. La structure ISA-95 de 190 noeuds et 71 affectations est qualifiée comme propriété du modèle configuré, pas comme un inventaire d'équipements physiques observés. AER n'est développé nulle part autrement que par la formulation autorisée: classification des communications selon les phases AMENDMENT, EXECUTION et REPORT.

## Bibliographie utilisée

Aucun mécanisme `\cite` ou `\bibliography` n'existe dans le rapport scientifique ni dans la documentation actuelle; la tranche n'introduit donc pas d'infrastructure bibliographique nouvelle et reprend la convention existante de mention en texte courant. La méthode de construction du PI est qualifiée d'adaptation interne inspirée notamment de Chan et Qi ainsi que de Theeranuphattana et Tang, une attribution corroborée par les commentaires du code source de l'ALP validé, qui nomme explicitement ce cadre à plusieurs reprises, par exemple aux lignes 12555, 14579 et 22513. Zadeh est cité comme référence fondatrice de la logique floue mobilisée par l'agrégation des attributs. SCOR version 12,0 et APICS 2017 sont mentionnés comme référentiel de numérotation des métriques, avec la réserve explicite que le modèle ne prétend pas implémenter le SCOR Digital Standard actuel. Saaty, Rother et Shook ne sont pas nommés explicitement dans le corps: l'AHP et la VSM sont décrits par leur fonctionnement dans le modèle plutôt que par un rattachement académique direct, faute d'occurrence vérifiée de ces noms dans les sources du projet.

## Limites

Un seul run de validation soutient l'ensemble des valeurs quantitatives citées dans ces cinq chapitres. Aucune réplication ni scénario de référence sans retard n'est disponible, ce qui interdit toute conclusion causale sur l'effet du retard fournisseur. Return, la panne machine, les perturbations de demande et la qualité avec défauts restent qualifiés `DISPONIBLE_NON_QUANTIFIE` partout où ils sont mentionnés. Le PCE ZENER reste une estimation dépendant de taux configurés, pas une mesure chronométrée. Les profils Bottom et Perfect ne sont pas calibrés sur des données terrain.

## Points nécessitant relecture humaine

La datation précise de SCOR version 12,0 et APICS 2017 n'a pas été retrouvée littéralement dans les fichiers du projet; elle a été retenue sur instruction explicite et reste à confirmer par un relecteur disposant du référentiel SCOR d'origine. La monnaie de la valeur d'actif fixe `AM.3.18`, 192 800 000, a été harmonisée en FCFA par cohérence avec les autres coûts du modèle plutôt qu'en euros, ce point mérite une vérification par un mainteneur du modèle. Le graphe pédagogique des micro-activités est un extrait volontairement simplifié et devra être confronté par un lecteur technique à la structure réelle des gammes s'il doit servir de base à un chapitre plus détaillé.

## Deux anomalies techniques identifiées et corrigées

Deux défauts de compilation ont été découverts pendant cette tranche et corrigés par des ajustements minimes, sans toucher au contenu rédactionnel des chapitres 1 à 5 ou 11 à 20.

Premièrement, la commande de compilation `xelatex -output-directory=documentation documentation/documentation.tex` produit un `\jobname` identique au nom du dossier de sortie (`documentation`). Cette coïncidence de nommage empêche `\newlabel` et `\ref`/`\cref` de se résoudre correctement pour toute référence croisée entre chapitres, même après un nombre arbitraire de passes XeLaTeX, alors que le fichier `.aux` produit est pourtant bien formé. Le contournement retenu pour cette tranche compile avec `-jobname=doc_build`, puis copie `doc_build.pdf` vers `documentation.pdf` avant de nettoyer les fichiers intermédiaires. Ce même contournement devra être reproduit pour les tranches suivantes tant que la cause exacte, probablement une ambiguïté de résolution de chemin propre à cette configuration MiKTeX, n'est pas définitivement corrigée à la source.

Deuxièmement, `cleveref` affichait le mot anglais « chapter » au lieu de « chapitre » pour toute référence de type chapitre, un défaut préexistant aux tranches précédentes qui n'était simplement jamais apparu dans le texte avant cette tranche. La cause est l'absence de `\crefname{chapter}{chapitre}{chapitres}` dans `documentation/preamble.tex`; l'ajout de six paires `\crefname`/`\Crefname` pour chapitre, partie, section, figure, tableau et équation corrige ce défaut pour l'ensemble du document, y compris les chapitres déjà rédigés.

## Pagination et compilation

Le PDF comptait 75 pages physiques avant cette tranche. Il en compte 88 après intégration, soit 13 pages physiques supplémentaires pour cinq chapitres et quinze nouvelles figures.

Le contrôle `python documentation/scripts/quality_check_documentation.py` réussit en mode fondation, sur 29 fichiers LaTeX, sans caractère U+2014, tiret long, métadiscours interdit ni jargon UI mal placé. Deux passes XeLaTeX, compilées avec le contournement de jobname décrit ci-dessus, produisent `documentation/documentation.pdf` sans avertissement, sans référence indéfinie et sans débordement (`overfull hbox`).
