# Checklist des captures d'interface

## Règles de production

Les captures doivent provenir de `SCONTO_SVU_FINAL_VALIDATED.alp`. Une image ancienne peut aider au cadrage, mais ne doit pas être intégrée sans comparaison avec l'interface courante. Aucun écran ne doit être redessiné ou reconstitué.

Avant chaque capture, ouvrir la vue ou la fenêtre demandée, utiliser une configuration contrôlée et masquer toute information personnelle ou chemin local inutile. Conserver la résolution native, éviter les découpes qui retirent le titre ou le contexte et ne pas redimensionner le texte dans un logiciel d'image.

Les zooms annotés sont produits seulement après validation de la capture source. Les annotations doivent désigner des zones existantes sans ajouter de bouton, de valeur ou d'état.

## Captures à réaliser

| ID | Chapitre | Nom du fichier | Vue ou fenêtre | État à afficher | Éléments obligatoires | Éléments à éviter | Ancienne capture disponible | Statut |
|---|---:|---|---|---|---|---|---|---|
| DOC-B01 | 11 | `ui_navigation.png` | Navigation des vues principales | Vue stable, sans fenêtre superposée | Six destinations communes et accès aux vues secondaires lisibles | Découpe d'une destination, boîte de développement | Oui, image 1 | `VALIDE` |
| DOC-B02 | 12 | `ui_configuration.png` | Configuration | Configuration chargée, aucune exécution active | Vue complète avec postes, scénarios, pondérations et JSON | Résultat d'une ancienne exécution, chemin personnel | Oui, image 2 | `VALIDE` |
| DOC-C01 | 12 | `ui_configuration_annotee.png` | Configuration annotée | Dérivé validé de DOC-B02 | Repères des zones de création et de sélection | Annotation sans contrôle réel, ajout décoratif | Non | `VALIDE` |
| DOC-B03 | 12 | `ui_poids_attributs.png` | Configuration, pondération des attributs | Configuration chargée, valeurs cohérentes | Champs RL, RS, AG, CO, AM et commande d'application | Valeurs présentées comme résultats | Oui, image 6 | `VALIDE` |
| DOC-B04 | 12 | `ui_poids_n3.png` | Configuration, pondération N3 | Liste N3 rafraîchie | Métrique, poids et quatre commandes de gestion | Conclusion induite par la métrique choisie | Oui, image 7 | `VALIDE` |
| DOC-B05 | 12 | `ui_logistique.png` | Logistique | Vue ouverte avec formulaire disponible | Champs acteur et commandes d'ajout et de contrôle | Donnée personnelle ou organisation non autorisée | Non | `VALIDE` |
| DOC-B06 | 12 | `ui_responsabilites_machines.png` | Responsabilités et Machines | Acteurs et postes déjà chargés | Champs de responsabilité et de machine, commandes visibles | Affectation incohérente, fenêtre masquant des champs | Non | `VALIDE` |
| DOC-B07 | 13 | `ui_nomenclature.png` | Nomenclature et matières | Produit, matières et fournisseurs chargés | Vue complète avec les quatre zones | Icône ou fenêtre de développement | Oui, images 8 et 9 | `VALIDE` |
| DOC-C02 | 13 | `ui_nomenclature_annotee.png` | Nomenclature annotée | Dérivé validé de DOC-B07 | Repères composition, fiche, approvisionnement et consommation | Confusion entre les deux commandes Appliquer | Non | `VALIDE` |
| DOC-B21 | 13 | `ui_fiche_matiere.png` | Nomenclature, fiche matière | Une matière sélectionnée | Identifiant, stocks, délai et fournisseur lisibles | Valeurs présentées comme résultats | Oui, partielle dans les images 8 et 9 | `VALIDE` |
| DOC-B22 | 14 | `ui_json_zone.png` | Configuration, zone JSON | Aucune exécution active | Nom d'entreprise, sauvegarde et chargement directs | Chemin local ou nom contenant une donnée personnelle | Non identifiée | `VALIDE` |
| DOC-B23 | 14 | `ui_json_liste.png` | Configuration, liste JSON | Liste rafraîchie, fichier sélectionné | Liste, sélection et deux commandes dédiées | Fichier non archivé ou donnée sensible | Non identifiée | `VALIDE` |
| DOC-B24 | 14 | `ui_json_charge.png` | Configuration après chargement | Chargement réussi d'un fichier contrôlé | Message de confirmation et contexte suffisant | Boîte reconstituée, message sans fichier traçable | Non identifiée | `VALIDE` |
| DOC-B08 | 15 | `ui_controle_commandes.png` | Contrôle commandes | Fenêtre ouverte avant lancement | Limite, intervalles, quantités et messages visibles | Valeur présentée comme observation | Oui, image 15 | `VALIDE` |
| DOC-B09 | 15 | `ui_temps_budgets.png` | Temps et budgets | Fenêtre ouverte avant lancement | Date, échelle, budgets et cases d'activation | Unité coupée, montant illisible | Oui, image 16 | `VALIDE` |
| DOC-B10 | 15 | `ui_retours_qualite.png` | Retours et qualité | Cas nominal ou options explicitement relevées | Retours produit, retours matière et probabilités | Option active non signalée | Oui, image 17 | `VALIDE` |
| DOC-B11 | 15 | `ui_animation_parametres.png` | Animation | Fenêtre ouverte avant lancement | Mode lent, durées, pauses et vitesses | Association avec les temps métier | Oui, image 18 | `VALIDE` |
| DOC-B12 | 15 | `ui_stocks_initiaux.png` | Paramètres de stock initial | Valeurs contrôlées avant lancement | Stock produit fini et override global matière | Override non signalé, ancienne disposition | Oui, image 14 | `VALIDE` |
| DOC-B13 | 15 | `ui_profils_test.png` | Configuration, liste des scénarios | Liste rafraîchie, entrées ZENER CAS visibles | Entrées `SCENARIO DISTRIBUTION` et `ZENER CAS 1/2/3` lisibles | Légende affirmant une fenêtre Profils de test dédiée; le bouton `btnProfilsTest` existe dans le modèle mais sa visibilité à l'écran n'est pas confirmée, voir `CAPACITE_INTERNE_NON_EXPOSEE` au chapitre Maintenance | Non | `VALIDE` (légende corrigée pour décrire le mécanisme réel) |
| DOC-B14 | 15 | `ui_perturbations.png` | Perturbations | Cible fournisseur et matière contrôlée | Activation, cible, facteur, heures et application unique | Perturbation active non signalée | Non | `VALIDE` |
| DOC-B15 | 15 | `ui_suivi_temps_reel.png` | Suivi temps réel de la simulation | Exécution identifiée en cours | Titre, temps, nombre d'événements et colonnes lisibles | Donnée sensible, exécution non archivée | Oui, image 13 | `VALIDE` |
| DOC-B16 | 16 | `ui_execution.png` | Exécution | Simulation en cours ou arrêtée avec résultats calculés | Commandes de conduite, journal, WIP et temps simulé visibles | Résultat d'une exécution non identifiée | Oui, image 10 | `VALIDE` |
| DOC-B17 | 16 | `ui_vue_globale.png` | Vue Globale | Exécution active, chaîne complète affichée | Postes, acteurs et liaisons de l'ensemble du réseau | Fenêtre superposée masquant la chaîne | Oui, image 12 | `VALIDE` |
| DOC-B18 | 16 | `ui_hierarchie.png` | Hiérarchie | Vue ouverte, organisation holonique complète | Cinq niveaux de décision lisibles | Confusion avec un organigramme de personnes réelles | Non | `VALIDE` |
| DOC-B19 | 16 | `ui_structure_animee.png` | Structure animée | Exécution active, mouvements visibles | Flux physiques, véhicules et messages représentés | Interprétation de la vitesse comme une durée métier | Non | `VALIDE` |
| DOC-B25 | 17 | `ui_dashboard_global.png` | Exécution, dashboard global | Exécution close, résultats calculés | Indicateurs SCOR et PI de l'exécution identifiée | Optionnelle: le pipeline d'exports illustre déjà le principe | Non | `CAPTURE_A_FAIRE` |
| DOC-B26 | 17 | `ui_resultats_processus.png` | Exécution, KPI par micro-activité | Table ouverte pour un run identifié | Postes, temps et indicateurs par micro-activité | Optionnelle: non utilisée dans le corps de cette tranche | Non | `CAPTURE_A_FAIRE` |
| DOC-B27 | 17 | `ui_decisions_agents.png` | Exécution, décisions holoniques | Table ouverte pour un run identifié | Décisions et niveau de l'agent décideur | Optionnelle: non utilisée dans le corps de cette tranche | Non | `CAPTURE_A_FAIRE` |
| DOC-B28 | 17 | `ui_tracabilite.png` | Exécution, traçabilité | Table ouverte pour un run identifié | Chaîne d'événements reliés à une décision | Optionnelle: non utilisée dans le corps de cette tranche | Non | `CAPTURE_A_FAIRE` |

Les quatre dernières entrées (DOC-B25 à DOC-B28) restent optionnelles: le chapitre 17 s'appuie sur les diagrammes `pipeline_exports.png` et `artefacts_et_preuves.png` plutôt que sur une capture par export. Elles ne sont pas référencées dans le corps du chapitre pour cette tranche et pourront être ajoutées plus tard si une capture par table de résultats devient nécessaire.

Tous les fichiers doivent être placés dans `documentation/figures/screenshots/`.

## Validation avant intégration

Pour chaque fichier, le relecteur doit confirmer la provenance du modèle, le chapitre cible, la lisibilité à la largeur du document, l'exactitude des libellés, la cohérence de l'état affiché et l'absence de donnée sensible. Le statut ne passe à `VALIDE` qu'après ce contrôle et après une compilation du document avec l'image intégrée.
