# Plan de refonte de la documentation SCONTO-SVU

## Décision structurelle

Les 25 chapitres de l'ancien document ne sont pas repris comme sommaire. Leur contenu est redistribué en 20 chapitres et six annexes. Le cycle de commande, la politique de stock et les flux `CMD_*` et `REAPPRO_*` précèdent les détails ontologiques. La partie utilisateur occupe sept chapitres et constitue le coeur pratique du document.

## Structure cible

### Partie I. Comprendre le simulateur

1. **Présentation de SCONTO-SVU** : finalité, publics, périmètre et limites de lecture.
2. **Architecture générale** : modèle AnyLogic, chaîne logistique, agents, données, mesures et sorties.
3. **Chaîne logistique et données métier** : acteurs, produits, matières, postes, scénarios et relations.

### Partie II. Comprendre le fonctionnement

4. **Cycle de vie d'une commande** : émission `CMD_*`, décision sur stock, attente éventuelle, livraison et clôture.
5. **Stocks, besoins et réapprovisionnement** : nomenclature, besoin net, `REAPPRO_*`, Source, Make et crédit du stock fini.
6. **Processus Plan, Source, Make, Deliver et Return** : rôles des processus et enchaînement des micro-activités.
7. **Agents, décisions et communications AER** : hiérarchie consolidée, responsabilités, blackboard, messages et traçabilité.

### Partie III. Comprendre la mesure

8. **Mesures VSM** : événements, ledger de commande, temps VA et NVA, cycle, attente, WIP et takt.
9. **Métriques, SCOR et Performance Index** : valeur brute, échelles bottom/perfect, score, classes floues, attributs et PI.
10. **ISA-95, ontologie et traçabilité** : équipements, affectations, TBox, ABox et articulation avec les traces.

### Partie IV. Guide d'utilisation du simulateur

11. **Prise en main et navigation** : ouverture, huit vues réelles, fenêtre de suivi et parcours conseillé.
12. **Configurer une simulation** : micro-activités, acteurs, responsabilités, machines, scénarios, pondérations et perturbations.
13. **Nomenclature, matières et stocks** : composition, fiches matière, fournisseur, besoin net et postes consommateurs.
14. **Sauvegarder et charger une configuration JSON** : nom du fichier, liste, sauvegarde, chargement, contrôles et reconstruction.
15. **Lancer et suivre une simulation** : paramètres de commande, temps, budgets, profils, retours, animation, démarrage, arrêt et réinitialisation.
16. **Comprendre les vues et tableaux de bord** : Exécution, Vue Globale, Logistique, Hiérarchie, Structure animée et Responsabilités/Machines.
17. **Lire, exporter et archiver les résultats** : tableaux, CSV, Excel, ABox, statut de clôture et précautions d'interprétation.

### Partie V. Maintenance et reproduction

18. **Reproduire un scénario** : prérequis, contrôle des fichiers, sélection du scénario et séquence opératoire.
19. **Contrôles et validation** : validation structurelle, fonctionnelle, calculatoire et ontologique, avec séparation entre preuve et disponibilité.
20. **Maintenance et extension du modèle** : points d'extension, invariants, compatibilité JSON, contrôles et documentation des changements.

### Annexes

A. Structure JSON détaillée.
B. Catalogue des fonctions importantes.
C. Catalogue des agents.
D. Catalogue des métriques.
E. Référence des champs et commandes de l'interface.
F. Glossaire.

## Correspondance synthétique avec l'ancien document

| Ancien contenu | Destination principale | Traitement |
|---|---|---|
| Introduction et théorie générale | Chapitres 1, 6, 8 à 10 | Condenser et replacer après le fonctionnement métier. |
| Architecture, domaine et agents | Chapitres 2, 3 et 7 | Fusionner et actualiser la hiérarchie consolidée. |
| Flux SCOR, physiques et AER | Chapitres 4 à 7 | Réécrire autour de workflows et de séquences. |
| Stocks, MRP et commandes | Chapitres 4, 5 et 13 | Réécrire pour distinguer `CMD_*` et `REAPPRO_*`. |
| VSM, SCOR, PI et ontologies | Chapitres 8 à 10 | Actualiser depuis le correctif VSM et les preuves courantes. |
| Interface et utilisation | Chapitres 11 à 17 | Développer, sans réduire l'ancien chapitre 17. |
| Fonctions Java | Annexes B et C, chapitre 20 | Déplacer les détails techniques. |
| Exports et validation | Chapitres 17 et 19 | Actualiser avec les artefacts validés. |
| Résultats annoncés comme futurs | Chapitre 19 | Remplacer par les preuves archivées, sans inventer de nouveaux résultats. |
| Limites et reproduction | Chapitres 18 à 20 | Fusionner avec les contrôles opérationnels. |
| Références et glossaire | Annexe F et bibliographie future | Conserver uniquement les références déjà vérifiées. |

Le détail chapitre par chapitre figure dans `OLD_DOC_AUDIT.md`.

## Principes de rédaction par tranche

La première tranche recommandée couvre les chapitres 1 à 5. Elle établit le vocabulaire, l'architecture, les données métier et le cycle complet avant les explications normatives. La deuxième tranche couvre les chapitres 11 à 15, qui dépendent directement des inventaires UI et JSON déjà établis. Les mesures, l'ontologie, les sorties et la maintenance viennent ensuite.

## Frontière entre corps et annexes

Le corps explique les intentions, actions visibles, décisions métier et preuves. Les annexes donnent les identifiants, propriétés, types, valeurs de repli et fonctions. Une information nécessaire à l'utilisation ne doit pas être reléguée en annexe au seul motif qu'elle possède une implémentation Java.

