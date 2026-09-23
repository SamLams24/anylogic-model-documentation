# Fiche de référence des runs DataCo

## RUN 1 (référence quantitative)

- Identifiant runtime : `RUN_1483228800000_1790184225857`
- `simToRealSeconds` : 3600 (confirmé par le dialogue « Paramètres Simulation & Budgets », capture AIM04)
- Modèle exécuté : non identifiable avec certitude par nom de fichier (voir la note « Traçabilité du modèle exécuté » du document principal). Détail technique :
  - le champ `modeleCandidate = SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp` du manifeste s'est avéré être une étiquette codée en dur dans le générateur de manifeste, identique dans plusieurs variantes du dépôt, et non le nom réel du fichier chargé ;
  - le fichier `sources/model/SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp` ne contient aucune des fonctions DataCo/Prophet/Recalibrator utilisées par ce run ;
  - ces fonctions sont en revanche présentes dans `SCONTO_SVU_DATACO_FINAL.alp`, le fichier co-localisé avec les exports RUN 1 et RUN 2 ;
  - son inventaire fonctionnel correspond à celui de la lignée `SCONTO_SVU_FINAL_VALIDATED_FORECAST_DATACO_MULTIPRODUCT_CONCURRENT_FIX` référencée en introduction du document principal ;
  - aucune preuve d'identité octet pour octet n'a pu être établie entre `SCONTO_SVU_DATACO_FINAL.alp` et les copies de ce nom présentes dans le dépôt, qui diffèrent elles-mêmes entre elles par leur taille.
- Date simulée de départ : 2017-01-01 00:00:00
- Date simulée de l'export de clôture : 2018-03-14T10:06:00 (`timestampCloture`, feuille Manifeste Run)
- Commandes clientes générées : 365 (122 DATACO_SPORTS + 122 DATACO_CLOTHING + 121 DATACO_ELECTRONICS)
- Demande totale : 99 896 unités (33 539 + 33 294 + 33 063)
- Commandes closes au snapshot : 79 / 365, dont 20 closes en retard (toutes sur DATACO_SPORTS)
- Commandes encore EN_ATTENTE : 286 / 365, réparties sur les trois familles : 79 sur DATACO_SPORTS (22 964 unités), 104 sur DATACO_CLOTHING (27 308 unités), 103 sur DATACO_ELECTRONICS (27 155 unités)
- Quantité livrée au snapshot : 22 469 unités (part de la demande totale : 22,49 %)
- Réapprovisionnements autonomes : 4 (REAPPRO_1 = 49 SERVIE ; REAPPRO_2 = 261 SERVIE ; REAPPRO_3 = 2 212 SERVIE ; REAPPRO_4 = 19 770 EN_COURS, sur DATACO_SPORTS)
- PI au snapshot : 8,871 / 10 (feuille Dashboard Global ; 8,8708 dans `export_DataCo Global.csv`)
- Statut : NON TERMINAL. Les retards clôturés (20 commandes) et le réapprovisionnement REAPPRO_4 encore EN_COURS (19 770 unités) sont concentrés sur DATACO_SPORTS ; le backlog client EN_ATTENTE, en revanche, est réparti sur les trois familles et n'est pas expliqué par REAPPRO_4 seul.

### Métriques Prophet (sur la demande réelle 2017, disponible sur les douze mois)

| Indicateur | Valeur |
|---|---|
| Erreur absolue totale | 29 902,69 |
| MAE mensuelle | 2 491,89 |
| RMSE | 3 441,15 |
| MAPE | 45,75 % |
| Biais moyen signé | +2 491,89 |

### Métriques Recalibrator

| Indicateur | Valeur |
|---|---|
| Erreur absolue totale | 1 476,68 |
| MAE mensuelle | 123,06 |
| RMSE | 180,71 |
| MAPE | 1,91 % |
| Biais moyen signé | +110,74 |

Réduction de l'erreur absolue totale : 1 - 1476,68 / 29902,69 ~= 95,06 % (~20,25 fois moins d'erreur absolue cumulée).

Provenance des séries mensuelles : la demande réelle mensuelle a été reconstruite depuis les `core:CustomerOrder` de l'ABox RUN 1, à partir de leurs dates de création et de leurs quantités (`core:hasQuantity`, `createdAtSimulationSecond`) ; les exports tabulaires (RESULTS xlsx) ne contiennent cependant pas les séries Prophet et Recalibrator mensuelles sous forme de feuille dédiée. Ces deux séries ont donc été lues sur le tableau de bord de la capture `screenshots/05_reference_dashboard_3600.png` (source AIM01, légendes numériques explicites par mois), qui est le seul artefact runtime fournissant ces deux séries pour RUN 1. Les métriques d'erreur (MAE, RMSE, MAPE, biais, erreur absolue totale) ont ensuite été recalculées indépendamment à partir de ces séries mensuelles, et la demande totale qui en résulte (99 896) a été croisée avec la feuille « Performance par produit » du RESULTS RUN 1, qui donne le même total par sommation des trois familles. Les métriques recalculées confirment les points de contrôle fournis pour cette passe, sans divergence constatée.

### Fichiers sources utilisés (RUN 1)

- `SCONTO_SVU_LIVRAISON_ENCADREMENT/01_MODELES/RUN 01/SCONTO_SVU_RESULTS_DataCo_Global_RUN_1483228800000_1790184225857.xlsx` (518 725 octets)
- `SCONTO_SVU_LIVRAISON_ENCADREMENT/01_MODELES/RUN 01/SCONTO_SVU_ABOX_DataCo_Global_RUN_1483228800000_1790184225857.ttl` (7 645 339 octets)
- `SCONTO_SVU_LIVRAISON_ENCADREMENT/01_MODELES/RUN 01/export_DataCo Global.csv` (1 462 octets)
- Capture AIM01 (dashboard Prophet / Recalibrator, `simToRealSeconds = 3600`)
- Capture AIM04 (dialogue de configuration temporelle confirmant l'échelle 3600)

## RUN D'ILLUSTRATION (RUN 2)

- Identifiant runtime : `RUN_1483228800000_1790188519870`
- `simToRealSeconds` : 7200
- Date simulée de l'export de clôture : 2018-10-14T09:42:00
- Commandes clientes générées : 365 (122 + 122 + 121)
- Demande totale : 99 653 unités
- Commandes closes au snapshot : 76 / 365, dont 21 closes en retard (toutes sur DATACO_SPORTS)
- Commandes encore EN_ATTENTE : 289 / 365
- Quantité livrée au snapshot : 21 398 unités (part de la demande totale : 21,47 %)
- Réapprovisionnements autonomes : 3 (REAPPRO_1 = 49 SERVIE ; REAPPRO_2 = 958 SERVIE ; REAPPRO_3 = 16 013 EN_COURS, sur DATACO_SPORTS)
- PI au snapshot : 8,834 / 10
- Statut : NON TERMINAL, pour les mêmes raisons que le RUN 1.

Utilisé principalement pour les captures d'évolution de l'interface (activation DataCo, génération AutoCommande, progression de campagne, contraction d'octobre-novembre) ; ne constitue pas la source quantitative de référence. Les deux campagnes présentent des trajectoires différentes. Le changement d'échelle modifie l'ordonnancement temporel relatif des événements et, en l'absence de graine aléatoire explicitement contrôlée (le manifeste indique `graineAleatoire = NON_ACCESSIBLE_DANS_MAIN`), les deux runs ne sont pas quantitativement interchangeables : la divergence observée ne peut donc pas être attribuée avec certitude au seul changement de `simToRealSeconds`. RUN 2 est utilisé uniquement comme support visuel, et ses valeurs numériques ne doivent jamais être mélangées avec les tableaux et métriques du RUN 1.
