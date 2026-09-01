# Plan de rédaction du chapitre 9

## Question directrice

Le chapitre devra expliquer ce que l'intégration de la décision, de l'exécution et de la mesure apporte à la traçabilité de la Supply Chain simulée, sans transformer un run unique en démonstration d'efficacité générale.

## 9.1 Séparation des trois plans d'analyse

Présenter trois plans complémentaires. Le plan décisionnel couvre les objectifs, alertes, arbitrages et instructions. Le plan d'exécution couvre les flux Source, Make, Deliver et Return, les stocks et les états de commande. Le plan de mesure couvre VSM, les métriques associées à SCOR et le PI. Expliquer qu'une décision locale peut être tracée sans être automatiquement créditée d'une variation du PI.

Preuves mobilisables: modèle ALP validé, ABox du run VSM, feuilles de trace Excel. Risque principal: confondre coexistence temporelle et causalité.

## 9.2 Politique autonome et continuité du flux

Discuter la politique de stock fini et de matière: point de commande, quantité de Wilson bornée, stock projeté et réceptions attendues. Montrer que cette autonomie soutient la continuité du flux dans le run, où l'absence de stock déclenche `REAPPRO_1`.

Limiter la conclusion à l'exécution observée. Aucun optimum de coût ou de niveau de stock n'est établi. Le test d'un ordre partagé entre plusieurs commandes reste à conduire.

## 9.3 Articulation entre CMD et REAPPRO

Expliquer la séparation entre demande externe et ordre interne. Décrire les relations `contributesToCustomerOrderFulfillment` et `dependsOnInternalReplenishmentOrder`, l'imputation temporelle unique et l'exclusion de `REAPPRO_*` des KPI clients.

Point à discuter: l'imputation complète d'un ordre partagé décrit le délai subi par chaque commande, mais ne doit pas être additionnée comme charge d'atelier. Une allocation par quantité pourrait être requise dans un cas multi-commandes.

## 9.4 Traçabilité sémantique et reproductibilité

Relier le manifeste du run, les identifiants stables, l'ABox, les feuilles Excel et la structure ISA-95. Distinguer traçabilité d'exécution et reproductibilité stricte. Le runId, les paramètres et le timestamp sont exportés; la graine reste inaccessible et le SHA-256 du preset JSON n'est pas produit automatiquement par AnyLogic.

## 9.5 AER, adaptation et décision locale

Analyser la transformation des six messages de retard depuis Source jusqu'à Deliver. Présenter le Blackboard comme mémoire partagée et l'AHP comme arbitrage local. Utiliser le goulot `sM1.3.1`, la décision `REBALANCE` et le score AHP 0,730 uniquement comme faits du run courant.

Éviter tout lien direct entre AHP et PI. L'AHP sélectionne une action dans une situation locale; le PI agrège des mesures globales après exécution.

## 9.6 Complémentarité entre VSM, SCOR et PI

Montrer que le VSM conserve la lecture physique des temps, que les identifiants SCOR organisent les métriques et que le PI facilite une synthèse pondérée. Distinguer les associations nommées, les proxys explicites et les approximations mono-produit.

La discussion devra citer le PI de 6,119/10 seulement avec la formulation liée aux profils internes du modèle. Elle devra maintenir les réserves sur le PCE estimé et la calibration Bottom/Perfect.

## 9.7 Limites de la campagne

Regrouper les limites qui affectent l'interprétation transversale: un seul run validé, absence de référence sans retard, absence de réplications, graine non exposée, Return non exécuté, campagne qualité absente et scénario multi-commandes non testé.

## 9.8 Stochasticité, calibration et généralisation

Proposer une campagne future avec graines contrôlées, réplications, intervalles d'incertitude et scénarios appariés. Prévoir la calibration des taux VA, des bornes Bottom/Perfect, des coûts et des valeurs d'actifs sur des données validées par ZENER SA Togo.

La généralisation devra être formulée comme une capacité à tester une architecture, non comme une preuve que les valeurs actuelles décrivent toute l'entreprise ou d'autres sites industriels.

## Articulation éditoriale

Le chapitre ne devra pas répéter la chronologie du chapitre 8 ni les tableaux du chapitre 7. Il utilisera les résultats pour répondre à trois questions: ce qui est traçable, ce qui est calculable et ce qui reste causalement indéterminé. Une conclusion courte préparera les limites méthodologiques du chapitre 10.
