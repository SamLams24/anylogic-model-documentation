# Points ouverts avant publication quantitative

## ISSUE-VSM-001

- Objet: Waiting Time global.
- Valeur Excel: 5 256,598 s.
- Valeur ABox: 0 s.
- Statut: `NE_PAS_PUBLIER`.
- Action future: produire un run contrôlé ou auditer le pipeline de consolidation.

## ISSUE-TIME-001

- Objet: définition du Lead Time.
- Valeur pipeline: 15 018,853 s.
- Intervalle runtime client: proche de 1 937 s de simulation.
- Statut: `DEFINITION_A_CLARIFIER`.
- Action future: identifier la formule, l'unité, la conversion temporelle et le niveau d'agrégation.

## ISSUE-JSON-001

- Objet: paramètres de reproduction du retard fournisseur.
- Constat: le JSON ne contient ni paramètres runtime structurés du retard, ni échelle temporelle, ni identifiant d'exécution.
- Statut: `LIMITE_REPRODUCTIBILITE`.
- Action future: enrichir le profil JSON ou documenter une procédure de lancement contrôlée.
