# Inventaire de l'interface utilisateur actuelle

## Périmètre et comptage

L'inventaire est dérivé de la présentation de `Main` dans `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp`. Le modèle déclare huit zones de vue et 195 contrôles. Parmi eux, 190 se trouvent dans les limites d'une vue accessible : 124 boutons et 66 champs utilisateur. Les 66 champs comprennent 38 champs d'entrée, 22 listes de sélection et 6 cases à cocher.

Cinq cases à cocher supplémentaires, nommées `checkbox1` à `checkbox5`, se trouvent hors des huit zones de vue. Elles portent les libellés `IN PLAN PROCESS`, `IN SOURCE PROCESS`, `IN MAKE PROCESS`, `IN DELIVER PROCESS` et `IN RETURN PROCESS`. Elles sont déclarées dans le modèle mais ne sont pas comptées comme champs utilisateur accessibles. Leur destination doit être clarifiée avant toute capture.

Le suivi temps réel est une fenêtre, pas une neuvième vue. Le bouton qui l'ouvre est reproduit dans chacune des huit vues.

## Vues établies dans l'ALP

| Vue utilisateur | Identifiant ALP | Titre ALP | Boutons | Champs utilisateur | Rôle principal |
|---|---|---|---:|---:|---|
| Configuration | `viewEdition` | `viewEdition` | 39 | 40 | Construire les postes et scénarios, régler les politiques, pondérations et accès aux paramètres. |
| Exécution | `viewExecution` | `viewExecution` | 27 | 0 | Suivre le run, ouvrir les analyses, arrêter, réinitialiser et exporter. |
| Vue Globale | `viewAll` | titre vide | 7 | 0 | Observer l'ensemble des postes, acteurs et liaisons. |
| Logistique | `viewLogistique` | `Vue Logistique SC` | 18 | 5 | Gérer les acteurs et consulter les processus logistiques. |
| Hiérarchie | `viewHolons` | `Schema holonique ADACOR` | 7 | 0 | Lire l'organisation holonique et les relations de pilotage. |
| Structure animée | `viewAnimation` | titre vide | 8 | 0 | Observer les mouvements physiques et informationnels. |
| Responsabilités et Machines | `viewResp` | titre vide | 7 | 9 | Affecter responsabilités et machines aux micro-activités. |
| Nomenclature et matières | `viewNomenclature` | `Configurer nomenclature` | 11 | 12 | Définir compositions, stocks matière, fournisseurs et consommation. |
| **Total accessible** | | | **124** | **66** | |

## Champs utilisateur accessibles

Les lignes groupées ci-dessous comptabilisent chaque contrôle. La colonne « preuve ALP » donne les variables liées ou les identifiants de contrôle. Une ancienne capture disponible signifie qu'au moins une des 18 images du DOCX montre le groupe, sans préjuger de son classement final.

| Vue | Libellé utilisateur | Type simple | Nombre | Rôle et valeur attendue | Effet et moment d'utilisation | Précaution | Preuve ALP | Ancienne capture |
|---|---|---|---:|---|---|---|---|---|
| Configuration | Nom du poste | champ d'entrée | 1 | Texte identifiant la micro-activité. | Utilisé avant ajout ou modification d'un poste. | Employer un nom stable et distinct. | `champNom` | OUI |
| Configuration | Code SCOR | liste | 2 | Code de processus ou de micro-activité. | Classe le poste et oriente les regroupements. | Vérifier le niveau et le code choisis. | `combobox`, `comboProcessus`, lien `champCodeSCOR` | OUI |
| Configuration | Type de poste | liste | 1 | Type logique du poste. | Détermine le comportement de traitement ou délai. | Cohérence avec la loi de temps. | `comboTypeActivite` | OUI |
| Configuration | Loi de distribution | liste | 1 | Famille de distribution. | Contrôle le tirage du temps de traitement. | Les paramètres dépendent de la loi. | `comboLoiDist` | OUI |
| Configuration | Paramètres P1 et P2 | champ d'entrée | 2 | Valeurs numériques de la distribution. | Appliquées à la création ou modification du poste. | Respecter l'ordre et le domaine de la loi. | `champP1`, `champP2` | OUI |
| Configuration | Capacité simultanée | champ d'entrée | 1 | Entier positif. | Fixe le nombre d'entités traitées simultanément. | Une valeur non réaliste fausse les files. | `champCapacite` | OUI |
| Configuration | Débit | champ d'entrée | 1 | Nombre de produits par heure. | Sert aux réglages de génération et aux profils. | Ne pas le confondre avec le débit observé. | `champDebit` | OUI |
| Configuration | Poste alternatif | case à cocher | 1 | Oui ou non. | Marque un chemin alternatif. | Vérifier la règle d'aiguillage associée. | `checkbox` | OUI |
| Configuration | Contrôle qualité en sortie | case à cocher | 1 | Oui ou non. | Active une décision de conformité après le poste. | Renseigner le type, le taux et la cible d'échec. | `chkControleQualite` | OUI |
| Configuration | Type de contrôle qualité | liste | 1 | Type de décision. | Détermine la règle appliquée. | La liste dépend de la configuration disponible. | `comboTypeControleQualite` | OUI |
| Configuration | Taux conforme | champ d'entrée | 1 | Ratio entre 0 et 1. | Fixe la branche de conformité. | Ne pas saisir un pourcentage entier. | `champTauxConforme` | OUI |
| Configuration | Cible d'échec | champ d'entrée | 1 | Identifiant de poste. | Dirige les éléments non conformes. | La cible doit exister. | `champCibleEchec` | OUI |
| Configuration | Poste générateur autonome | case à cocher | 1 | Oui ou non. | Autorise un poste à générer sans arrivée amont. | Ne pas l'utiliser pour simuler une commande cliente si le poste représente un flux interne. | `chkGenereAutonome` | OUI |
| Configuration | Politique d'approvisionnement du poste | liste | 1 | Politique disponible. | Choisit la règle de génération autonome. | Compléter les paramètres correspondant à la politique. | `comboPolitiqueApproPoste` | NON |
| Configuration | Intervalle, taux Poisson et quantité | champ d'entrée | 3 | Nombres positifs. | Paramètrent l'approvisionnement autonome. | Les champs utiles dépendent de la politique. | `champIntervalleApproPoste`, `champTauxArriveePoissonPoste`, `champQuantiteParApproPoste` | NON |
| Configuration | Taille de lot | champ d'entrée | 1 | Entier positif. | Définit le lot ou la synchronisation d'amont. | Le chargeur impose au moins 1. | `champTailleLot` | NON |
| Configuration | Attendre tous les prédécesseurs | case à cocher | 1 | Oui ou non. | Synchronise une jonction multi-amont. | Le chargeur adapte la taille de lot au nombre de parents. | `chkAttendTousLesPredecesseurs` | OUI |
| Configuration | Poste sélectionné | liste | 1 | Poste existant. | Cible les commandes modifier, supprimer ou positionner. | Rafraîchir après changement de structure. | `comboPostes`, lien `champPosteSelectionne` | OUI |
| Configuration | Nom du scénario | champ d'entrée | 1 | Nom du produit ou scénario. | Crée un scénario de flux. | Le nom sert aussi à la nomenclature. | `champScenarioNom` | OUI |
| Configuration | Débit du scénario | champ d'entrée | 1 | Produits par heure. | Définit le débit prévu du scénario. | Distinguer débit configuré et observé. | `champScenarioDebit` | OUI |
| Configuration | Scénario sélectionné | liste | 1 | Scénario existant. | Cible les commandes de gamme et suppression. | Le chargeur sélectionne le scénario nominal par défaut. | `comboScenarios`, lien `champScenarioSelectionne` | OUI |
| Configuration | Chiffre d'affaire par unité | champ d'entrée | 1 | Valeur monétaire ou 0. | Contribue aux mesures économiques si renseignée. | Zéro signifie non renseigné. | `chiffreAffaireParUnite` | OUI |
| Configuration | Poids RL, RS, AG, CO et AM | champ d'entrée | 5 | Poids numériques. | Pondèrent les attributs du PI après application. | La somme doit être cohérente; le chargeur normalise les poids. | `champPoidsRL`, `champPoidsRS`, `champPoidsAG`, `champPoidsCO`, `champPoidsAM` | OUI |
| Configuration | Métrique N3 | liste | 1 | Code disponible. | Cible une métrique pour modifier son poids. | Rafraîchir la liste après configuration. | `comboMetriqueN3` | OUI |
| Configuration | Poids de la métrique N3 | champ d'entrée | 1 | Poids numérique. | Modifie la pondération de la métrique sélectionnée. | Ne pas confondre avec le poids d'attribut. | `champPoidsMetriqueN3` | OUI |
| Configuration | Taux de valeur ajoutée | champ d'entrée | 1 | Ratio entre 0 et 1. | Répartit le temps du poste entre VA et NVA. | La valeur doit être justifiée ou traitée comme hypothèse. | `champTauxVA` | OUI |
| Configuration | Coût horaire de main d'oeuvre | champ d'entrée | 1 | Devise par heure ou 0. | Alimente les calculs de coût disponibles. | Zéro signifie non renseigné. | `champCoutHoraireMainOeuvre` | OUI |
| Configuration | Coût matière par unité | champ d'entrée | 1 | Devise par unité ou 0. | Alimente les calculs de coût disponibles. | Ne pas confondre avec un coût observé. | `champCoutMatierePremiereParUnite` | OUI |
| Configuration | Valeur de l'actif fixe | champ d'entrée | 1 | Valeur monétaire ou 0. | Paramètre l'actif lié au poste. | Zéro signifie non renseigné. | `champValeurActifFixe` | OUI |
| Configuration | Nom de l'entreprise | champ d'entrée | 1 | Texte. | Détermine le nom normalisé du fichier JSON. | Les caractères non sûrs sont supprimés. | `nomEntreprise`, contrôle `editNomEntrepriseJson` | OUI |
| Configuration | Fichier JSON disponible | liste | 1 | Nom `scenario_*.json`. | Cible le chargement depuis la liste. | La liste porte sur le répertoire courant. | `comboScenariosJson` | OUI |
| Logistique | Nom de l'acteur | champ d'entrée | 1 | Texte. | Identifie l'organisation dans l'interface. | Éviter les doublons ambigus. | `champActeurNom` | NON |
| Logistique | Description | champ d'entrée | 1 | Texte libre court. | Documente le rôle de l'acteur. | Ne modifie pas à elle seule le flux. | `champActeurDescription` | NON |
| Logistique | Délai de paiement | champ d'entrée | 1 | Nombre de jours. | Paramètre la donnée économique de l'acteur. | Ne pas le présenter comme durée observée. | `champDelaiPaiementJours` | NON |
| Logistique | Catégorie de l'acteur | liste | 1 | Fournisseur, entreprise focale, client ou autre catégorie admise. | Situe l'acteur dans la chaîne. | La catégorie agit sur certains traitements et exports. | `champActeurCategorie` | NON |
| Logistique | Type annexe | liste | 1 | Type complémentaire. | Qualifie notamment les prestataires ou transporteurs. | Laisser vide s'il ne s'applique pas. | `champActeurTypeAnnexe` | NON |
| Responsabilités et Machines | Micro-activité | liste | 1 | Poste existant. | Cible l'affectation de responsabilité. | Le poste doit être créé auparavant. | `champRespMicro` | NON |
| Responsabilités et Machines | Acteur | liste | 1 | Acteur existant. | Désigne le responsable. | L'acteur doit être créé auparavant. | `champRespActeur` | NON |
| Responsabilités et Machines | Niveau hiérarchique | liste | 1 | Niveau disponible. | Détermine le type d'agent ou de ressource créé. | Vérifier la cohérence avec la micro-activité. | `champRespNiveau` | NON |
| Responsabilités et Machines | Quantité | champ d'entrée | 1 | Entier positif. | Définit le nombre d'éléments associés. | Éviter une multiplication non justifiée des agents. | `champRespQuantite` | NON |
| Responsabilités et Machines | Type de machine | champ d'entrée | 1 | Texte. | Qualifie la machine logique. | Employer une désignation stable. | `champMachineType` | NON |
| Responsabilités et Machines | Capacité machine | champ d'entrée | 1 | Entier positif. | Paramètre la capacité de la machine. | Distinguer de la capacité du poste. | `champMachineCapacite` | NON |
| Responsabilités et Machines | Temps de cycle machine | champ d'entrée | 1 | Durée numérique. | Paramètre le cycle nominal de la machine. | Vérifier l'unité dans la fenêtre. | `champMachineCycleTime` | NON |
| Responsabilités et Machines | MTBF | champ d'entrée | 1 | Durée positive ou 0. | Paramètre l'intervalle théorique entre pannes. | Zéro désactive l'effet correspondant. | `champMachineMTBF` | NON |
| Responsabilités et Machines | MTTR | champ d'entrée | 1 | Durée positive ou 0. | Paramètre la durée théorique de réparation. | Cohérence avec le MTBF. | `champMachineMTTR` | NON |
| Nomenclature | Produit | liste | 1 | Scénario ou produit existant. | Cible la ligne de nomenclature. | Créer le scénario avant sa nomenclature. | `champNomProduitNomenclature` | OUI |
| Nomenclature | Matière | liste | 1 | Matière connue. | Cible la matière de la ligne. | Utiliser le même identifiant que la fiche matière. | `champNomMatiereNomenclature` | OUI |
| Nomenclature | Quantité par unité | champ d'entrée | 1 | Nombre positif. | Définit le besoin unitaire. | Une valeur erronée modifie tout le besoin net. | `champQuantiteNomenclature` | OUI |
| Nomenclature | Identifiant de matière | liste | 1 | Matière connue ou nouvel identifiant admis. | Cible la fiche matière. | Conserver l'identifiant de la nomenclature. | `champMatiereIdFiche` | OUI |
| Nomenclature | Stock disponible de départ | champ d'entrée | 1 | Quantité positive ou nulle. | Initialise le stock détaillé. | Distinguer du stock global de repli. | `champMatiereStockInitial` | OUI |
| Nomenclature | Stock de sécurité | champ d'entrée | 1 | Quantité positive ou nulle. | Entre dans le besoin net. | Justifier la valeur métier. | `champMatiereStockSecurite` | OUI |
| Nomenclature | Délai d'obtention | champ d'entrée | 1 | Nombre d'heures positif ou nul. | Retarde le crédit de matière. | Le délai est une configuration, pas un résultat. | `champMatiereDelaiObtention` | OUI |
| Nomenclature | Fournisseur | liste | 1 | Acteur fournisseur existant. | Rattache la matière à son fournisseur. | Créer l'acteur avant l'affectation. | `champMatiereFournisseur` | OUI |
| Nomenclature | Acteur fournisseur à piloter | liste | 1 | Fournisseur existant. | Cible le mode d'approvisionnement. | Vérifier l'acteur sélectionné. | `champActeurIdModeAppro` | OUI |
| Nomenclature | Pilotage par besoin net | case à cocher | 1 | Oui ou non. | Active la politique MRP de l'acteur. | Ne signifie pas qu'un run l'a quantitativement validée. | `chkModeApproMRP` | OUI |
| Nomenclature | Poste consommateur | liste | 1 | Poste existant. | Cible le poste consommateur de matière. | Choisir le poste où la consommation doit réellement avoir lieu. | `champPosteIdConsomme` | OUI |
| Nomenclature | Ce poste consomme la matière | case à cocher | 1 | Oui ou non. | Active la consommation au poste ciblé. | Éviter plusieurs consommations non voulues. | `chkConsommeMatiere` | OUI |

## Boutons et commandes

Les 124 boutons sont recensés par famille. Les boutons de navigation répétés conservent leur nombre d'occurrences afin que le total reste vérifiable.

| Vue ou portée | Commande visible | Occurrences | Rôle, moment et effet | Précaution | Preuve ALP | Ancienne capture |
|---|---|---:|---|---|---|---|
| Toutes les vues | Suivi temps réel simulation | 8 | Ouvre la fenêtre de suivi durant ou après l'initialisation. | Ce n'est pas une vue distincte. | `ouvrirSuiviTempsReel` | OUI |
| Navigation | Configuration | 6 | Va vers `viewEdition`. | Aucun effet sur l'état métier. | `viewEdition.navigateTo` | OUI |
| Navigation | Exécution | 6 | Va vers `viewExecution`. | Aucun effet sur l'état métier. | `viewExecution.navigateTo` | OUI |
| Navigation | Vue Globale | 6 | Va vers `viewAll`. | Aucun effet sur l'état métier. | `viewAll.navigateTo` | OUI |
| Navigation | Logistique | 5 | Va vers `viewLogistique`. | Aucun effet sur l'état métier. | `viewLogistique.navigateTo` | OUI |
| Navigation | Hiérarchie | 6 | Va vers `viewHolons`. | Aucun effet sur l'état métier. | `viewHolons.navigateTo` | OUI |
| Navigation | Vue Structure animée | 6 | Va vers `viewAnimation`. | Aucun effet sur l'état métier. | `viewAnimation.navigateTo` | OUI |
| Vues secondaires | Retour configuration | 3 | Revient à la configuration depuis Logistique, Responsabilités ou Nomenclature. | Aucun effet sur les données. | `navigate(viewEdition)` | OUI |
| Configuration | Ajouter micro-activité; Vider postes | 2 | Crée un poste ou retire tous les postes. | La seconde commande est destructive pour la configuration en mémoire. | `ajouterPoste`, `remove_postes` | OUI |
| Configuration | Ajouter à la séquence; Vider séquence; Voir la gamme | 3 | Construit ou consulte la gamme du scénario. | Vérifier le poste et le scénario sélectionnés. | `ajouterPosteASequenceUI`, `viderSequenceUI`, `gammeScenarioText` | OUI |
| Configuration | Ajouter scénario; Supprimer ce scénario | 2 | Crée ou supprime un scénario. | Une nomenclature peut dépendre du scénario. | `ajouterScenarioUI`, `supprimerScenarioUI` | OUI |
| Configuration | Supprimer ce poste; Modifier ce poste | 2 | Modifie la structure sélectionnée. | Vérifier les prédécesseurs et séquences après suppression. | `supprimerPoste`, `modifierPoste` | OUI |
| Configuration | Fixer la position; Revenir au positionnement auto | 2 | Pilote la position visuelle du poste. | L'effet est visuel, pas métier. | `fixerPositionPosteUI`, `libererPositionPosteUI` | OUI |
| Configuration | Appliquer la pondération | 1 | Applique les poids RL, RS, AG, CO et AM. | Les poids sont normalisés au chargement JSON. | `appliquerPoidsAttributsSCOR` | OUI |
| Configuration | Rafraîchir liste; Appliquer ce poids; Réinitialiser tous; Voir le détail des poids | 4 | Gère les poids des métriques N3. | Distinguer poids N3 et poids d'attribut. | contrôles `btnRafraichirMetriquesN3` à `btnVoirRapportPoidsN3` | OUI |
| Configuration | Sauver config JSON; Charger config JSON | 2 | Écrit ou charge le fichier dérivé du nom d'entreprise. | Le chargement est refusé pendant l'exécution. | `sauverScenarioJSON`, `chargerScenarioJSON` | OUI |
| Configuration | Rafraîchir la liste; Charger le scénario sélectionné | 2 | Détecte les fichiers `scenario_*.json`, puis charge celui choisi. | Le répertoire courant d'AnyLogic est utilisé. | `listerScenariosJsonDisponibles`, `chargerScenarioJSONDepuisSelection` | OUI |
| Configuration | Stocks initiaux; Contrôle commandes; Temps et budgets | 3 | Ouvre les fenêtres de réglage correspondantes. | Les valeurs sont des paramètres, pas des résultats. | fonctions `ouvrirParametres*` | OUI |
| Configuration | ZENER CAS 1; ZENER CAS 2; ZENER CAS 3 (entrées de la liste des scénarios) | 3 | Applique automatiquement un profil de stock initial lors de la sélection. | Un profil n'est pas un scénario métier distinct. | `estScenarioCasTest`, `synchroniserProfilAvecScenarioSelectionne` | OUI |
| Configuration | Bouton `btnProfilsTest` (fonction `ouvrirProfilsTest`) | 1 | Fonction et bouton confirmés dans le fichier du modèle, boîte de dialogue de sélection de profil. | Position non retrouvée dans les captures de la vue Configuration réunies; à revérifier directement dans l'éditeur avant de le documenter comme accessible. | `ouvrirProfilsTest`, `btnProfilsTest` | NON CONFIRME (CAPACITE_INTERNE_NON_EXPOSEE) |
| Configuration | Retours et qualité; Animation; Perturbations | 3 | Ouvre les fenêtres des comportements non nominaux ou visuels. | Signaler clairement les options qui changent le scénario métier. | `ouvrirParametresRetoursQualite`, `ouvrirParametresAnimation`, `ouvrirParametresPerturbations` | OUI partiel |
| Configuration | Configurer acteurs; Configurer nomenclature | 2 | Ouvre les vues Logistique et Nomenclature. | Créer les dépendances dans un ordre cohérent. | `navigate(viewLogistique)`, `navigate(viewNomenclature)` | OUI |
| Configuration | Voir micro-activités Table; Voir micro-activités configurées | 2 | Affiche les postes sous forme tabulaire ou textuelle. | Consultation seulement. | `showMicroActivitesTable`, liste construite dans l'action | OUI |
| Configuration | Démarrer simulation | 1 | Valide et lance le run. | Ne pas lancer avant contrôle du scénario et des stocks. | `demarrerSimulation` | OUI |
| Exécution | Exporter CSV; Exporter Traces CSV | 2 | Produit les sorties CSV correspondantes. | Archiver avec l'identifiant du run. | `supervisor.exporterCSV`, `exporterTracesCSV` | OUI |
| Exécution | Arrêter et voir résultats; Réinitialiser | 2 | Arrête le run ou réinitialise les états d'affichage et entités. | Arrêt et clôture métier ne sont pas synonymes. | `arreterSimulation`, action de `button5` | OUI |
| Exécution | Voir Rapport VSM/SCOR; Voir Détail N3; Rapport efficacité globale | 3 | Affiche les synthèses de mesure. | N'interpréter quantitativement qu'un run identifié. | actions `btnDashRapport`, `btnDashN3`, `btnPCEGlobal` | OUI |
| Exécution | Voir KPI par micro-activité; KPI par micro-activité; Voir Goulots | 3 | Ouvre les détails par poste et les goulots. | Les deux premiers boutons mènent au même tableau. | `showKpiParPosteTable`, `btnDashGoulots` (appelle `supervisor.getGoulotsRapport()`) | OUI |
| Exécution | Décisions agents; Traçabilité; Journal événements | 3 | Ouvre décisions, traces agrégées et journal. | Un journal d'interface n'est pas une preuve complète sans export. | `showDecisionsHoloniquesTable`, `showTracesAgregeesTable` | OUI |
| Exécution | Rapport Stratégique; Besoins matières | 2 | Affiche le diagnostic stratégique et le besoin MRP. | Le diagnostic AHP stratégique ne pilote pas le PI. | actions `btnRapportStrategique`, `btnRapportBesoinsMatieres` | OUI |
| Exécution | Tables des exécutions, KPI, pipeline, logs, décisions et traçabilité | 6 | Ouvre les six familles de tables détaillées. | Employer le tableau adapté à la question. | `showExecutionBruteTable`, `showDashboardKpiTables`, `showN3ToN1Table`, `showFluxSupplyChainTable`, `showDecisionsHoloniquesTable`, `showTracesAgregeesTable` | OUI |
| Logistique | Ajouter acteur; Vider tous les acteurs | 2 | Crée un acteur ou vide la liste. | Vider les acteurs peut invalider les responsabilités et postes. | `ajouterActeurSCUI`, `viderActeursSC` | NON |
| Logistique | Table acteurs; Voir les Informations; EFFICACITÉ GLOBALE | 3 | Consulte les acteurs et synthèses logistiques. | Consultation seulement. | `showActeursChaineTable`, `kpiLogisticsText`, `pceGlobalText` | NON |
| Logistique | Détail Plan, Source, Make, Deliver et Return | 5 | Ouvre un rapport par macro-processus. | La présence du rapport ne valide pas chaque métrique. | `colPLANContentF` à `colRETURNContentF` | NON |
| Responsabilités et Machines | Ajouter responsabilité | 1 | Crée l'affectation sélectionnée. | Vérifier poste, acteur, niveau et quantité. | `ajouterResponsabiliteMicroUI` | NON |
| Responsabilités et Machines | Tables responsabilités, machines, acteurs et micro-activités | 4 | Ouvre les tableaux de contrôle. | Consultation seulement. | fonctions `show*Table` correspondantes | NON |
| Nomenclature | Ajouter ou mettre à jour ligne; Supprimer ligne; Voir nomenclature | 3 | Gère la composition du produit. | Le produit et la matière doivent exister. | contrôles `btnAjouterLigneNomenclature` à `btnVoirNomenclatureProduit` | OUI |
| Nomenclature | Enregistrer fiche; Supprimer fiche; Voir fiches matière | 3 | Gère le stock, la sécurité, le délai et le fournisseur. | Une suppression peut invalider une nomenclature. | contrôles `btnEnregistrerFicheMatiere` à `btnVoirFichesMatiereConfig` | OUI |
| Nomenclature | Appliquer le mode d'approvisionnement; Appliquer la consommation | 2 | Applique les deux cases à cocher à leur cible. | Vérifier le fournisseur ou le poste sélectionné. | deux contrôles libellés `Appliquer` | OUI |
| Nomenclature | Voir rapport besoins matières | 1 | Affiche le besoin MRP calculable. | Ne pas le confondre avec une consommation observée. | `getRapportBesoinsMatieres` | OUI |
| Structure animée | Voir tout | 1 | Ouvre l'historique des flux informationnels. | La cadence visuelle ne représente pas nécessairement la cadence métier. | `afficherHistoriqueFluxInformationnels` | NON |

La somme des occurrences de cette table est 124.

## Fenêtres et tableaux accessibles

Les fenêtres principales à documenter sont : stocks initiaux, contrôle des commandes, temps et budgets, profils de test, retours et qualité, animation, perturbations, suivi temps réel, informations logistiques, efficacité globale, rapport VSM/SCOR, détail N3, goulots, rapport stratégique, besoin matière, historique des flux et rapports par processus. Les tableaux couvrent acteurs, micro-activités, responsabilités, machines, KPI par poste, exécutions brutes, traces agrégées, dashboard KPI, catalogue de métriques, passage N3 vers N1, flux, décisions et propagation AER.

Ces fenêtres sont générées par des fonctions du modèle. Elles seront décrites comme des fenêtres ou tableaux dans les chapitres utilisateur. Les classes graphiques et signatures resteront en annexe B.

## Indicateurs visibles

La vue Exécution montre notamment les entités terminées, le WIP, le temps simulé, la date simulée, l'échelle temporelle et le débit courant. La Vue Globale et les vues Logistique, Hiérarchie et Structure animée ajoutent des représentations de postes, acteurs, connexions, états et flux. Le nombre exact de formes graphiques n'est pas assimilé au nombre de contrôles : ces formes sont dynamiques ou servent de représentation, tandis que les 195 contrôles ci-dessus sont déclarés comme éléments interactifs.

## Risques de documentation

1. Les titres internes `viewEdition` et `viewExecution` ne sont pas des libellés pédagogiques; le guide utilisera Configuration et Exécution.
2. `viewResp` n'est pas proposé dans toutes les barres de navigation. Son accès passe par la commande de configuration associée.
3. Cinq cases SCOR se trouvent hors zone et ne doivent pas être présentées comme commandes accessibles.
4. Plusieurs boutons ouvrent le même tableau; le guide expliquera l'objectif plutôt que de créer des procédures artificiellement distinctes.
5. Les valeurs visibles dans les anciennes captures sont des réglages ou des états d'un run non identifié, sauf preuve runtime séparée.

