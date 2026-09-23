# Fiche de référence des runs DataCo

## RUN 1 (référence quantitative)

- Identifiant runtime : `RUN_1483228800000_1790184225857`
- `simToRealSeconds` : 3600 (confirmé par le dialogue « Paramètres Simulation & Budgets », capture AIM04)
- Modèle exécuté : `SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp`
- Date simulée de départ : 2017-01-01 00:00:00
- Date simulée de l'export de clôture : 2018-03-14T10:06:00 (`timestampCloture`, feuille Manifeste Run)
- Commandes clientes générées : 365 (122 DATACO_SPORTS + 122 DATACO_CLOTHING + 121 DATACO_ELECTRONICS)
- Demande totale : 99 896 unités (33 539 + 33 294 + 33 063)
- Commandes closes au snapshot : 79 / 365, dont 20 closes en retard (toutes sur DATACO_SPORTS)
- Commandes encore EN_ATTENTE : 286 / 365
- Quantité livrée au snapshot : 22 469 unités (part de la demande totale : 22,49 %)
- Réapprovisionnements autonomes : 4 (REAPPRO_1 = 49 SERVIE ; REAPPRO_2 = 261 SERVIE ; REAPPRO_3 = 2 212 SERVIE ; REAPPRO_4 = 19 770 EN_COURS, sur DATACO_SPORTS)
- PI au snapshot : 8,871 / 10 (feuille Dashboard Global ; 8,8708 dans `export_DataCo Global.csv`)
- Statut : NON TERMINAL. Le backlog du réapprovisionnement autonome REAPPRO_4 (19 770 unités, statut EN_COURS) explique la faible part livrée sur DATACO_SPORTS malgré 122 commandes générées.

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

Ces métriques ont été recalculées indépendamment à partir des valeurs mensuelles Prophet / Réel / Recalibrator lues sur la capture `screenshots/05_reference_dashboard_3600.png` (source AIM01) et croisées avec la demande totale de la feuille « Performance par produit » du RESULTS RUN 1 (99 896 = somme des douze mois de demande réelle). Elles confirment les points de contrôle fournis pour cette passe, sans divergence constatée.

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

Utilisé principalement pour les captures d'évolution de l'interface (activation DataCo, génération AutoCommande, progression de campagne, contraction d'octobre-novembre) ; ne constitue pas la source quantitative de référence. Les valeurs numériques de cette campagne divergent de celles du RUN 1 (démonstration que l'échelle temporelle modifie la trajectoire de demande simulée, et non une simple accélération graphique) et ne doivent jamais être mélangées avec les tableaux et métriques du RUN 1.
