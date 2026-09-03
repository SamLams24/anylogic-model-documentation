# Matrice définitive de rédaction

## Rôle de la matrice

Cette matrice pilote la rédaction des 20 chapitres. Elle fixe la question à traiter, le niveau de détail, les preuves, les visuels et la frontière avec les annexes. La cible indicative est de 75 à 90 pages pour le corps et de 15 à 25 pages pour les annexes. Ces volumes ne justifient aucune répétition ni aucun remplissage.

## Partie I. Comprendre le simulateur

### Chapitre 1. Présentation de SCONTO-SVU

- **Objectif :** donner une compréhension immédiate de la finalité, du périmètre et des usages du simulateur.
- **Question principale :** à quoi sert SCONTO-SVU, à qui s'adresse-t-il et que permet-il d'établir ?
- **Lecteurs prioritaires :** responsables académiques, responsables de projet, démonstrateurs et nouveaux utilisateurs.
- **Niveau de technicité :** très accessible.
- **Concepts obligatoires :** finalité, périmètre, publics, simulation, configuration, exécution, preuve, limites.
- **Illustrations principales :** DOC-A01, finalité et publics.
- **Captures UI nécessaires :** aucune.
- **Tableaux éventuels :** publics, besoins et parcours de lecture, en un tableau court.
- **Encadrés utiles :** `BonASavoir` pour distinguer modèle et système réel; `AttentionDoc` pour la portée des résultats.
- **Sources principales :** `PROJECT_BRIEF.md`, rapport scientifique final, `MODEL_EVOLUTION.md`.
- **À laisser aux annexes :** versions, classes, fonctions, champs et formats de fichiers.
- **Longueur cible :** 2 à 3 pages.

### Chapitre 2. Architecture générale

- **Objectif :** montrer comment configuration, chaîne logistique, agents, exécution, mesure et sorties s'articulent.
- **Question principale :** quels composants coopèrent pour faire fonctionner le simulateur ?
- **Lecteurs prioritaires :** tous les publics.
- **Niveau de technicité :** accessible à intermédiaire.
- **Concepts obligatoires :** configuration JSON, données métier, agents, flux physique, flux informationnel, exécution, mesure, vues et exports.
- **Illustrations principales :** DOC-A02 et DOC-A03, architecture générale et trois flux.
- **Captures UI nécessaires :** aucune.
- **Tableaux éventuels :** composants, responsabilités et sorties, uniquement si la comparaison aide la lecture.
- **Encadrés utiles :** `BonASavoir` sur la distinction entre animation et flux métier.
- **Sources principales :** ALP validé, chapitres 3, 4 et 5 du rapport scientifique, `MODEL_EVOLUTION.md`.
- **À laisser aux annexes :** graphe d'appels, signatures, classes et détails du format ALP.
- **Longueur cible :** 3 à 4 pages.

### Chapitre 3. Chaîne logistique et données métier

- **Objectif :** définir les objets manipulés et leurs relations avant d'expliquer l'exécution.
- **Question principale :** quelles données décrivent la chaîne, les produits et les opérations ?
- **Lecteurs prioritaires :** responsables académiques, utilisateurs et développeurs.
- **Niveau de technicité :** accessible à intermédiaire.
- **Concepts obligatoires :** acteurs, produits, matières, postes, machines, scénarios, gammes, nomenclatures, prédécesseurs et affectations.
- **Illustrations principales :** DOC-A04 et DOC-A05, chaîne des acteurs et classes métier simplifiées.
- **Captures UI nécessaires :** aucune dans ce chapitre; les vues correspondantes sont traitées aux chapitres 12 et 13.
- **Tableaux éventuels :** catégories d'acteurs et principaux objets métier.
- **Encadrés utiles :** `ExempleDoc` pour suivre un produit à travers une gamme.
- **Sources principales :** JSON courant, ALP validé, chapitre 2 du rapport scientifique.
- **À laisser aux annexes :** propriétés JSON détaillées, cardinalités et identifiants techniques.
- **Longueur cible :** 3 à 4 pages.

## Partie II. Comprendre le fonctionnement

### Chapitre 4. Cycle de vie d'une commande

- **Objectif :** expliquer le système depuis le point de vue d'une commande cliente externe.
- **Question principale :** que devient une commande entre son émission et sa clôture ?
- **Lecteurs prioritaires :** tous les publics, en particulier responsables académiques et démonstrateurs.
- **Niveau de technicité :** accessible, avec une séquence précise.
- **Concepts obligatoires :** émission `CMD_*`, prise en charge, analyse du stock, attente, réveil, réservation, Deliver et clôture.
- **Illustrations principales :** DOC-A06 et DOC-A07, diagramme d'activité UML et diagramme de séquence CMD.
- **Captures UI nécessaires :** aucune.
- **Tableaux éventuels :** états de commande, événement déclencheur et sortie attendue.
- **Encadrés utiles :** `AttentionDoc` pour rappeler qu'une commande en attente n'est pas un ordre de fabrication.
- **Sources principales :** ALP validé, traces du run validé, chapitre 4 du rapport scientifique.
- **À laisser aux annexes :** noms de méthodes, états internes exhaustifs et classes de messages.
- **Longueur cible :** 4 à 5 pages.

### Chapitre 5. Stocks, besoins et réapprovisionnement

- **Objectif :** rendre intelligible la politique Make-to-Stock consolidée et le réapprovisionnement autonome.
- **Question principale :** comment le modèle réagit-il à un stock insuffisant sans transformer la commande cliente en commande de production ?
- **Lecteurs prioritaires :** responsables académiques, utilisateurs, démonstrateurs et mainteneurs métier.
- **Niveau de technicité :** intermédiaire.
- **Concepts obligatoires :** stock de sécurité, ROP, EOQ, besoin net, distinction `CMD_*` et `REAPPRO_*`, Source, Make, crédit du stock et réveil de la commande.
- **Illustrations principales :** DOC-A08 à DOC-A11, distinction CMD/REAPPRO, décision de stock et séquence de reconstitution.
- **Captures UI nécessaires :** aucune; les réglages sont expliqués au chapitre 13.
- **Tableaux éventuels :** comparaison commande cliente et ordre interne; paramètres de politique de stock.
- **Encadrés utiles :** `BonASavoir` sur Make-to-Stock; `ExempleDoc` avec une rupture sans valeur prétendument observée.
- **Sources principales :** ALP validé, JSON courant, `MODEL_EVOLUTION.md`, chapitres 4 et 5 du rapport.
- **À laisser aux annexes :** fonctions de calcul, noms de variables et propriétés JSON exhaustives.
- **Longueur cible :** 4 à 5 pages.

### Chapitre 6. Plan, Source, Make, Deliver et Return

- **Objectif :** décrire le fonctionnement des cinq processus dans le modèle avant leur positionnement normatif.
- **Question principale :** comment les opérations s'enchaînent-elles pour traiter les flux nominaux et les retours ?
- **Lecteurs prioritaires :** responsables académiques, utilisateurs et démonstrateurs.
- **Niveau de technicité :** intermédiaire.
- **Concepts obligatoires :** Plan, Source, Make, Deliver, Return, micro-activités, prédécesseurs, jonctions, lots, aiguillages et chemins alternatifs.
- **Illustrations principales :** DOC-A12 et DOC-A13, workflow SCOR et graphe des micro-activités.
- **Captures UI nécessaires :** aucune.
- **Tableaux éventuels :** processus, entrée, décision et sortie.
- **Encadrés utiles :** `AttentionDoc` sur l'association entre fonctionnement du modèle et vocabulaire SCOR.
- **Sources principales :** ALP validé, JSON courant, chapitre 4 du rapport.
- **À laisser aux annexes :** catalogue complet des codes N3 et N4.
- **Longueur cible :** 4 à 5 pages.

### Chapitre 7. Agents, décisions et communications AER

- **Objectif :** expliquer qui décide, qui exécute et comment les communications sont tracées.
- **Question principale :** comment la hiérarchie d'agents transforme-t-elle un événement en décision, exécution et compte rendu ?
- **Lecteurs prioritaires :** responsables académiques, démonstrateurs et développeurs.
- **Niveau de technicité :** intermédiaire.
- **Concepts obligatoires :** Strategic, Tactical, Coordinator, OperationalPilot, OperationalExecution, Machine, blackboard, responsabilités et phases AMENDMENT, EXECUTION et REPORT.
- **Illustrations principales :** DOC-A14 à DOC-A16, hiérarchie, séquence AER et traçabilité du blackboard.
- **Captures UI nécessaires :** vue Hiérarchie au chapitre 16, sans duplication ici.
- **Tableaux éventuels :** niveau, responsabilité, décision et trace produite.
- **Encadrés utiles :** `BonASavoir` sur la classification AER sans expansion non prouvée de l'acronyme.
- **Sources principales :** ALP validé, ABox validée, traces runtime et chapitre 5 du rapport.
- **À laisser aux annexes :** classes, héritages, signatures, identifiants et alias historiques.
- **Longueur cible :** 4 à 5 pages.

## Partie III. Comprendre la mesure

### Chapitre 8. Mesures VSM

- **Objectif :** expliquer la construction temporelle des mesures depuis les événements observés.
- **Question principale :** comment le modèle produit-il des mesures VSM traçables pour le périmètre ZENER ACT_4 ?
- **Lecteurs prioritaires :** responsables académiques, analystes et développeurs.
- **Niveau de technicité :** intermédiaire à avancé.
- **Concepts obligatoires :** registre temporel par commande, périmètre ACT_4, cycle, attente, lead time, VA, NVA, WIP, débit, takt et PCE estimé.
- **Illustrations principales :** DOC-A17 à DOC-A19, ledger, calcul VA/NVA et relations WIP/débit/takt.
- **Captures UI nécessaires :** aucune.
- **Tableaux éventuels :** mesure, événement source, unité, périmètre et niveau de preuve.
- **Encadrés utiles :** `AttentionDoc` sur l'estimation du PCE et le périmètre de mesure.
- **Sources principales :** `VSM_FIX_IMPLEMENTATION.md`, run VSM validé, ALP validé et chapitre 6 du rapport.
- **À laisser aux annexes :** formules auxiliaires, champs d'export et catalogue exhaustif.
- **Longueur cible :** environ 4 pages.

### Chapitre 9. Métriques, SCOR et Performance Index

- **Objectif :** montrer chaque transformation entre une mesure brute et le PI.
- **Question principale :** comment une valeur mesurée devient-elle un score, un attribut puis un indice global ?
- **Lecteurs prioritaires :** responsables académiques, analystes et développeurs.
- **Niveau de technicité :** avancé mais pédagogique.
- **Concepts obligatoires :** valeur brute, Bottom/Perfect, direction, normalisation, logique floue, RL, RS, AG, CO, AM, poids, PI, AHP diagnostique et AHP goulot.
- **Illustrations principales :** DOC-A20 à DOC-A22, pipeline, échelle et deux usages AHP.
- **Captures UI nécessaires :** poids du PI et poids N3 au chapitre 12.
- **Tableaux éventuels :** métriques officielles, associations internes, proxies et approximations; profils de normalisation.
- **Encadrés utiles :** `AttentionDoc` sur les proxies; `ExempleDoc` limité à l'autotest déjà présent dans le modèle.
- **Sources principales :** ALP validé, JSON courant, run validé et chapitre 7 du rapport.
- **À laisser aux annexes :** catalogue complet des métriques et propriétés des profils.
- **Longueur cible :** environ 5 pages.

### Chapitre 10. ISA-95, ontologie et traçabilité

- **Objectif :** relier l'organisation des équipements aux traces du run et aux ontologies du projet.
- **Question principale :** comment une activité simulée est-elle rattachée à un équipement et à une preuve ontologique ?
- **Lecteurs prioritaires :** responsables académiques, analystes ontologiques et développeurs.
- **Niveau de technicité :** intermédiaire à avancé.
- **Concepts obligatoires :** hiérarchie ISA-95, 190 noeuds, 71 affectations, TBox, ABox, `executedAt`, namespaces et traçabilité runtime.
- **Illustrations principales :** DOC-A23 à DOC-A25, hiérarchie, affectations et articulation TBox/ABox/run.
- **Captures UI nécessaires :** aucune.
- **Tableaux éventuels :** niveaux d'équipement et relations de preuve.
- **Encadrés utiles :** `BonASavoir` sur la différence entre modèle conceptuel et individus runtime.
- **Sources principales :** JSON courant, ALP validé, ontologies et ABox validée, chapitre 3 du rapport.
- **À laisser aux annexes :** inventaire des 190 noeuds, propriétés RDF et fonctions d'export.
- **Longueur cible :** environ 4 pages.

## Partie IV. Guide d'utilisation du simulateur

### Chapitre 11. Prise en main et navigation

- **Objectif :** permettre à un lecteur non développeur de se repérer avant toute modification.
- **Question principale :** où aller dans le simulateur selon la tâche à accomplir ?
- **Lecteurs prioritaires :** utilisateurs, démonstrateurs et responsables académiques.
- **Niveau de technicité :** très accessible.
- **Concepts obligatoires :** huit vues, barre de navigation, vue contre fenêtre, suivi temps réel et parcours selon l'objectif.
- **Illustrations principales :** DOC-A26 et DOC-B01, parcours utilisateur et capture de navigation.
- **Captures UI nécessaires :** barre de navigation complète et actuelle.
- **Tableaux éventuels :** huit vues, objectif et moment d'utilisation.
- **Encadrés utiles :** `EnPratique` avec un premier parcours sans lancement.
- **Sources principales :** ALP validé et `UI_INVENTORY.md`.
- **À laisser aux annexes :** identifiants de vues et de boutons.
- **Longueur cible :** 3 à 4 pages.

### Chapitre 12. Configurer une simulation

- **Objectif :** guider la construction et la modification d'une configuration métier.
- **Question principale :** comment définir acteurs, opérations, scénarios, ressources, poids et perturbations sans rendre la configuration incohérente ?
- **Lecteurs prioritaires :** utilisateurs et démonstrateurs.
- **Niveau de technicité :** accessible, avec précautions métier.
- **Concepts obligatoires :** acteurs, micro-activités, scénarios, gammes, responsabilités, machines, poids du PI, poids N3 et perturbations.
- **Illustrations principales :** DOC-B02 à DOC-B06 et DOC-C01.
- **Captures UI nécessaires :** Configuration, Configuration annotée, poids PI, poids N3, Logistique et Responsabilités/Machines.
- **Tableaux éventuels :** champs par zone et commandes par objectif, sans recopier l'annexe E.
- **Encadrés utiles :** `EnPratique` pour l'ordre de configuration; `AttentionDoc` avant toute suppression globale.
- **Sources principales :** ALP validé, JSON courant et `UI_INVENTORY.md`.
- **À laisser aux annexes :** identifiants techniques, valeurs de repli exhaustives et actions internes.
- **Longueur cible :** 6 à 8 pages.

Chaque zone répondra successivement à cinq questions : ce que l'utilisateur voit, ce qu'il peut modifier, l'utilité du réglage, le moment de modification et la précaution associée.

### Chapitre 13. Nomenclature, matières et stocks

- **Objectif :** guider la définition complète des besoins matière.
- **Question principale :** comment relier un produit à ses matières, stocks, fournisseurs et postes consommateurs ?
- **Lecteurs prioritaires :** utilisateurs, démonstrateurs et responsables métier.
- **Niveau de technicité :** accessible à intermédiaire.
- **Concepts obligatoires :** produit, matière, quantité par unité, fiche matière, stock disponible, stock de sécurité, délai, fournisseur, mode MRP et poste consommateur.
- **Illustrations principales :** DOC-B07 et DOC-C02, vue complète et zoom des quatre zones.
- **Captures UI nécessaires :** vue Nomenclature actuelle, zoom annoté et fiche matière lisible.
- **Tableaux éventuels :** ordre des actions et effets des quatre zones.
- **Encadrés utiles :** `EnPratique` pour le parcours produit vers poste consommateur; `AttentionDoc` sur les identifiants cohérents.
- **Sources principales :** ALP validé, JSON courant, `UI_INVENTORY.md` et chapitre 5 du rapport.
- **À laisser aux annexes :** propriétés des objets et identifiants de contrôles.
- **Longueur cible :** 5 à 6 pages.

### Chapitre 14. Sauvegarder et charger une configuration JSON

- **Objectif :** rendre les deux workflows sûrs et compréhensibles sans faire du corps une spécification informatique.
- **Question principale :** que conserve un fichier JSON, comment l'enregistrer ou le charger, et que faut-il contrôler ensuite ?
- **Lecteurs prioritaires :** utilisateurs, démonstrateurs, responsables de projet et développeurs.
- **Niveau de technicité :** accessible dans le corps, avancé en annexe A.
- **Concepts obligatoires :** configuration contre état runtime, nom de fichier, sauvegarde, détection, rafraîchissement, sélection, chargement, nettoyage, reconstruction, contrôles, 13 blocs courants et bloc `responsabilites` ajouté à la sauvegarde.
- **Illustrations principales :** DOC-A27 à DOC-A30.
- **Captures UI nécessaires :** zone JSON réelle de Configuration.
- **Tableaux éventuels :** contenu sauvegardé, contenu non sauvegardé et éléments reconstruits.
- **Encadrés utiles :** `AttentionDoc` sur l'absence de reprise d'un run; `EnPratique` pour sauvegarder puis recharger.
- **Sources principales :** ALP validé, JSON courant et `JSON_WORKFLOW_AUDIT.md`.
- **À laisser aux annexes :** propriétés, types, cardinalités, valeurs de repli et fonctions de conversion.
- **Longueur cible :** 6 à 8 pages.

### Chapitre 15. Lancer et suivre une simulation

- **Objectif :** donner une procédure chronologique avant, pendant et à la fin d'un run.
- **Question principale :** quels réglages vérifier, quelles informations suivre et comment terminer proprement ?
- **Lecteurs prioritaires :** utilisateurs et démonstrateurs.
- **Niveau de technicité :** très accessible.
- **Concepts obligatoires :** commandes, quantités, stocks, temps, budgets, profils, retours, perturbations, animation, démarrage, journal, WIP, suivi temps réel, arrêt, clôture et réinitialisation.
- **Illustrations principales :** captures DOC-B08 à DOC-B15.
- **Captures UI nécessaires :** commandes, temps et budgets, retours, animation, stocks, profils, perturbations et suivi temps réel.
- **Tableaux éventuels :** checklist avant lancement et comparaison arrêt, clôture et réinitialisation.
- **Encadrés utiles :** `EnPratique` pour un lancement contrôlé; `AttentionDoc` sur les options non nominales.
- **Sources principales :** ALP validé, `UI_INVENTORY.md`, rapport final et artefacts du run validé.
- **À laisser aux annexes :** fonctions d'ouverture des fenêtres et identifiants internes.
- **Longueur cible :** 6 à 8 pages.

### Chapitre 16. Comprendre les vues et tableaux de bord

- **Objectif :** apprendre à lire chaque vue de consultation sans surinterpréter l'animation ou les indicateurs.
- **Question principale :** que montre chaque vue, quelles actions propose-t-elle et quelles précautions de lecture s'appliquent ?
- **Lecteurs prioritaires :** utilisateurs, démonstrateurs et responsables académiques.
- **Niveau de technicité :** accessible.
- **Concepts obligatoires :** Exécution, Vue Globale, Logistique, Hiérarchie, Structure animée, Responsabilités/Machines et fenêtre de suivi temps réel.
- **Illustrations principales :** DOC-B16 à DOC-B19, DOC-C03, DOC-C04 et DOC-B15.
- **Captures UI nécessaires :** une capture actuelle par vue citée, plus les deux zooms annotés et la fenêtre de suivi.
- **Tableaux éventuels :** actions disponibles par vue et signification des principaux indicateurs.
- **Encadrés utiles :** `BonASavoir` sur la différence entre état métier et cadence visuelle; `AttentionDoc` sur les valeurs dynamiques.
- **Sources principales :** ALP validé, `UI_INVENTORY.md` et captures actuelles à réaliser.
- **À laisser aux annexes :** identifiants de contrôles, familles de fonctions et inventaire complet des tables.
- **Longueur cible :** 8 à 10 pages.

Chaque fiche de vue suit le même ordre : nom, utilité, moment d'utilisation, capture, zones principales, informations consultables, actions disponibles, lecture des indicateurs et précautions.

### Chapitre 17. Lire, exporter et archiver les résultats

- **Objectif :** relier une question d'analyse à la bonne sortie et à une procédure d'archivage.
- **Question principale :** où trouver une information, comment l'exporter et comment préserver sa traçabilité ?
- **Lecteurs prioritaires :** utilisateurs, responsables académiques, analystes et développeurs.
- **Niveau de technicité :** intermédiaire.
- **Concepts obligatoires :** événements, postes, performance, décisions, calculs, CSV, Excel, ABox, runId, arrêt manuel, clôture métier et archivage.
- **Illustrations principales :** DOC-B20, DOC-A31 et DOC-A32.
- **Captures UI nécessaires :** tables de résultats provenant d'un run identifié.
- **Tableaux éventuels :** question, écran ou artefact, granularité et preuve produite.
- **Encadrés utiles :** `AttentionDoc` sur la différence entre affichage et artefact archivé.
- **Sources principales :** ALP validé, artefacts runtime validés, registre des sources et chapitre 8 du rapport.
- **À laisser aux annexes :** schéma détaillé des feuilles, colonnes, classes RDF et fonctions d'export.
- **Longueur cible :** 5 à 6 pages.

## Partie V. Maintenance et reproduction

### Chapitre 18. Reproduire un scénario

- **Objectif :** fournir une procédure contrôlable depuis les sources jusqu'à l'archive.
- **Question principale :** comment reproduire un scénario sans perdre la correspondance entre modèle, configuration et résultats ?
- **Lecteurs prioritaires :** démonstrateurs, responsables de projet et développeurs.
- **Niveau de technicité :** intermédiaire.
- **Concepts obligatoires :** sources, build, JSON, contrôles, configuration, exécution, exports et archivage.
- **Illustrations principales :** DOC-A33, diagramme d'activité de reproduction.
- **Captures UI nécessaires :** aucune nouvelle; renvois vers les chapitres 14 à 17.
- **Tableaux éventuels :** checklist de préparation et éléments d'une archive.
- **Encadrés utiles :** `EnPratique` avec la séquence minimale reproductible.
- **Sources principales :** `SOURCE_REGISTER.md`, rapports de vérification, ALP validé et chapitre 8 du rapport.
- **À laisser aux annexes :** commandes de développement spécifiques et formats détaillés.
- **Longueur cible :** environ 4 pages.

### Chapitre 19. Contrôles et validation

- **Objectif :** donner un vocabulaire probatoire précis et une chaîne de validation reproductible.
- **Question principale :** qu'est-ce qui est implémenté, observé, calculatoirement vérifié ou seulement disponible ?
- **Lecteurs prioritaires :** responsables académiques, responsables de projet et développeurs.
- **Niveau de technicité :** intermédiaire à avancé.
- **Concepts obligatoires :** validation structurelle, fonctionnelle, calculatoire, ontologique, observation runtime, disponibilité sans validation quantitative et chaîne de preuves.
- **Illustrations principales :** DOC-A34, niveaux de validation.
- **Captures UI nécessaires :** aucune.
- **Tableaux éventuels :** fonction, preuve, statut, limite et artefact.
- **Encadrés utiles :** `AttentionDoc` sur l'existence d'une fonction qui ne vaut pas validation expérimentale.
- **Sources principales :** `MODEL_VERIFICATION.md`, `RUN_VERIFICATION.md`, `VSM_FIX_IMPLEMENTATION.md` et artefacts validés.
- **À laisser aux annexes :** inventaires techniques exhaustifs et contrôles ligne par ligne.
- **Longueur cible :** 4 à 5 pages.

### Chapitre 20. Maintenance et extension du modèle

- **Objectif :** encadrer une évolution sans casser les invariants métier, probatoires ou documentaires.
- **Question principale :** comment modifier le modèle, son interface ou son JSON tout en préservant la cohérence ?
- **Lecteurs prioritaires :** développeurs et responsables de maintenance.
- **Niveau de technicité :** avancé.
- **Concepts obligatoires :** invariants, points d'extension, compatibilité JSON, ajout d'agents, évolution UI, tests, migration et mise à jour documentaire.
- **Illustrations principales :** DOC-A35, composants et invariants.
- **Captures UI nécessaires :** aucune.
- **Tableaux éventuels :** type d'évolution, impacts, contrôles et documents à mettre à jour.
- **Encadrés utiles :** `AttentionDoc` sur l'identité des agents, les flux `CMD_*` et `REAPPRO_*`, le ledger VSM et la compatibilité des blocs JSON.
- **Sources principales :** ALP validé, `MODEL_EVOLUTION.md`, politiques de source et rapports de vérification.
- **À laisser aux annexes :** catalogue de fonctions, classes, champs UI et schémas JSON.
- **Longueur cible :** 4 à 5 pages.

## Contenu des annexes

- **Annexe A :** blocs JSON, propriétés, types, cardinalités, valeurs de repli, 13 blocs du fichier courant, bloc `responsabilites` produit par sauvegarde et asymétrie documentée.
- **Annexe B :** catalogue des fonctions importantes, groupé par responsabilité.
- **Annexe C :** catalogue des agents, rôles, identités et messages.
- **Annexe D :** catalogue des métriques, unités, sources, transformations et statuts.
- **Annexe E :** référence exhaustive de l'interface avec vue, libellé, type utilisateur, identifiant technique, rôle, valeur, effet et précaution.
- **Annexe F :** glossaire des termes effectivement employés.

## Gabarit d'un champ utilisateur

### Champ « Quantité fixe »

Le champ permet de définir le nombre d'unités demandé pour chaque commande lorsque l'option de quantité fixe est activée.

**Quand l'utiliser :** pour comparer plusieurs exécutions avec une demande identique.

**Exemple :** 20 signifie que chaque commande porte sur 20 unités.

**Attention :** si l'option de quantité fixe n'est pas activée, les valeurs minimale et maximale sont utilisées.

Le corps ne donne pas le nom de variable. L'identifiant technique figure seulement en annexe E.

## Gabarit d'un bouton

### Bouton « Rafraîchir la liste »

Recherche à nouveau les configurations JSON disponibles et actualise la liste affichée.

**Quand l'utiliser :** lorsqu'un nouveau fichier vient d'être ajouté ou sauvegardé.

La fonction appelée et l'identifiant du contrôle figurent en annexe E.

## Choix des diagrammes

- Un workflow ou une décision utilise un diagramme d'activité UML.
- Des échanges entre acteurs ou agents utilisent un diagramme de séquence UML.
- Des relations entre objets utilisent un diagramme de classes.
- Une organisation hiérarchique utilise un arbre ou un diagramme de classes.
- L'architecture globale utilise un diagramme de composants.

Le choix repose sur la relation à comprendre. La notation UML n'est pas un objectif en elle-même.

## Parcours de lecture

Le parcours court destiné à un responsable académique est : chapitres 1, 2, 4, 5, 7, 11, 14, 15 et 16.

Le parcours développeur est : chapitres 1 à 10, puis 18 à 20, puis annexes A à E.
