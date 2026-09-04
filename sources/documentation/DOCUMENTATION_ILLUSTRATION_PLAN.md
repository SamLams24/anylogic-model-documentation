# Plan des illustrations de la documentation

## Principes

Le plan distingue les schémas pédagogiques générés, les captures réelles et les zooms annotés. Les schémas de flux privilégient des diagrammes d'activité ou de séquence. Les relations structurelles utilisent un diagramme de classes ou une hiérarchie. Aucune capture ne sera reconstituée artificiellement.

Les statuts autorisés sont `A_GENERER`, `CAPTURE_EXISTANTE_A_VALIDER`, `CAPTURE_A_REALISER` et `VALIDE`. Le statut `VALIDE` ne sera attribué qu'après production et contrôle du fichier.

## Registre

| ID | Chapitre | Concept | Type d'illustration | Source | Statut | Preuve nécessaire | Futur fichier |
|---|---:|---|---|---|---|---|---|
| DOC-A01 | 1 | Finalité et publics du simulateur | Schéma pédagogique | Brief et rapport final | `VALIDE` | Périmètre vérifié | `figures/finalite_publics.png` |
| DOC-A02 | 2 | Architecture générale | Diagramme de composants simplifié | ALP validé | `VALIDE` | Couches et sorties de `Main` | `figures/architecture_generale.png` |
| DOC-A03 | 2 | Flux physique, informationnel et probatoire | Diagramme d'activité | ALP et rapport | `VALIDE` | Fonctions de flux et exports | `figures/trois_flux.png` |
| DOC-A04 | 3 | Acteurs de la chaîne ZENER | Carte de chaîne logistique | JSON courant | `VALIDE` | Cinq acteurs courants | `figures/chaine_acteurs.png` |
| DOC-A05 | 3 | Relations produit, scénario, poste et matière | Diagramme de classes métier | ALP et JSON | `VALIDE` | Propriétés persistées | `figures/modele_donnees_metier.png` |
| DOC-A06 | 4 | Cycle de vie d'une commande | Diagramme d'activité UML | ALP validé | `VALIDE` | États et fonctions de commande | `figures/cycle_commande.png` |
| DOC-A07 | 4 | Échanges d'une commande cliente | Diagramme de séquence UML | ALP et traces validées | `VALIDE` | Ordre des messages `CMD_*` | `figures/sequence_commande_client.png` |
| DOC-A08 | 5 | Distinction `CMD_*` et `REAPPRO_*` | Diagramme d'activité | ALP validé | `VALIDE` | Politique autonome consolidée | `figures/cmd_reappro.png` |
| DOC-A09 | 5 | Décision de service depuis le stock fini | Arbre de décision | ALP validé | `VALIDE` | Conditions de stock et attente | `figures/decision_stock_fini.png` |
| DOC-A10 | 5 | Besoin net matière | Diagramme de calcul | ALP et JSON | `VALIDE` | Nomenclature, stock et sécurité | `figures/besoin_net_matiere.png` |
| DOC-A11 | 5 | Reconstitution du stock fini | Diagramme de séquence UML | ALP validé | `VALIDE` | Source, Make, crédit, réveil | `figures/sequence_reconstitution_stock.png` |
| DOC-A12 | 6 | Enchaînement Plan, Source, Make, Deliver, Return | Diagramme d'activité | ALP et JSON | `A_GENERER` | Codes et séquences courants | `figures/workflow_scor.png` |
| DOC-A13 | 6 | Micro-activités et jonctions | Graphe pédagogique | JSON courant | `A_GENERER` | Prédécesseurs et tailles de lot | `figures/graphe_micro_activites.png` |
| DOC-A14 | 7 | Hiérarchie des agents consolidée | Diagramme de classes ou hiérarchie | ALP et ABox | `A_GENERER` | Identités sans alias historique | `figures/hierarchie_agents.png` |
| DOC-A15 | 7 | Conversation AER | Diagramme de séquence UML | ALP, traces et ABox | `A_GENERER` | Émetteur, destinataire et ordre des messages | `figures/sequence_aer.png` |
| DOC-A16 | 7 | Décision, blackboard et traçabilité | Diagramme d'activité | ALP validé | `A_GENERER` | Points d'écriture et de lecture | `figures/blackboard_tracabilite.png` |
| DOC-A17 | 8 | Ledger VSM par commande | Ligne de temps | Correctif VSM et run validé | `A_GENERER` | Événements exacts du ledger | `figures/ledger_vsm.png` |
| DOC-A18 | 8 | Construction des temps VA et NVA | Diagramme de calcul | Correctif VSM | `A_GENERER` | Formules actuelles | `figures/calcul_va_nva.png` |
| DOC-A19 | 8 | WIP, débit et takt | Schéma relationnel | ALP et run validé | `A_GENERER` | Définitions réellement calculées | `figures/wip_debit_takt.png` |
| DOC-A20 | 9 | Pipeline valeur VSM vers PI | Diagramme d'activité | ALP, JSON et run validé | `A_GENERER` | Valeur brute, score, classes, attribut et PI | `figures/pipeline_scor_pi.png` |
| DOC-A21 | 9 | Profils bottom/perfect | Échelle annotée | JSON courant | `A_GENERER` | Seize profils actuels | `figures/echelle_bottom_perfect.png` |
| DOC-A22 | 9 | AHP stratégique et AHP goulot | Comparaison de flux | ALP et JSON | `A_GENERER` | Usage diagnostique contre usage décisionnel | `figures/deux_usages_ahp.png` |
| DOC-A23 | 10 | Hiérarchie ISA-95 | Arbre hiérarchique | JSON courant | `A_GENERER` | 190 noeuds, types et parents | `figures/hierarchie_isa95.png` |
| DOC-A24 | 10 | Affectation poste vers équipement | Diagramme de classes | JSON courant | `A_GENERER` | 71 affectations | `figures/affectations_isa95.png` |
| DOC-A25 | 10 | TBox, ABox et run | Schéma de traçabilité | Ontologies et ABox validée | `A_GENERER` | Namespaces et rôles établis | `figures/tbox_abox_run.png` |
| DOC-A26 | 11 | Parcours utilisateur conseillé | Diagramme d'activité | UI actuelle | `A_GENERER` | Huit vues et fenêtres accessibles | `figures/parcours_utilisateur.png` |
| DOC-B01 | 11 | Barre de navigation actuelle | Capture réelle | ALP, ancienne image 1 | `CAPTURE_A_REALISER` | Toutes les destinations visibles | `figures/ui_navigation.png` |
| DOC-B02 | 12 | Vue Configuration | Capture réelle | ALP, ancienne image 2 | `CAPTURE_A_REALISER` | Modèle validé, cadrage lisible | `figures/ui_configuration.png` |
| DOC-C01 | 12 | Zones de la vue Configuration | Zoom annoté | Future capture B02 | `CAPTURE_A_REALISER` | Repères conformes aux contrôles actuels | `figures/ui_configuration_annotee.png` |
| DOC-B03 | 12 | Pondération des attributs | Capture réelle | Ancienne image 6 | `CAPTURE_EXISTANTE_A_VALIDER` | Comparaison finale avec l'ALP | `figures/ui_poids_attributs.png` |
| DOC-B04 | 12 | Pondération des métriques N3 | Capture réelle | Ancienne image 7 | `CAPTURE_EXISTANTE_A_VALIDER` | Comparaison finale avec l'ALP | `figures/ui_poids_n3.png` |
| DOC-B05 | 12 | Vue Logistique | Capture réelle | ALP | `CAPTURE_A_REALISER` | Acteurs et commandes visibles | `figures/ui_logistique.png` |
| DOC-B06 | 12 | Vue Responsabilités et Machines | Capture réelle | ALP | `CAPTURE_A_REALISER` | Neuf champs et sept boutons | `figures/ui_responsabilites_machines.png` |
| DOC-B07 | 13 | Vue Nomenclature et matières | Capture réelle | ALP, anciennes images 8 et 9 | `CAPTURE_A_REALISER` | Sans icône de développement | `figures/ui_nomenclature.png` |
| DOC-C02 | 13 | Les quatre zones de la Nomenclature | Zoom annoté | Future capture B07 | `CAPTURE_A_REALISER` | Nomenclature, fiche, fournisseur, consommateur | `figures/ui_nomenclature_annotee.png` |
| DOC-A27 | 14 | Structure pédagogique du JSON | Diagramme en blocs | JSON courant | `A_GENERER` | Treize blocs actuels et rôle | `figures/blocs_json.png` |
| DOC-A28 | 14 | Sauvegarde JSON | Diagramme d'activité | ALP validé | `VALIDE` | `sauverScenarioJSON` et conversions | `figures/workflow_sauvegarde_json.png` |
| DOC-A29 | 14 | Chargement JSON | Diagramme d'activité | ALP validé | `VALIDE` | Nettoyage, reconstruction et contrôles | `figures/workflow_chargement_json.png` |
| DOC-A30 | 14 | Détection et sélection d'un fichier | Diagramme de séquence | ALP validé | `A_GENERER` | Liste, sélection et délégation | `figures/sequence_selection_json.png` |
| DOC-B08 | 15 | Contrôle des commandes | Capture réelle | Ancienne image 15 | `CAPTURE_EXISTANTE_A_VALIDER` | Fenêtre encore conforme | `figures/ui_controle_commandes.png` |
| DOC-B09 | 15 | Temps et budgets | Capture réelle | Ancienne image 16 | `CAPTURE_EXISTANTE_A_VALIDER` | Fenêtre encore conforme | `figures/ui_temps_budgets.png` |
| DOC-B10 | 15 | Retours et qualité | Capture réelle | Ancienne image 17 | `CAPTURE_EXISTANTE_A_VALIDER` | Fenêtre encore conforme | `figures/ui_retours_qualite.png` |
| DOC-B11 | 15 | Paramètres d'animation | Capture réelle | Ancienne image 18 | `CAPTURE_EXISTANTE_A_VALIDER` | Fenêtre encore conforme | `figures/ui_animation_parametres.png` |
| DOC-B12 | 15 | Stocks initiaux | Capture réelle | ALP, ancienne image 14 | `CAPTURE_A_REALISER` | Cadrage propre et valeurs qualifiées | `figures/ui_stocks_initiaux.png` |
| DOC-B13 | 15 | Profils de test | Capture réelle | ALP | `CAPTURE_A_REALISER` | Options actuelles | `figures/ui_profils_test.png` |
| DOC-B14 | 15 | Perturbations | Capture réelle | ALP | `CAPTURE_A_REALISER` | Options actuelles | `figures/ui_perturbations.png` |
| DOC-B15 | 15 | Suivi temps réel | Capture réelle | ALP, ancienne image 13 | `CAPTURE_A_REALISER` | Run identifié, libellés consolidés | `figures/ui_suivi_temps_reel.png` |
| DOC-B16 | 16 | Vue Exécution | Capture réelle | ALP, ancienne image 10 | `CAPTURE_A_REALISER` | Run identifié | `figures/ui_execution.png` |
| DOC-C03 | 16 | Zones de la vue Exécution | Zoom annoté | Future capture B16 | `CAPTURE_A_REALISER` | Indicateurs, analyses, exports et commandes | `figures/ui_execution_annotee.png` |
| DOC-B17 | 16 | Vue Globale | Capture réelle | ALP, ancienne image 12 | `CAPTURE_A_REALISER` | Identités et disposition actuelles | `figures/ui_vue_globale.png` |
| DOC-B18 | 16 | Vue Hiérarchie | Capture réelle | ALP | `CAPTURE_A_REALISER` | Hiérarchie consolidée | `figures/ui_hierarchie.png` |
| DOC-B19 | 16 | Vue Structure animée | Capture réelle | ALP | `CAPTURE_A_REALISER` | Animation actuelle sans surinterprétation | `figures/ui_structure_animee.png` |
| DOC-C04 | 16 | Lecture de la Vue Globale | Zoom annoté | Future capture B17 | `CAPTURE_A_REALISER` | Bandes acteurs, postes et liaisons | `figures/ui_vue_globale_annotee.png` |
| DOC-B20 | 17 | Tables de résultats | Capture réelle | ALP et run validé | `CAPTURE_A_REALISER` | Table associée au run identifié | `figures/ui_tables_resultats.png` |
| DOC-A31 | 17 | Pipeline d'exports | Diagramme d'activité | ALP et artefacts validés | `A_GENERER` | CSV, Excel, ABox et clôture | `figures/pipeline_exports.png` |
| DOC-A32 | 17 | Arrêt manuel et clôture métier | Diagramme d'états | ALP et rapport | `A_GENERER` | Déclencheurs et artefacts | `figures/arret_cloture.png` |
| DOC-A33 | 18 | Reproduction d'un scénario | Diagramme d'activité | Registre des sources et guide validé | `A_GENERER` | Fichiers, contrôles et séquence | `figures/reproduction_scenario.png` |
| DOC-A34 | 19 | Matrice des niveaux de validation | Carte de preuve | Rapports de vérification | `A_GENERER` | Statuts exacts par fonctionnalité | `figures/niveaux_validation.png` |
| DOC-A35 | 20 | Points d'extension et invariants | Diagramme de composants | ALP et évolution du modèle | `A_GENERER` | Frontières de maintenance | `figures/points_extension.png` |
| DOC-A36 | Annexe A | Schéma détaillé des blocs JSON | Diagramme de classes technique | ALP et JSON | `A_GENERER` | Propriétés et cardinalités réelles | `figures/json_technique.png` |
| DOC-A37 | Annexe B | Dépendances des fonctions structurantes | Graphe d'appels | ALP validé | `A_GENERER` | Appels réels | `figures/graphe_fonctions.png` |
| DOC-A38 | Annexe C | Classes d'agents | Diagramme de classes UML | ALP validé | `A_GENERER` | Héritage et responsabilités réels | `figures/classes_agents.png` |

## Bilan

Le registre contient 62 illustrations potentielles : 38 schémas générés, 20 captures réelles et 4 zooms annotés. Six captures anciennes sont des références à valider. Les autres captures doivent être réalisées depuis le modèle courant. La génération peut être progressive, chapitre par chapitre; le registre évite qu'un concept majeur soit laissé sans support visuel.

## Ordre de production recommandé

La première série doit couvrir l'architecture générale, le cycle de commande, la distinction `CMD_*` et `REAPPRO_*`, les deux workflows JSON et le parcours utilisateur. La deuxième série couvre les huit vues. Les figures de mesure et les diagrammes techniques viennent avec les chapitres correspondants.
