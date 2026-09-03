# Audit de l'ancienne Documentation Master Globale Consolidée RC1

## Périmètre et méthode

Le fichier `sources/documents/documentation_master_RC1.docx`, annoncé à 89 pages, a été lu intégralement. Son empreinte SHA-256 est `797BB17F3BB6632B987D5429A23DB325F557DE4A5159271B397D67ECDECC40EB`. L'audit couvre ses 25 chapitres, son chapitre 17 détaillé et ses 18 images incorporées.

Chaque ancien chapitre reçoit un seul statut principal. Ce statut porte sur sa place dans la future documentation, pas sur la valeur de toutes les informations qu'il contient.

## Audit des 25 chapitres

| Ancien chapitre | Statut principal | Contenu utile | Contenu obsolète ou fragile | Destination | Illustrations et preuves à revoir |
|---|---|---|---|---|---|
| 1. Introduction | `FUSIONNER` | Contexte, problème, objectifs, périmètre et hypothèses. | Organisation fondée sur les 25 chapitres et vocabulaire de version. | Chapitre 1, avec les limites réparties dans les chapitres concernés. | Pas d'illustration récupérable. Vérifier le périmètre contre le rapport final. |
| 2. Référentiels théoriques et normatifs | `SUPPRIMER_COMME_STRUCTURE` | Définitions SCOR, VSM, ISA-95, holons, AHP, MRP et ontologies. | Bloc théorique trop précoce, formulations normatives non toutes reliées à une source vérifiée. | Chapitres 6 à 10 et glossaire. | Générer des schémas ciblés. Réutiliser uniquement les références du projet déjà vérifiées. |
| 3. Architecture générale | `REECRIRE` | Couches agents, flux, données, indicateurs, vues et blackboard. | Architecture présentée avant le cycle concret, terminologie d'agents antérieure à la consolidation. | Chapitre 2. | Générer une architecture générale et une vue des flux. Vérifier les identités d'agents dans l'ALP et l'ABox. |
| 4. Modèle de domaine et acteurs | `FUSIONNER` | Acteurs, matières, produits et scénarios. | Scénarios décrits avec « MTO partiel » et « MTO complet ». | Chapitre 3, puis chapitre 4 pour les commandes. | Tableau d'acteurs depuis le JSON courant. Remplacer l'ancien classement des ruptures. |
| 5. Architecture des agents | `REECRIRE` | Rôles stratégique, tactique, coordination, pilotage et exécution. | Mélanges entre superviseur historique, pilotage courant et identités visuelles. | Chapitre 7 et annexes B et C. | Diagrammes de classes et de séquence à générer. Preuve ALP et ABox requise. |
| 6. Processus SCOR implémentés | `FUSIONNER` | Plan, Source, Make, Deliver, Return, niveaux et règles d'enchaînement. | Présentation en catalogue, associations SCOR parfois plus affirmatives que la preuve. | Chapitre 6, avec renvois vers 4 et 5. | Diagramme d'activité Source, Make, Deliver. Vérifier chaque code N3 dans le JSON. |
| 7. Flux informationnels et communications AER | `FUSIONNER` | Enveloppe AER, propagation et distinction des flux. | Certains rôles et libellés appartiennent à une génération antérieure. | Chapitre 7 et annexe C. | Diagramme de séquence AER. Preuves ALP, traces et ABox. |
| 8. Flux physiques et animation | `FUSIONNER` | Entités, feuille de route, déplacement, stocks, approvisionnement, livraison et retours. | Confusion ponctuelle entre animation et réalisation métier. | Chapitres 4 à 6 et 16. | Nouvelle capture de la Structure animée et diagramme des flux. |
| 9. Gestion des stocks, MRP et nomenclatures | `REECRIRE` | Fiche matière, stock de sécurité, consommation et profils de test. | Déclenchement décrit depuis une commande cliente, valeurs de stock anciennes, vocabulaire MTO. | Chapitres 5 et 13. | Diagramme `CMD_*` vers `REAPPRO_*`; preuves ALP et JSON courant. |
| 10. Logique de commande et scénarios métier | `REECRIRE` | Création, sélection, date promise, états, livraison et retours. | Trois scénarios interprétés comme modes MTO de rupture. | Chapitre 4 et partie du chapitre 5. | Séquence de commande et réveil après crédit du stock. Vérifier dans l'ALP validé. |
| 11. Hiérarchie ISA-95 | `FUSIONNER` | Niveaux d'équipement, rattachement des postes et contrôles. | Chiffres et métadonnées de génération dispersés. | Chapitre 10 et annexe technique A ou C selon le détail. | Diagramme hiérarchique généré depuis les 190 noeuds et 71 affectations du JSON courant. |
| 12. Mesures VSM | `REECRIRE` | Événements, temps, WIP, takt et agrégations. | Ancienne logique de résidence et formules antérieures au ledger exact de commande. | Chapitre 8. | Refaire le pipeline VSM depuis le correctif et le run validé. |
| 13. Métriques SCOR et Performance Index | `REECRIRE` | Chaîne valeur brute, score, classes, attributs et PI. | Risque de présenter des proxies internes comme métriques officielles et anciens résultats non archivés. | Chapitre 9 et annexe D. | Générer le pipeline. Chiffrer uniquement depuis le run validé. |
| 14. TBox, ABox et validation ontologique | `DEPLACER_ANNEXE` | Distinction TBox/ABox, namespaces, règles d'export et contrôle. | Métadiscours de livraison et ancien état des artefacts. | Synthèse au chapitre 10, détail technique en annexes B et C. | Schéma TBox/ABox et preuve ABox validée. |
| 15. Blackboard et traçabilité | `FUSIONNER` | Compteurs, journal, traces brutes et agrégées. | Inventaire fondé sur un état antérieur du modèle. | Chapitres 7, 8 et 17. | Diagramme du pipeline de trace. Vérifier les tableaux actuels dans l'ALP. |
| 16. Configuration JSON 2.1 | `REECRIRE` | Structure générale, blocs métier, profils, AHP, ABox et ISA-95. | Ne distingue pas assez structure courante, structure produite par sauvegarde et état runtime. | Chapitre 14 et annexe A. | Deux workflows JSON et vue pédagogique des blocs. Preuves ALP et JSON courant. |
| 17. Présentation visuelle et utilisation | `CONSERVER_COMME_SOURCE` | Couverture détaillée des vues, commandes, fenêtres et parcours. | Captures incomplètes, résultats dynamiques non rattachés au run validé et certaines descriptions antérieures à la distinction `CMD_*` et `REAPPRO_*`. | Chapitres 11 à 17 et annexe E. | Les 18 captures sont classées ci-dessous. Toutes les vues sont revérifiées dans l'ALP. |
| 18. Référence des fonctions Java | `DEPLACER_ANNEXE` | Inventaire statique, fonctions structurantes, démarrage et arrêt. | Présentation trop centrale pour les publics non développeurs, commentaires de correction. | Annexes B et C, synthèse au chapitre 20. | Vérifier les 334 fonctions dans l'ALP. Aucun schéma Java dans le guide utilisateur. |
| 19. Exports, artefacts et synchronisation | `FUSIONNER` | CSV, Excel, ABox, nommage et snapshot. | Comptages ou politiques associés à un état de livraison ancien. | Chapitre 17 et annexe D. | Utiliser les artefacts runtime vérifiés et le code d'export courant. |
| 20. Stratégie de validation | `REECRIRE` | Validation structurelle, fonctionnelle, calculatoire et ontologique. | Langage de baseline, générations et travaux futurs désormais réalisés en partie. | Chapitre 19. | Matrice de preuve mise à jour depuis les rapports de vérification. |
| 21. Résultats du cas de référence | `REECRIRE` | Grille de lecture des résultats et résultats structurels. | Titre et contenu annonçant un run final encore à venir. | Chapitre 19, limité aux résultats effectivement archivés. | Remplacer les attentes par le run validé, sans ajouter de valeur absente. |
| 22. Limites, hypothèses et calibration | `FUSIONNER` | Statut des paramètres, calibration, poids, proxies et généralisation. | Répétitions avec les chapitres de validation. | Chapitres 8, 9, 19 et 20. | Aucun visuel ancien à conserver. Vérifier les profils dans le JSON courant. |
| 23. Guide de reproduction | `FUSIONNER` | Prérequis, intégrité, chargement, exécution et archivage. | Procédure centrée sur une organisation de livraison ancienne. | Chapitre 18 et chapitre 17 pour l'archivage. | Diagramme d'activité de reproduction. Mettre à jour les noms de fichiers. |
| 24. Références et glossaire | `DEPLACER_ANNEXE` | Glossaire et corpus interne. | Références non toutes qualifiées et abréviations de processus de correction. | Annexe F et bibliographie future limitée aux sources vérifiées. | Revalider toute référence avant insertion. |
| 25. Conclusion | `SUPPRIMER_COMME_STRUCTURE` | Rappel des capacités du modèle. | Répétition générale et revendications liées à la version RC1. | Conclusions locales utiles dans les chapitres 19 et 20. | Aucun visuel. Toute affirmation de validation doit pointer vers un run. |

## Audit détaillé de l'ancien chapitre 17

| Sous-partie | Statut | Décision et destination |
|---|---|---|
| 17.1 Navigation | `ACTUALISER` | Conserver la logique de navigation, mais décrire huit vues réelles. Le suivi temps réel est une fenêtre accessible depuis les huit vues. Destination : chapitre 11. |
| 17.2 Configuration | `ACTUALISER` | Conserver l'éditeur et les groupes de paramètres, ajouter les commandes actuelles `Profils de test` et `Perturbations`, et distinguer les contrôles accessibles de ceux hors zone. Destination : chapitre 12. |
| 17.3 Nomenclature | `REFAIRE_CAPTURE` | Le fonctionnement reste central, mais les anciennes images montrent des éléments de l'environnement de développement ou des cadrages incomplets. Destination : chapitre 13. |
| 17.4 Exécution | `REFAIRE_CAPTURE` | Conserver les familles d'indicateurs et de tableaux. Remplacer les valeurs dynamiques anciennes par une capture actuelle reliée à un run identifié. Destination : chapitres 15 à 17. |
| 17.5 Vue globale | `REFAIRE_CAPTURE` | Conserver l'objectif de synthèse. La capture dense et ancienne ne permet pas de vérifier facilement les identités consolidées. Destination : chapitre 16. |
| 17.6 Logistique | `ACTUALISER` | Décrire le formulaire acteur, les catégories, les tableaux et les détails Plan, Source, Make, Deliver et Return depuis l'ALP courant. Destination : chapitres 12 et 16. |
| 17.7 Hiérarchie | `ACTUALISER` | Maintenir une fiche propre à la vue holonique, avec la hiérarchie actuelle `Strategic`, `Tactical`, `Coordinator`, `OperationalPilot`, `OperationalExecution`. Destination : chapitre 16. |
| 17.8 Structure animée | `ACTUALISER` | Séparer animation des messages, animation des véhicules et état métier. Destination : chapitres 15 et 16. |
| 17.9 Responsabilités et machines | `ACTUALISER` | Conserver la gestion des responsabilités et machines, avec les 16 contrôles actuellement situés dans `viewResp`. Destination : chapitres 12 et 16. |
| 17.10 Suivi temps réel | `REFAIRE_CAPTURE` | Conserver la fenêtre et son utilité. L'ancienne capture contient un chemin de commande et des valeurs non rattachés au run archivé. Destination : chapitre 15. |
| 17.11 Fenêtres complémentaires | `CONSERVER` | Les fenêtres de stocks, commandes, temps et budgets, profils, retours, animation et perturbations restent accessibles dans le modèle. Actualiser les libellés pendant la rédaction. Destination : chapitres 12 et 15. |
| 17.12 Tableaux | `FUSIONNER` | Regrouper par question utilisateur : état du run, flux, décisions, métriques et traçabilité. Destination : chapitres 16 et 17, catalogue en annexe E. |
| 17.13 Conventions | `CONSERVER` | Conserver les unités et principes visuels, après contrôle de chaque unité dans le modèle et les exports. Destination : chapitres 15 à 17. |
| 17.14 Parcours utilisateur | `ACTUALISER` | Refaire le parcours autour du JSON courant, de la sélection du scénario nominal et de la distinction entre commandes externes et ordres internes. Destination : chapitres 11, 14 et 15. |
| 17.15 Plan de captures | `DEPLACER` | Sortir cette matière du document final et la consolider dans `DOCUMENTATION_ILLUSTRATION_PLAN.md`. |

## Classement des 18 captures incorporées

Les images restent dans le DOCX source. Elles ne sont pas copiées automatiquement dans `documentation/figures/`.

| Image | Contenu reconnu | Classement | Motif |
|---:|---|---|---|
| 1 | Barre de navigation | `A_RECROPPER` | Les libellés sont cohérents, mais il s'agit d'un extrait partiel et non d'une vue complète. |
| 2 | Vue Configuration complète | `A_REMPLACER` | La capture est utile pour le repérage, mais elle ne montre pas clairement tous les contrôles actuels et reste trop large pour une lecture imprimée. |
| 3 | Éditeur de micro-activité | `A_RECROPPER` | Le groupe principal reste reconnaissable; un cadrage plus propre est nécessaire. |
| 4 | Paramètres économiques d'un poste | `OBSOLETE` | Extrait redondant, incomplet et sans contexte suffisant. |
| 5 | Poste sélectionné et scénario | `A_RECROPPER` | Les commandes visibles existent encore; le cadrage doit isoler les deux zones. |
| 6 | Pondération des attributs du PI | `REUTILISABLE` | Les cinq champs et la commande d'application correspondent à l'interface actuelle. À utiliser comme référence de travail, après vérification finale du cadrage. |
| 7 | Pondération des métriques N3 | `REUTILISABLE` | Les commandes correspondent aux contrôles actuels. |
| 8 | Vue Nomenclature et matières | `A_RECROPPER` | L'interface est reconnaissable, mais des icônes de développement apparaissent dans le cadre. |
| 9 | Fiche matière | `A_RECROPPER` | Le groupe reste conforme, mais l'image est un extrait redondant de la précédente. |
| 10 | Vue Exécution | `A_REMPLACER` | Les valeurs sont dynamiques et ne sont pas rattachées au run validé; une capture actuelle est nécessaire. |
| 11 | Indicateurs temps réel | `OBSOLETE` | Extrait partiel redondant et tronqué. |
| 12 | Vue Globale | `A_REMPLACER` | La densité, les petites étiquettes et les identités affichées exigent une capture actuelle vérifiée. |
| 13 | Fenêtre de suivi temps réel | `A_REMPLACER` | Le journal montre un chemin et des valeurs d'un run non identifié, avec une formulation antérieure de la décision de stock. |
| 14 | Fenêtre des stocks initiaux | `A_REMPLACER` | Le dialogue existe encore, mais la capture mêle la fenêtre et un arrière-plan de configuration particulier. |
| 15 | Contrôle des commandes | `REUTILISABLE` | Les champs et options correspondent à la fenêtre actuelle. Les valeurs ne doivent être présentées que comme exemple. |
| 16 | Temps et budgets | `REUTILISABLE` | La fenêtre correspond aux paramètres actuels; les nombres sont des valeurs d'exemple. |
| 17 | Retours et qualité | `REUTILISABLE` | Les options visibles restent présentes dans le modèle. |
| 18 | Paramètres d'animation | `REUTILISABLE` | Les options visibles restent présentes dans le modèle. |

### Bilan des captures

| Classement | Nombre |
|---|---:|
| `REUTILISABLE` | 6 |
| `A_RECROPPER` | 5 |
| `A_REMPLACER` | 5 |
| `OBSOLETE` | 2 |

## Incohérences majeures établies

1. L'ancien découpage des ruptures en « MTO partiel » et « MTO complet » ne correspond plus au pilotage consolidé. Le flux client reste `CMD_*`; la reconstitution autonome du stock utilise `REAPPRO_*`.
2. Le chapitre VSM précède le correctif qui mesure les temps par ledger de commande. Les anciennes formules ne doivent pas être transférées.
3. Le chapitre de résultats annonce encore un run final à venir alors qu'un run VSM validé est maintenant archivé.
4. Le DOCX présente le suivi temps réel comme une vue dans certaines listes. L'ALP contient huit zones de vue et une fenêtre de suivi accessible depuis chacune.
5. Les captures de résultats dynamiques ne sont pas des preuves du run validé.
6. Le chapitre JSON ne rend pas visible l'asymétrie actuelle entre le JSON fourni, qui a 13 blocs racine, et la sauvegarde du modèle, qui ajoute `responsabilites`.
7. Les termes de génération, de release et de baseline appartiennent au processus de développement et n'ont pas de place dans le guide final.

