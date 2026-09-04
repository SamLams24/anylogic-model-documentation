# Audit en lecture seule des artefacts locaux de sources/model

## Portée et méthode

Cet audit examine, sans les modifier, les fichiers non suivis présents dans `sources/model/` au moment de la tranche des chapitres 16 à 20: un fichier `.autosave` et 28 fichiers PNG. Aucun fichier n'a été supprimé, déplacé ou stagé. L'audit s'appuie sur une recherche exacte des noms de fichier dans `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp`, sur le comptage des blocs `<Resource>` du projet AnyLogic et sur une comparaison de taille et de contenu pour le fichier `.autosave`.

## `SCONTO_SVU_FINAL_VALIDATED.alp.autosave`

**Statut : TEMPORAIRE_PROBABLE.**

Ce fichier porte l'extension `.autosave`, caractéristique d'une sauvegarde automatique produite par AnyLogic pendant qu'un projet reste ouvert dans l'environnement de développement. Sa date de modification, le 4 septembre à 14 h 17, est nettement postérieure à celle du fichier validé qu'il accompagne, daté du 1er septembre à 19 h 09, ce qui confirme qu'il provient d'une session récente d'ouverture du modèle, cohérente avec la campagne de captures manuelles menée par l'utilisateur.

Sa taille, 2 242 148 octets, ne diffère que de 8 octets de celle du fichier validé, 2 242 156 octets. Une comparaison directe des deux fichiers ne relève que dix lignes de différence sur l'ensemble du document XML, et les deux fichiers se terminent par la même structure `</AnyLogicWorkspace>` précédée des mêmes identifiants `Uuid`. Ces éléments indiquent une ouverture du projet sans modification structurelle substantielle, plutôt qu'une édition significative non enregistrée.

Ce fichier peut vraisemblablement être supprimé sans perte d'information par rapport au fichier validé qu'il accompagne, mais cette décision revient à l'utilisateur: seul lui peut confirmer qu'aucune modification volontaire n'a été faite dans cette session AnyLogic avant l'autosauvegarde.

## Fichiers PNG

**25 fichiers, statut : RESSOURCE_MODELE_PROBABLE.**

`sources/model/SCONTO_SVU_FINAL_VALIDATED.alp` contient exactement 25 blocs `<Resource>`, chacun avec `<Location>FILE_SYSTEM</Location>` et un `<Path>` correspondant exactement à l'un des 25 fichiers suivants: `aiguillage.png`, `back-office.png`, `box (1).png`, `container.png`, `delay02.png`, `delivery-truck.png`, `email.png`, `enterprise.png`, `facility.png`, `factory-machine.png`, `forklift.png`, `gestion.png`, `jacket.png`, `manufacturing.png`, `ordre.png`, `produit.png`, `replacement.png`, `roadmap.png`, `stock.png`, `stockage.png`, `stockage02.png`, `stocks.png`, `storage.png`, `supply-chain-management.png` et `task.png`. Chacun de ces noms apparaît également dans un bloc `<ImageResourceReference>` associé à une `<ClassName>` du paquetage `sconto_vsm_generic`, ce qui confirme qu'il s'agit d'icônes utilisées par la présentation du modèle, probablement pour représenter des acteurs, des postes ou des flux dans les vues graphiques.

Ces 25 fichiers correspondent donc vraisemblablement à des ressources attendues par le modèle plutôt qu'à des fichiers temporaires. AnyLogic les recherche sur le système de fichiers, relativement à l'emplacement du projet, lorsqu'il affiche les icônes correspondantes; leur absence provoquerait probablement un icône par défaut plutôt qu'une erreur de chargement, mais ne restituerait pas la présentation d'origine. Ils devraient plutôt être versionnés avec le modèle que supprimés, sous réserve de confirmation par un mainteneur du modèle.

**3 fichiers, statut : NON_REFERENCE.**

Trois fichiers ne correspondent à aucun bloc `<Resource>` ni à aucune autre occurrence de leur nom exact dans `SCONTO_SVU_FINAL_VALIDATED.alp`: `control-system.png`, `industrial-revolution.png` et `packages.png`. Ils font partie du même lot que les 25 fichiers précédents par leur date et leur origine probable, mais rien dans le fichier ALP n'indique qu'ils soient mobilisés par le modèle actuel. Ils peuvent provenir d'un lot d'icônes téléchargé plus large que celui effectivement utilisé.

Faute de certitude sur leur provenance exacte, ce statut reste une présomption raisonnable plutôt qu'une preuve définitive; un fichier peut en théorie être référencé indirectement d'une façon que cette recherche textuelle ne capture pas.

## Tableau récapitulatif

| Fichier | Statut | Élément de preuve |
|---|---|---|
| `SCONTO_SVU_FINAL_VALIDATED.alp.autosave` | `TEMPORAIRE_PROBABLE` | Extension autosave, 8 octets de différence avec le fichier validé, dix lignes de différence textuelle. |
| 25 fichiers PNG listés ci-dessus | `RESSOURCE_MODELE_PROBABLE` | Chacun correspond à un bloc `<Resource>` avec `Location=FILE_SYSTEM` et à un `<ImageResourceReference>` du paquetage `sconto_vsm_generic`. |
| `control-system.png` | `NON_REFERENCE` | Aucune occurrence exacte du nom de fichier dans l'ALP. |
| `industrial-revolution.png` | `NON_REFERENCE` | Aucune occurrence exacte du nom de fichier dans l'ALP. |
| `packages.png` | `NON_REFERENCE` | Aucune occurrence exacte du nom de fichier dans l'ALP. |

## Recommandation

Aucune suppression n'a été effectuée. Pour les 25 fichiers `RESSOURCE_MODELE_PROBABLE`, une décision humaine devrait porter sur leur ajout au suivi Git aux côtés du modèle plutôt que sur leur suppression. Pour le fichier `.autosave` et les 3 fichiers `NON_REFERENCE`, une décision humaine devrait confirmer qu'aucune information utile n'y est attachée avant un éventuel nettoyage, cet audit ne pouvant établir cette absence avec une certitude totale depuis une simple recherche textuelle.
