# Rapport de rédaction des chapitres 16 à 20

## Périmètre réalisé

Les cinq derniers chapitres du corps principal ont été rédigés intégralement, achevant ainsi la rédaction complète des vingt chapitres:

1. comprendre les vues et les tableaux de bord;
2. lire, exporter et archiver les résultats;
3. reproduire un scénario;
4. contrôles et validation;
5. maintenance et extension du modèle.

Les fichiers squelettes existants ont été conservés sous leurs noms d'origine (`16-vues-tableaux.tex`, `17-resultats-exports.tex`, `18-reproduire.tex`, `19-controles-validation.tex`, `20-maintenance-extension.tex`), sans création de doublon. Les notes internes de fondation ont été retirées.

## Sources utilisées

La source modèle reste `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp`, complétée par `UI_INVENTORY.md` pour la description des huit vues, `sources/runs/vsm_validation/RUN_VERIFICATION.md` et `results_final.xlsx` pour les valeurs et feuilles réellement produites par le run de validation, `MODEL_EVOLUTION.md` pour les invariants et la politique de compatibilité JSON, `MODEL_VERIFICATION.md` pour les exemples de statuts probatoires, et les chapitres 8 à 10 du rapport scientifique consolidé pour la portée et les limites de la campagne de validation.

Le fichier candidat modifié localement par l'utilisateur n'a été ni lu comme source, ni modifié, ni ajouté à la tranche. Les fichiers non suivis de `sources/model/` ont fait l'objet d'un audit en lecture seule décrit plus bas, sans modification.

## Chapitre 16: vues et tableaux de bord

Le chapitre traite sept vues sans répéter le chapitre 11, qui explique où aller, ni les chapitres 12 et 13, qui détaillent déjà Configuration et Nomenclature. Chaque vue suit une progression naturelle plutôt qu'un gabarit rigide à six questions systématiques. La distinction entre cadence visuelle de l'animation et durée métier est rappelée explicitement pour la vue Structure animée, avec renvoi vers la fenêtre Animation du chapitre 15. Le suivi temps réel est confirmé comme fenêtre complémentaire, pas comme neuvième vue.

## Chapitre 17: résultats et exports

Le chapitre organise les sorties par besoin utilisateur plutôt que par écran, avec un tableau de correspondance question-vers-sortie et un tableau distinguant JSON, Excel, CSV, ABox et journal par ce qu'ils contiennent, à quoi ils servent et ce qu'ils ne prouvent pas seuls. La liste des feuilles Excel mentionnées, manifeste de run, performance par produit, acteurs, micro-activités, responsabilités, machines, KPI par poste, exécution brute, traces agrégées, dashboards micro, macro et global, pipeline SCOR vers PI, traçabilité de performance, couverture des métriques SCOR, validation croisée, catalogue SCOR, métriques calculables, flux de la chaîne logistique, propagation entre agents et décisions holoniques, a été vérifiée directement contre les 25 feuilles du classeur `results_final.xlsx`.

## Chapitre 18: reproduire un scénario

Une procédure numérotée en douze étapes couvre la chaîne complète, du modèle source à la vérification finale, en restant dans la fourchette indicative de 8 à 12 étapes. Les limites de reproductibilité, graine inaccessible depuis `Main`, SHA du JSON non exporté automatiquement, absence de réplication statistique, sont rappelées sans promettre une répétabilité bit à bit. Le manifeste du run de validation illustre les champs à conserver sans être recopié intégralement.

## Chapitre 19: contrôles et validation

Les statuts documentaires déjà utilisés dans le reste du guide, `IMPLEMENTE`, `OBSERVE_RUNTIME`, `VALIDE_EXPERIMENTALEMENT`, `DISPONIBLE_NON_QUANTIFIE` et `PCE_ESTIME`, sont présentés dans un tableau unique, sans création de nouveau statut. Les quatre familles de contrôle, structurel, fonctionnel, calculatoire et ontologique, sont illustrées chacune par un exemple réel tiré du modèle ou du run. Quatre exemples au total, ISA-95, CMD/REAPPRO, PCE et Return, évitent la surenchère d'exemples demandée par la tranche.

## Chapitre 20: maintenance et extension

Le chapitre s'adresse aux mainteneurs sans perdre en lisibilité générale. Onze invariants sont réunis dans un tableau unique plutôt que dispersés en prose. Le cycle de maintenance recommandé, modifier, compiler, tester, exécuter, exporter, vérifier, documenter, est présenté en sept étapes avec son diagramme. La section sur la compatibilité JSON décrit le comportement actuel du chargeur, tolérance de version, replis documentés, blocs optionnels, sans inventer de stratégie de versioning non implémentée.

## Figures générées

Six nouvelles figures ont été produites par extension de `documentation/scripts/generate_documentation_figures.ps1` et inspectées visuellement:

| ID | Fichier | Type | Chapitre |
|---|---|---|---|
| DOC-A31 | `pipeline_exports.png` | Diagramme d'activité | 17 |
| DOC-A39 | `artefacts_et_preuves.png` | Schéma relationnel | 17 |
| DOC-A33 | `reproduire_scenario.png` | Diagramme d'activité | 18 |
| DOC-A34 | `niveaux_validation.png` | Chaîne de preuve | 19 |
| DOC-A35 | `cycle_maintenance.png` | Diagramme d'activité | 20 |
| DOC-A40 | `invariants_modele.png` | Schéma conceptuel | 20 |

`DOCUMENTATION_ILLUSTRATION_PLAN.md` a été mis à jour en conséquence, y compris la correction des chemins `DOC-B16` à `DOC-B19` vers `figures/screenshots/`, qui ne correspondaient plus à l'emplacement réel des captures d'interface.

## Captures utilisées et achèvement de la campagne

Deux captures déjà validées ont été réutilisées avec un nouveau label pour éviter tout doublon d'étiquette LaTeX: `ui_logistique.png` au chapitre 16, pour la lecture du réseau plutôt que sa saisie, et `ui_suivi_temps_reel.png`, déjà utilisée au chapitre 15.

Le chapitre 16 a d'abord été rédigé avec quatre nouvelles captures requises marquées `CAPTURE_A_FAIRE`: `ui_execution.png`, `ui_vue_globale.png`, `ui_hierarchie.png` et `ui_structure_animee.png`. Pendant cette même tranche, l'utilisateur a déposé neuf fichiers réels directement dans `documentation/figures/` plutôt que dans `documentation/figures/screenshots/`: les quatre captures du chapitre 16 ci-dessus, ainsi que les cinq dernières captures encore manquantes des tranches précédentes, `ui_responsabilites_machines.png` (chapitre 12), `ui_json_charge.png` (chapitre 14), `ui_controle_commandes.png`, `ui_temps_budgets.png` et `ui_perturbations.png` (chapitre 15).

Les neuf fichiers ont été inspectés un par un: vue correcte, aucune donnée personnelle ou chemin sensible visible, lisibilité suffisante. Ils ont ensuite été déplacés vers `documentation/figures/screenshots/`, vérifiés octet par octet après copie, et les cinq légendes encore au stade « Emplacement prévu » ont été reformulées en conséquence. `ui_responsabilites_machines.png` montre un formulaire vide plutôt que des acteurs et postes déjà chargés; les champs et commandes restent tous lisibles, ce qui satisfait l'exigence de la checklist, mais ce point reste à noter pour une éventuelle recapture plus illustrative.

Cette intégration porte la campagne de captures des chapitres 11 à 16 à son terme: les 25 entrées correspondantes de `UI_CAPTURE_CHECKLIST.md` sont désormais `VALIDE`, et le document compilé ne contient plus aucun placeholder `FigureOrPlaceholder`. Le chapitre 17 ne requiert aucune capture dans le corps de cette tranche, les diagrammes `pipeline_exports.png` et `artefacts_et_preuves.png` étant jugés suffisants; quatre candidats optionnels, `ui_dashboard_global.png`, `ui_resultats_processus.png`, `ui_decisions_agents.png` et `ui_tracabilite.png`, restent `CAPTURE_A_FAIRE` dans `UI_CAPTURE_CHECKLIST.md` pour une tranche future, non embarqués dans le corps du chapitre.

## Preuves runtime utilisées

Le manifeste du run `RUN_1773129600000_1788264883846` illustre le chapitre 18. Les statuts et exemples du chapitre 19 reprennent la structure ISA-95 à 190 noeuds et 71 affectations, la relation `CMD_1`/`REAPPRO_1`, le PCE ZENER estimé et la non-exécution de Return, tous déjà établis et sourcés dans les chapitres 6 à 10. Les 25 feuilles du classeur `results_final.xlsx` ont été listées par lecture directe du classeur plutôt que par supposition.

## Audit des artefacts locaux

`sources/documentation/MODEL_LOCAL_ARTIFACT_AUDIT.md` a été créé. Il examine, sans les modifier, `SCONTO_SVU_FINAL_VALIDATED.alp.autosave` et 28 fichiers PNG non suivis de `sources/model/`. Vingt-cinq fichiers PNG correspondent chacun à un bloc `<Resource>` du fichier ALP validé, avec `Location=FILE_SYSTEM` et une référence `<ImageResourceReference>` du paquetage `sconto_vsm_generic`; ils sont qualifiés `RESSOURCE_MODELE_PROBABLE`. Trois fichiers, `control-system.png`, `industrial-revolution.png` et `packages.png`, ne correspondent à aucune occurrence exacte dans l'ALP et sont qualifiés `NON_REFERENCE`. Le fichier `.autosave` est qualifié `TEMPORAIRE_PROBABLE`, sa comparaison avec le fichier validé ne révélant que dix lignes de différence sur l'ensemble du document. Aucun fichier n'a été supprimé, déplacé ou stagé.

## Deux défauts transversaux corrigés

Cette tranche a révélé un second angle mort de la configuration cleveref déjà partiellement corrigée lors de la tranche précédente: les mots de liaison anglais utilisés par les références multiples, « and » entre deux chapitres et « to » dans une plage de chapitres consécutifs, n'étaient pas traduits malgré les `\crefname` déjà en place. Quatre commandes ont été ajoutées à `documentation/preamble.tex`, `\crefrangeconjunction`, `\crefpairconjunction`, `\crefmiddleconjunction` et `\creflastconjunction`, définies via `\providecommand` puis `\renewcommand` pour fonctionner que la commande existe déjà ou non dans cette configuration. Ce défaut affectait aussi une référence déjà présente dans l'annexe E depuis une tranche précédente (« chapitres 11 to 15 », devenu « chapitres 11 à 15 »).

Une seconde erreur, un doublon d'étiquette LaTeX entre le chapitre 12 et le chapitre 16 pour `ui_responsabilites_machines.png`, a été détectée par le compilateur lui-même (avertissement « Label multiply defined ») et corrigée en distinguant les deux occurrences.

## Limites

Les statuts et exemples du chapitre 19 reposent, comme les chapitres précédents, sur une seule exécution primaire archivée. Le chapitre 20 décrit le comportement actuel du chargeur JSON, pas une politique de versioning formalisée par le projet. Les quatre captures optionnelles du chapitre 17 restent à réaliser si une tranche future souhaite illustrer les tables de résultats individuellement plutôt que par les diagrammes déjà fournis.

## Pagination et compilation

Le PDF comptait 90 pages physiques avant cette tranche. Il en compte 102 après intégration des cinq chapitres, des six nouvelles figures et des neuf captures réelles déposées en cours de tranche.

La compilation a utilisé le contournement de jobname validé lors de la tranche précédente:

```
xelatex -interaction=nonstopmode -halt-on-error -jobname=doc_build -output-directory=documentation documentation/documentation.tex
xelatex -interaction=nonstopmode -halt-on-error -jobname=doc_build -output-directory=documentation documentation/documentation.tex
```

suivie du renommage déterministe vers `documentation/documentation.pdf`. Les deux passes finales se terminent sans avertissement, sans référence indéfinie et sans débordement. Le contrôle `python documentation/scripts/quality_check_documentation.py` réussit sur 29 fichiers LaTeX, avec zéro caractère U+2014, zéro tiret long, zéro métadiscours interdit et zéro jargon UI mal placé. Une vérification textuelle du PDF confirme zéro occurrence de « chapter N », zéro occurrence résiduelle de « and »/« to » anglais dans une référence multiple, et surtout zéro placeholder `Illustration planifiée` restant dans les 102 pages, contre dix avant l'intégration des neuf captures déposées en cours de tranche.

## Revue visuelle

Ont été inspectées après compilation: une page de chacun des chapitres 16 à 20, la page réutilisant `ui_logistique.png` au chapitre 16, la page confirmant que le doublon d'étiquette de `ui_responsabilites_machines.png` est bien résolu entre les chapitres 12 et 16, les quatre nouvelles captures réelles du chapitre 16 à la résolution native avant intégration, les cinq captures réelles récupérées pour les chapitres 12, 14 et 15, les figures `pipeline_exports.png`, `artefacts_et_preuves.png`, `reproduire_scenario.png`, `niveaux_validation.png`, `cycle_maintenance.png` et `invariants_modele.png`, ainsi qu'une page de l'annexe E en paysage confirmant la correction du mot de liaison anglais.

## Points nécessitant relecture humaine

`ui_responsabilites_machines.png` montre un formulaire vide plutôt que des acteurs et des postes déjà chargés; une recapture avec une configuration remplie améliorerait la pédagogie sans être strictement nécessaire. Le classement `RESSOURCE_MODELE_PROBABLE` des 25 fichiers PNG et le classement `NON_REFERENCE` des trois autres devraient être confirmés par un mainteneur du modèle avant toute décision de versionnement ou de suppression. Le fichier `.autosave` devrait être vérifié par l'utilisateur avant suppression, malgré la faible probabilité de perte d'information qu'indique sa comparaison avec le fichier validé. Les quatre captures optionnelles du chapitre 17 restent à réaliser si une tranche future souhaite les utiliser.

## Recommandation pour la suite

Le corps principal des vingt chapitres est maintenant rédigé intégralement, et la campagne de captures des chapitres 11 à 16 est achevée: le document compilé ne contient plus aucun placeholder. La prochaine tranche devrait porter sur les annexes techniques, A à F, restées largement au stade de squelette, en s'appuyant si besoin sur les quatre captures optionnelles encore disponibles pour le chapitre 17.
