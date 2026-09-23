# Assets du run DataCo final

Ce dossier documente les preuves runtime retenues pour `Documentation_Module_Prevision_SCONTO_SVU_corrige.tex` : la campagne de référence RUN 1 (`simToRealSeconds = 3600`) et la campagne d'illustration RUN 2 (`simToRealSeconds = 7200`). Les sources brutes (captures AIM01-AIM12, exports RUN 01 / RUN 02) proviennent de `SCONTO_SVU_LIVRAISON_ENCADREMENT/01_MODELES/` et ne sont pas dupliquées ici au-delà des fichiers listés ci-dessous.

## screenshots/

Sept captures effectivement retenues et intégrées au document, recadrées ou utilisées telles quelles à partir des captures sources AIM01-AIM12 (aucune reconstruction, aucun chiffre modifié) :

- `00_configuration.png` (source AIM02) : configuration générale des micro-activités et du scénario multi-produit.
- `01_activation_dataco.png` (source AIM03) : message de confirmation d'activation du mode DataCo (Prophet chargé, calibration DataCo chargée, AutoCommande active, générateurs concurrents désactivés, Recalibrator actif).
- `02_autocommande.png` (source AIM05) : émission d'une commande cliente par l'AutoCommande (CommandeAgent), campagne d'illustration à 7200.
- `03_early_year.png` (source AIM06) : progression de début de campagne, campagne d'illustration à 7200.
- `04_october_break.png` (source AIM11) : contraction de la demande d'octobre-novembre et réaction du Recalibrator, campagne d'illustration à 7200. Illustration de dynamique uniquement ; les valeurs numériques de référence sont celles du RUN 1 (section dédiée du document).
- `05_reference_dashboard_3600.png` (recadrage de AIM01) : tableau de bord Prophet / Recalibrator / demande réelle sur les douze mois, campagne de référence RUN 1 à `simToRealSeconds = 3600`. Source des valeurs mensuelles Prophet / Réel / Recalibrator citées dans le document.
- `06_reference_errors_3600.png` (recadrage de AIM01) : courbe dynamique des écarts et histogrammes d'erreur mensuelle Prophet/Réel et Recalibrator/Réel, campagne de référence RUN 1.

`06_terminal_state.png` n'est volontairement pas créé : ni le RUN 1 (79/365 commandes closes) ni le RUN 2 (76/365 commandes closes) n'atteignent l'état terminal opérationnel (backlog résiduel non éteint, réapprovisionnement autonome encore EN_COURS). Ce fichier sera ajouté lorsqu'un run sera mené jusqu'à extinction complète du backlog, pour documenter l'expérimentation E5.

## exports/

Les exports runtime du RUN 1 et du RUN 2 (dossiers `RUN 01/` et `RUN 02/` de `SCONTO_SVU_LIVRAISON_ENCADREMENT/01_MODELES/`) totalisent environ 18 Mo, essentiellement du fait des exports ABox TTL (jusqu'à 7,6 Mo chacun). Ils ne sont pas committés dans ce dépôt afin de ne pas alourdir l'historique Git avec de gros fichiers binaires. Ils restent disponibles dans le dossier de livraison et sont nommés ci-dessous pour la traçabilité :

RUN 1 (`RUN 01/`, run de référence, `simToRealSeconds = 3600`) :
- `SCONTO_SVU_RESULTS_DataCo_Global_RUN_1483228800000_1790184225857.xlsx` (~519 Ko) : export de clôture final, 25 feuilles (Dashboard Global, Manifeste Run, Performance par produit, Pipeline SCOR vers PI, etc.).
- `SCONTO_SVU_ABOX_DataCo_Global_RUN_1483228800000_1790184225857.ttl` (~7,6 Mo) : ABox synchronisée au même instant de clôture.
- `SCONTO_SVU_RESULTS_DataCo_Global_RUN_1483228800000_1790184121122.xlsx` (~57 Ko) et `SCONTO_SVU_ABOX_DataCo_Global_RUN_1483228800000_1790184121122.ttl` (~170 Ko) : export intermédiaire antérieur du même run, non utilisé pour les résultats (seul l'export de clôture ci-dessus fait référence).
- `export_DataCo Global.csv` (~1,5 Ko) et `traces_DataCo Global.csv` (~2 Mo) : synthèse par poste et trace agrégée associées à l'export de clôture.

RUN 2 (`RUN 02/`, run d'illustration, `simToRealSeconds = 7200`) :
- `SCONTO_SVU_RESULTS_DataCo_Global_RUN_1483228800000_1790188519870.xlsx` (~518 Ko) : export de clôture unique de ce run.
- `SCONTO_SVU_ABOX_DataCo_Global_RUN_1483228800000_1790188519870.ttl` (~7,6 Mo) : ABox associée.

Voir `RUN_REFERENCE.md` pour la fiche de synthèse des deux runs.
