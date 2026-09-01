# Revue éditoriale finale

## Corrections factuelles

- La métrique CO.1.1 est définie comme le rapport entre le coût total simulé et le chiffre d'affaires estimé. Sa valeur brute est 1. Le score CO égal à 0 dépend du profil de normalisation et ne caractérise pas une absence de performance économique réelle.
- La valeur AM.3.18 de 192 800 000 EUR a été retirée du corps du rapport. Elle demeure uniquement dans l'annexe D comme paramètre informatif non calibré, hors score.
- Les six valeurs VSM validées ont été conservées sans modification. Les temps de commande et les temps focalisés sur ACT_4 sont présentés comme deux périmètres distincts. Le PCE de 70,9 pour cent reste qualifié d'estimation interne.
- Le pipeline de performance explicite la succession entre métriques, normalisation, logique floue, scores d'attribut, pondération et PI. Le PI de 6,11881172 est présenté comme une sortie interne du modèle pour l'exécution étudiée.
- Le chapitre expérimental repose uniquement sur le modèle validé et sur les exports Excel et ABox concordants. Les fonctions sans preuve primaire dédiée restent décrites comme capacités disponibles.

## Corrections éditoriales

- Douze occurrences de métadiscours relatives aux états successifs du modèle ont été supprimées ou reformulées dans les fichiers destinés au rendu.
- Le mot run a été remplacé par exécution dans la prose. Le runId complet n'apparaît qu'une fois dans le chapitre expérimental et une fois dans le registre des preuves.
- Le chapitre 8 est intitulé « Validation expérimentale du scénario retenu ».
- Le chapitre 9 comprend huit sections de discussion centrées sur l'intégration entre décision, exécution et mesure.
- Le chapitre 10 sépare les limites et le périmètre de validité de la conclusion générale.
- Le résumé final présente le problème, l'approche, le scénario, les résultats principaux et leurs limites sur une page.
- Les chapitres 1 à 10 ont été relus pour réduire les répétitions, les annonces de plan et les conclusions artificielles.

## Figures

- `chaine_execution_consolidee.png` représente la commande externe, l'ordre interne, les processus et les états de stock de la chaîne bout en bout.
- `propagation_retard_fournisseur.png` représente les six messages AER observés entre Supplier, Source, Make et Deliver.
- `dashboard_vsm_valide.png` et `pipeline_vsm_scor_pi.png` ont été vérifiés et régénérés sans modification des valeurs validées.
- La source reproductible des quatre figures est conservée dans `scripts/generate_evidence_figures.ps1`.
- Le rendu contient quatre figures et aucun placeholder.

## Compilation et contrôle du rendu

- `python scripts/quality_check.py` ne signale aucune occurrence bloquante.
- Deux passes XeLaTeX finales aboutissent à un PDF de 37 pages physiques, avec six pages liminaires numérotées en chiffres romains et trente pages principales numérotées en chiffres arabes.
- Le journal final ne contient ni avertissement, ni référence indéfinie, ni débordement de boîte.
- La table des matières, la liste des figures, la liste des tableaux, les légendes, la pagination, les annexes D et E et les pages de figures ont été inspectées.
- Aucune page vide ou anormalement vide n'a été détectée. La seconde page de l'annexe D contient la fin du tableau long.

## Limites scientifiques maintenues

- Une seule exécution primaire est disponible et aucune réplication statistique n'a été réalisée.
- Aucune exécution appariée sans retard ne permet d'isoler l'effet causal de la perturbation fournisseur.
- La graine aléatoire n'est pas accessible dans Main et l'empreinte du JSON n'est pas exportée automatiquement dans le manifeste.
- Les taux de valeur ajoutée et les profils Bottom et Perfect ne sont pas calibrés sur des observations terrain.
- Le partage d'une reconstitution entre plusieurs commandes n'est pas validé.
- Return, les défauts qualité, les pannes et les comparaisons de modes de coordination ne disposent pas de validation quantitative dédiée.
- L'effet de la décision AHP locale sur le PI global n'est pas établi.

## Points restant ouverts

- Construire une exécution de référence sans retard avec une graine contrôlée.
- Réaliser des réplications et une analyse de sensibilité selon un protocole homogène.
- Calibrer les taux de valeur ajoutée, les profils de normalisation, les coûts et les paramètres d'actifs avec des données métier.
- Tester les scénarios multi-commandes, Return, qualité, panne et perturbation de demande.
