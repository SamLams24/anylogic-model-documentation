# Points ouverts avant publication quantitative

## ISSUE-VSM-001

- Objet: Waiting Time global.
- Valeur Excel: 5 256,598 s.
- Valeur ABox: 0 s.
- Cause technique: `Dashboard Global` appelle `tempsAttenteGlobalCoherent()`, qui calcule le Lead Time multiplié par un moins le PCE. L'ABox exporte directement `kpiGlobal.avgWaitTime()`. Le chemin de `CMD_1` après réveil transmet une attente nulle et ne reprend pas l'attente de stock liée à `REAPPRO_1`.
- Statut: `CAUSE_ETABLIE_CORRECTION_REQUISE`.
- Action future: remplacer la reconstruction par une attente observée ou par un état d'attente explicitement horodaté, puis produire un nouveau run.

## ISSUE-TIME-001

- Objet: définition du Lead Time.
- Valeur pipeline: 15 018,853 s.
- Intervalle runtime client: proche de 1 937 s de simulation.
- Cause technique: `enregistrerFinCommandeGlobale()` privilégie `CMD_1.dureeReelleAccumulee`. Cet accumulateur additionne les durées planifiées du parcours propre de la commande, mais ne reçoit ni l'attente de reconstitution, ni Source, ni Make exécutés sous `REAPPRO_1`.
- Statut: `DUREE_RECONSTRUITE_PARTIELLE`.
- Action future: définir une horloge client cohérente, relier l'ordre interne à la commande servie et valider la nouvelle définition par un run.

## ISSUE-PCE-001

- Objet: PCE global de 65 pour cent.
- Cause technique: `enregistrerFinCommandeGlobale()` fixe la valeur ajoutée à 65 pour cent du Lead Time. `KPIBundle.pce()` restitue donc algébriquement 65 pour cent.
- Statut: `HYPOTHESE_NON_VALIDEE_NE_PAS_PUBLIER`.
- Action future: calculer le PCE à partir des observations de postes et de taux VA explicitement qualifiés, puis valider l'export.

## ISSUE-PI-001

- Objet: PI global de 6,227.
- Cause technique: Responsiveness utilise `RS.1.1` fondé sur le Lead Time partiel et `RS.3.94` fondé sur l'attente reconstruite. Le score RS contribue au PI avec un poids de 0,2 dans le run audité.
- Statut: `CALCULE_MAIS_NON_VALIDABLE`.
- Action future: corriger les métriques temporelles, recalculer RS et exécuter un nouveau run avant toute publication du PI.

## ISSUE-JSON-001

- Objet: paramètres de reproduction du retard fournisseur.
- Constat: le JSON ne contient ni paramètres runtime structurés du retard, ni échelle temporelle, ni identifiant d'exécution.
- Statut: `LIMITE_REPRODUCTIBILITE`.
- Action future: enrichir le profil JSON ou documenter une procédure de lancement contrôlée.
