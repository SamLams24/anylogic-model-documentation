# DOCUMENT_PLAN.md

## Structure cible recommandée
La structure du document source est ramenée à un corps principal plus lisible. Les détails exhaustifs sont conservés dans les annexes.

### Pages liminaires
- Page de garde
- Résumé
- Table des matières
- Liste des figures
- Liste des tableaux
- Liste des sigles

### 1. Introduction et cadre de l'analyse
Finalité, questions de validation, périmètre, sources de preuve et règles d'interprétation.

### 2. Cas d'étude et conditions initiales
ZENER SA Togo, réseau d'acteurs, commande étudiée, stocks, paramètres nécessaires et logique de simulation.

### 3. Architecture multi-agents et chaîne de décision
Niveaux stratégique, tactique, coordination, pilotage et exécution. Descente des objectifs et remontée du reporting.

### 4. Exécution de bout en bout
Chronologie compacte de la demande client à la livraison. Sous-sections Source, Make et Deliver. Cette partie porte les faits de l'exécution, sans répéter toute la discussion académique.

### 5. Gestion des écarts et adaptation holonique
Boucle AER, panne ou goulot, Blackboard, arbitrage AHP, instruction, application et accusé de fermeture.

### 6. Analyse VSM
Cycle Time, Waiting Time, Lead Time, Dwell Time, WIP, PCE, postes critiques et lecture du goulot.

### 7. Passage de VSM à SCOR et construction du PI
Métriques physiques, normalisation Bottom/Perfect, RL, RS, AG, CO, AM, fuzzification, pondération, PI et interprétation.

### 8. Validation expérimentale par scénarios
Regrouper les scénarios réellement démontrés. Pour chaque scénario : conditions initiales, phénomène isolé, résultats clés, différence par rapport à la référence et conclusion limitée aux données.

Prévoir notamment, lorsque les sources sont présentes :
- fonctionnement nominal ;
- livraison sur stock ;
- reconstitution par Make ;
- Source puis Make ;
- retard fournisseur ;
- qualité ;
- panne ou capacité ;
- politique de stock.

### 9. Discussion intégrée
Interprétation transversale : coordination, causalité, performance, intérêt du modèle, séparation entre décision locale AHP et PI global.

### 10. Limites et conclusion
Limites de la campagne, stochasticité, portée du PI, généralisation, qualité des données et conclusion générale.

## Annexes

### Annexe A : Traçabilité détaillée agent par agent
Déplacer ici l'ancien chapitre 17. Conserver les identifiants et les preuves sans alourdir le corps principal.

### Annexe B : Communications de la commande
Tableau complet ou condensé des communications ordonnées.

### Annexe C : Boucle AER complète
Les treize étapes, messages et accusés.

### Annexe D : Matrice VSM vers SCOR vers PI
Tableau technique complet des métriques, unités, normalisations, poids et contributions.

### Annexe E : Résultats bruts et fichiers de preuve
Référencer les exports Excel, ABox et autres artefacts, sans les recopier intégralement dans le texte principal.

## Figures principales recommandées
Limiter le corps principal à environ six à huit figures réellement utiles :

1. Réseau Supply Chain et stocks initiaux.
2. Hiérarchie multi-agents.
3. Chronologie Source, Make, Deliver.
4. Capture du point critique Make ou du goulot.
5. Boucle AER complète.
6. Dashboard VSM/SCOR/PI.
7. Pipeline SCOR vers PI.
8. Comparaison d'un scénario perturbé avec la référence, si utile.
