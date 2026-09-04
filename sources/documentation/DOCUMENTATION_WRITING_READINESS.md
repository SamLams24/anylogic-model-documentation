# État de préparation à la rédaction

## Verdict

Le socle permet de commencer la rédaction des chapitres 1 à 5 puis 11 à 15. Les chapitres de résultats et certaines fiches de vue restent dépendants de captures manuelles actuelles. La rédaction doit conserver les placeholders identifiés jusqu'à obtention de ces captures.

## Matrice de préparation

| Domaine | Source primaire disponible | Audit terminé | Rédaction possible | Réserve |
|---|---|---:|---:|---|
| Architecture générale | ALP validé, rapport final | Oui | Oui | Schéma à générer. |
| Données métier | ALP validé, JSON courant | Oui | Oui | Distinguer structure disponible et données de run. |
| Cycle `CMD_*` | ALP validé, rapport final | Oui | Oui | Employer la logique consolidée. |
| Cycle `REAPPRO_*` | ALP validé, rapport final | Oui | Oui | Ne pas le nommer commande cliente. |
| Agents et AER | ALP validé, ABox et rapport | Oui | Oui | Détails Java en annexe. |
| VSM | correctif et run validé | Oui | Oui | Utiliser le ledger courant, pas l'ancienne formule. |
| SCOR et PI | ALP, JSON, run validé | Oui | Oui | Séparer métrique officielle et proxy interne. |
| ISA-95 et ontologie | JSON, ALP, ABox validée | Oui | Oui | Ne pas inventer de classes ou relations. |
| Huit vues de l'interface | ALP validé | Oui | Oui | Captures actuelles manquantes pour plusieurs vues. |
| Commandes et champs visibles | ALP validé | Oui | Oui | Cinq cases hors des zones actives sont documentées comme dormantes. |
| Sauvegarde JSON | ALP validé | Oui | Oui | La sauvegarde produit 14 blocs, dont `responsabilites`. |
| Chargement JSON | ALP validé, JSON courant | Oui | Oui | Le JSON courant ne contient que 13 blocs. |
| Exports | ALP et run validé | Oui | Oui | Ne chiffrer que depuis les artefacts vérifiés. |
| Guide de démonstration | UI, workflows | Partiel | Oui | Les nouvelles captures doivent être réalisées manuellement. |

## Conditions avant publication finale

1. Réaliser les captures identifiées `CAPTURE_A_REALISER` dans le plan d'illustrations.
2. Vérifier visuellement chaque capture contre le même modèle validé.
3. Désactiver les notes internes du squelette.
4. Passer le contrôle qualité en mode final.
5. Compiler deux fois et vérifier les listes, les références et les annexes.
6. Relire tout énoncé quantitatif contre le run ou le fichier source cité.

## État de rédaction des chapitres 1 à 5

| Chapitre | Statut | Justification |
|---:|---|---|
| 1 | `REDIGE` | Finalité, publics, périmètre et limites probatoires explicités. |
| 2 | `REDIGE` | Architecture, trois flux, exécution, données et sorties décrits. |
| 3 | `REDIGE` | Acteurs, objets métier, scénarios, nomenclature et stocks distingués. |
| 4 | `REDIGE` | Cycle `CMD_*`, décision de disponibilité, messages et run archivé intégrés. |
| 5 | `REDIGE` | Distinction `CMD_*` et `REAPPRO_*`, politiques de stock, besoin matière et réveil documentés. |

## État de rédaction des chapitres 11 à 15

| Chapitre | Statut | Justification |
|---:|---|---|
| 11 | `REDIGE` | Huit vues, navigation, fenêtres complémentaires et trois parcours utilisateur décrits. Capture réelle de navigation intégrée. |
| 12 | `REDIGE` | Acteurs, micro-activités, scénarios, gammes, responsabilités, machines et pondérations documentés. Six captures réelles intégrées, y compris `ui_responsabilites_machines.png`. |
| 13 | `REDIGE` | Nomenclature, fiche matière, mode d'approvisionnement, postes consommateurs et ordre de contrôle documentés. Trois captures réelles intégrées. |
| 14 | `REDIGE` | Portée du JSON, sauvegarde, détection, chargement, reconstruction et contrôles expliqués. Trois captures réelles intégrées, y compris `ui_json_charge.png`. |
| 15 | `REDIGE` | Réglages, démarrage, suivi, arrêt, clôture métier et réinitialisation distingués. Huit captures réelles intégrées, y compris `ui_controle_commandes.png`, `ui_temps_budgets.png` et `ui_perturbations.png`. |

## État de rédaction des chapitres 6 à 10

| Chapitre | Statut | Justification |
|---:|---|---|
| 6 | `REDIGE` | Cinq processus décrits depuis la répartition réelle des 71 micro-activités; Return qualifié `DISPONIBLE_NON_QUANTIFIE`. Deux schémas générés et inspectés. |
| 7 | `REDIGE` | Cinq niveaux de décision, Blackboard, AER sans expansion inventée et propagation du retard fournisseur documentés depuis `RUN_VERIFICATION.md`. Trois schémas générés et inspectés. |
| 8 | `REDIGE` | Deux périmètres VSM distingués, six indicateurs et PCE estimé repris du run de validation avec l'identité additive vérifiée. Trois schémas générés et inspectés. |
| 9 | `REDIGE` | Pipeline complet, scores et PI documentés depuis le run de validation. SCOR version 12,0 / APICS 2017 conservé comme établi. La distinction AHP local et pipeline du PI est corrigée et illustrée par un schéma dédié; `AM.3.18` est retiré du corps; `CO.1.1` est qualifié avec prudence comme association du modèle, pas comme preuve d'une métrique SCOR officielle. |
| 10 | `REDIGE` | Structure ISA-95, TBox, ABox, `executedAt` et traçabilité CMD/REAPPRO expliqués depuis l'ABox du run de validation. Trois schémas générés et inspectés. |

## État de rédaction des chapitres 16 à 20

| Chapitre | Statut | Justification |
|---:|---|---|
| 16 | `REDIGE` | Sept vues et la fenêtre de suivi documentées sans répéter les chapitres 11 à 13. Deux captures déjà validées réutilisées (`ui_logistique.png`, `ui_suivi_temps_reel.png`); les quatre nouvelles captures requises (`ui_execution.png`, `ui_vue_globale.png`, `ui_hierarchie.png`, `ui_structure_animee.png`) ont été intégrées avant la fin de la tranche. |
| 17 | `REDIGE` | Sorties organisées par besoin utilisateur, distinction des artefacts, feuilles Excel vérifiées contre `results_final.xlsx`. Deux schémas générés et inspectés; aucune capture requise dans le corps de cette tranche. |
| 18 | `REDIGE` | Procédure de reproduction en douze étapes, limites de reproductibilité et manifeste du run de validation documentés. Un schéma généré et inspecté. |
| 19 | `REDIGE` | Statuts probatoires, quatre familles de contrôle et limites de la campagne actuelle documentés avec des exemples réels du run de validation. Un schéma généré et inspecté. |
| 20 | `REDIGE` | Invariants, cycle de maintenance, compatibilité JSON et checklist de vérification documentés depuis `MODEL_EVOLUTION.md` et le chargeur du modèle. Deux schémas générés et inspectés. |
