# Audit de la sauvegarde et du chargement JSON

## Verdict et portée de la vérification

Les parcours de sauvegarde et de chargement sont vérifiés par lecture de `SCONTO_SVU_FINAL_VALIDATED.alp`. Cette vérification établit les appels, les blocs, les valeurs de repli et les reconstructions. Elle ne constitue pas un nouveau run expérimental de sauvegarde puis rechargement.

Le fichier courant `scenario_ZENER_RETARD_FOURNISSEUR.json` contient 13 blocs racine. La fonction `sauverScenarioJSON` en produit 14, car elle ajoute `responsabilites`. Cette différence est acceptée par le chargeur, mais doit être visible dans la documentation.

## Commandes proposées à l'utilisateur

| Commande visible | Fonction appelée | Effet |
|---|---|---|
| `Sauver config JSON` | `sauverScenarioJSON` | Sérialise la configuration en mémoire dans le répertoire courant. |
| `Charger config JSON` | `chargerScenarioJSON` | Charge le fichier calculé à partir du nom de l'entreprise. |
| `Rafraichir la liste` | `listerScenariosJsonDisponibles` | Recherche les fichiers `scenario_*.json` du répertoire courant et trie leurs noms sans tenir compte de la casse. |
| `Charger le scenario selectionne` | `chargerScenarioJSONDepuisSelection` puis `chargerScenarioJSON` | Déduit le nom d'entreprise du fichier sélectionné et délègue le chargement complet. |

## Construction du nom de fichier

`scenarioJsonFileName` part de `nomEntreprise`. Une valeur vide devient `scenario`. Les espaces deviennent des traits de soulignement, les caractères autres que lettres, chiffres, traits de soulignement et traits d'union sont retirés, puis les traits de soulignement répétés sont réduits. Le préfixe `scenario_` et l'extension `.json` sont ajoutés.

Le fichier est lu et écrit avec un chemin relatif. Le « répertoire courant » est donc le répertoire de travail de l'expérience AnyLogic, qui doit être contrôlé lors d'une démonstration.

## Workflow de sauvegarde

1. La commande calcule le nom de fichier.
2. Une structure ordonnée est créée en mémoire.
3. Les métadonnées et paramètres globaux sont copiés.
4. Les profils de normalisation par défaut sont complétés avant sérialisation.
5. La méthode de performance, les poids actifs, les matrices AHP et la configuration ABox sont copiés.
6. Les acteurs, postes, scénarios, responsabilités, machines, éléments ISA-95 et fiches matière sont convertis par leurs fonctions dédiées.
7. `SimpleJsonWriter.toJson` produit le texte.
8. Le fichier est écrit en UTF-8.
9. Une fenêtre confirme le chemin et les principaux comptages, ou signale l'erreur.

Fonctions de conversion directement impliquées : `acteurToJson`, `posteToJson`, `scenarioToJson`, `responsabiliteToJson`, `machineToJson`, `isa95NodeToJson`, `isa95AssignmentToJson` et `matriceAHPToJson`.

## Workflow de détection et de sélection

`listerScenariosJsonDisponibles` scanne `.` avec un filtre : le nom doit commencer exactement par `scenario_` et se terminer par `.json` sans tenir compte de la casse pour l'extension. Les fichiers sont triés alphabétiquement sans tenir compte de la casse. Si aucun fichier n'est trouvé, la liste contient un message explicite; une erreur de lecture produit également un message dans la liste.

`chargerScenarioJSONDepuisSelection` rejette une sélection vide, le message « aucun scénario » ou le message d'erreur. Il refuse aussi le chargement si la simulation est en cours. Il retire le préfixe et l'extension du nom choisi, affecte le résultat à `nomEntreprise`, puis appelle `chargerScenarioJSON`. La logique de reconstruction n'est donc pas dupliquée.

## Workflow de chargement

1. Le fichier calculé est ouvert en UTF-8 et entièrement lu.
2. `SimpleJsonParser.parse` construit la structure en mémoire.
3. Le champ `meta.schemaVersion` est comparé aux versions 1.0 à 2.1. Une version inconnue déclenche un avertissement, pas un arrêt automatique.
4. Le chargement est refusé si `modeExecution` est actif.
5. `clearScenarioBeforeJsonLoad` arrête le mode d'exécution, remet les identifiants de run et KPI à leur état initial, retire les agents opérationnels et postes dynamiques, vide les collections métier et les traces, puis remet les compteurs.
6. Les paramètres globaux sont restaurés avec leur valeur courante comme repli, sauf les compteurs qui retombent à zéro.
7. Les profils de normalisation présents sont chargés, puis les profils par défaut manquants sont ajoutés.
8. Les matrices AHP sont chargées si leur dimension est correcte. En l'absence du bloc AHP, la matrice stratégique est reconstruite depuis les poids disponibles. Les poids du PI sont normalisés; si leur somme n'est pas positive, les valeurs 0,35, 0,20, 0,10, 0,20 et 0,15 sont appliquées.
9. La configuration ABox est chargée avec des valeurs de repli.
10. Les acteurs sont recréés.
11. Les postes sont créés en première passe, avec leur loi de temps et leurs propriétés. Un agent opérationnel associé est créé pour chaque poste à ce stade.
12. Les prédécesseurs sont reconnectés en seconde passe, par identifiant ou par nom.
13. Les scénarios et nomenclatures, puis les fiches matière, sont restaurés.
14. Les responsabilités et machines sont restaurées si leurs blocs existent, avec reconstruction des liens croisés.
15. La hiérarchie ISA-95 et ses affectations sont restaurées. Une hiérarchie incohérente déclenche un avertissement; une hiérarchie valide est appliquée aux postes.
16. Le positionnement topologique et les regroupements opérationnels sont recalculés.
17. Les listes de l'interface sont rafraîchies.
18. Le scénario nominal est sélectionné par défaut lorsqu'il est trouvé.
19. Les stations d'animation sont recréées et les flux informationnels initiaux sont redéclenchés.
20. Une fenêtre confirme les comptages chargés ou signale le fichier manquant et les autres erreurs.

Fonctions de conversion directement impliquées : `acteurFromJson`, `scenarioFromJson`, `responsabiliteFromJson`, `machineFromJson`, `isa95NodeFromJson`, `isa95AssignmentFromJson`, `matriceAHPFromJson`, ainsi que les lecteurs `jsonString`, `jsonDouble`, `jsonInt`, `jsonBool` et `jsonStringList`. Les postes sont restaurés directement dans `chargerScenarioJSON`, sans fonction `posteFromJson` distincte.

## Les 13 blocs du JSON courant

| Bloc | Forme et taille courantes | Question métier | Informations principales | Modifiable par l'utilisateur | Effet dans le simulateur |
|---|---|---|---|---|---|
| `meta` | objet | De quel fichier et de quelle convention s'agit-il ? | Version de schéma, modèle, entreprise, comptages, références et notes d'intégration. | Principalement non. | Le chargeur contrôle `schemaVersion`; le reste sert surtout de traçabilité. |
| `parametresGlobaux` | objet | Quels réglages communs s'appliquent ? | Débit, coûts, paiement, poids, stocks globaux de repli et compteurs. | Oui, selon les champs exposés. | Initialise les paramètres partagés et les poids. |
| `acteurs` | liste de 5 | Qui participe à la chaîne ? | Identité, catégorie, activité, délai de paiement et politique d'approvisionnement. | Oui. | Recrée fournisseurs, entreprise focale, client et autres acteurs. |
| `postes` | liste de 71 | Où et comment le flux est-il traité ? | Identité, code SCOR, temps, capacité, prédécesseurs, acteur, stock, coûts, génération, lots et consommation matière. | Oui. | Recrée les micro-activités, agents associés et connexions. |
| `scenarios` | liste de 5 | Quels produits suivent quelles gammes ? | Produit, séquence, débit et nomenclature. | Oui. | Recrée les gammes et permet la sélection du scénario nominal. |
| `machines` | liste de 1 | Quelles ressources sont affectées ? | Identité, poste, agent, type, capacité, cycle, MTBF et MTTR. | Oui. | Recrée les machines logiques et leurs liens. |
| `fichesMatiere` | liste de 3 | Quels stocks et délais matière sont disponibles ? | Stock, sécurité, délai et fournisseur. | Oui. | Alimente le besoin net, l'approvisionnement et la consommation. |
| `normalizationProfiles` | liste de 16 | Comment une valeur devient-elle un score ? | Code, direction, bornes bottom/perfect, source et version. | Oui, avec expertise. | Paramètre la normalisation des métriques. |
| `ahpConfiguration` | objet | Quelles comparaisons sont utilisées par les diagnostics AHP ? | Seuil de cohérence et deux matrices. | Oui, avec précaution. | L'AHP stratégique reste diagnostique; l'AHP goulot intervient dans la décision de goulot. |
| `aboxExport` | objet | Quand et comment produire l'ABox ? | Activation, déclencheurs, limite d'événements, namespaces et politique d'identité. | Oui pour les options prévues. | Pilote l'export Turtle runtime. |
| `performanceMeasurement` | objet | Quelle méthode de mesure est déclarée ? | Méthode, échelle, classes, poids, politique des métriques et autotests. | Principalement documentaire dans le fichier courant. | Le chargeur actuel ne lit pas ce bloc; les poids actifs viennent de `parametresGlobaux`. |
| `isa95Hierarchy` | liste de 190 | Comment les équipements sont-ils organisés ? | Identité, type, parent, acteur, machine et source. | Oui dans le JSON technique. | Recrée et valide la hiérarchie d'équipements. |
| `isa95Assignments` | liste de 71 | Quel poste correspond à quel équipement ? | Acteur, poste, équipement et source. | Oui dans le JSON technique. | Affecte les postes aux éléments ISA-95 après validation. |

## Bloc produit par la sauvegarde mais absent du JSON courant

`responsabilites` contient les responsabilités de micro-activité, le niveau hiérarchique, le type d'agent, la quantité, l'état actif et les identifiants dérivés. `sauverScenarioJSON` l'écrit systématiquement. `chargerScenarioJSON` le charge lorsqu'il existe et continue lorsqu'il est absent.

Le JSON courant déclare néanmoins `meta.nbResponsabilites`. Cette métadonnée ne remplace pas les objets détaillés. La documentation ne doit donc pas affirmer que les responsabilités courantes sont directement persistées dans ce fichier précis.

## Valeurs de repli importantes

| Élément absent ou invalide | Repli établi dans le chargeur |
|---|---|
| Stock global de produit fini avant lecture | 100 |
| Stock global matière avant lecture | 100 |
| Acteur actif | vrai |
| Délai de paiement | 30 jours |
| Quantité par approvisionnement acteur | 1 |
| Dernier approvisionnement | -1 |
| Type de poste illisible | `DELAI` |
| Loi de temps absente | uniforme, paramètres 1 et 1 |
| Capacité du poste | 1 |
| Génération autonome | faux |
| Quantité par approvisionnement du poste | 1 |
| Taille de lot | au moins 1 |
| Attente de tous les prédécesseurs | faux |
| Position manuelle | faux |
| Consommation matière | faux |
| Machine active | vrai |
| Capacité machine | 1 |
| Export ABox actif | vrai |
| Export ABox à la clôture | vrai |
| Export ABox à l'arrêt | faux |
| Nombre maximal d'événements ABox | 5000 |

Les lecteurs numériques retournent le repli lorsque la valeur est absente ou non convertible. Le lecteur booléen considère `true`, `1` et `yes` comme vrais; toute autre chaîne devient fausse. Une liste de chaînes absente devient une liste vide.

## Informations persistées

La sauvegarde couvre les paramètres globaux, profils de normalisation, poids et matrices, configuration ABox, acteurs, postes, scénarios, nomenclatures, responsabilités, machines, hiérarchie ISA-95, affectations et fiches matière. Elle ajoute aussi des métadonnées et certains compteurs séquentiels.

Certaines propriétés enregistrées peuvent refléter l'instant de sauvegarde, notamment `niveauStock`, `dernierAppro` et les compteurs. Elles ne doivent pas être décrites comme de simples constantes de conception.

## Informations non persistées comme état de reprise

Le fichier ne constitue pas une sauvegarde d'exécution. Il ne restaure pas les commandes actives, produits en cours, files et délais internes, événements programmés, messages AER en transit, historique complet du blackboard, KPI courants, temps simulé courant, pannes en cours, véhicules en mouvement ou fenêtres ouvertes. Les logs et traces sont vidés avant reconstruction.

`performanceMeasurement` est écrit et présent dans le JSON courant, mais le chargeur ne l'utilise pas pour reconstituer l'état de mesure. Les poids effectifs sont relus depuis `parametresGlobaux`; les profils sont relus depuis `normalizationProfiles`.

## Contrôles et limites

Le parseur doit produire un objet racine valide. Le contrôle de version avertit sans bloquer. Les objets incorrects d'une liste peuvent être ignorés avec un avertissement, ce qui permet un chargement partiel. Les matrices AHP sont vérifiées sur leur dimension et leurs valeurs sont ensuite contrôlées par le calcul AHP. Les références de prédécesseurs introuvables sont journalisées. La validation ISA-95 peut avertir tout en laissant la configuration métier chargée.

La procédure utilisateur devra donc recommander de lire la fenêtre de confirmation, de contrôler les comptages et de consulter les avertissements avant le démarrage.

