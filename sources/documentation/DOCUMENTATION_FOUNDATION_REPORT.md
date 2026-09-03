# Rapport de fondation de la documentation SCONTO-SVU

## Résultat de la mission

La fondation de la nouvelle documentation est prête. Elle reste distincte du rapport scientifique et utilise son propre point d'entrée, `documentation/documentation.tex`. Aucun chapitre du rapport scientifique, modèle AnyLogic, classeur de résultats ou artefact Turtle n'a été modifié par cette mission.

## Ancien document

La Documentation Master Globale Consolidée RC1 a été auditée intégralement. La mission et la pagination de référence indiquent 89 pages. La propriété interne `Pages` du fichier DOCX conserve la valeur 86, ce qui constitue une métadonnée de dernière sauvegarde et non une raison de réduire le périmètre. Les 25 chapitres, le chapitre 17 détaillé et les 18 images incorporées ont été analysés.

Chaque chapitre reçoit un statut unique dans `OLD_DOC_AUDIT.md`. Le contenu utile est redistribué, tandis que les structures redondantes, le vocabulaire de génération et les formulations devenues fausses ne sont pas repris.

## Nouvelle structure

La documentation comprend cinq parties, 20 chapitres et six annexes. Le cycle de commande et la politique de stock précèdent les référentiels détaillés. La Partie IV, chapitres 11 à 17, est prioritaire et forme un véritable guide utilisateur : navigation, configuration, nomenclature, JSON, lancement, suivi, vues, résultats et exports.

`DOCUMENTATION_CHAPTER_MATRIX.md` fixe pour chaque chapitre son objectif, sa question, ses lecteurs, son niveau de technicité, ses concepts, visuels, captures, tableaux, encadrés, preuves, reports en annexe et longueur cible. Le corps est ciblé entre 75 et 90 pages, les annexes entre 15 et 25 pages, sans objectif de remplissage.

## Interface actuelle

L'ALP validé contient huit zones de vue :

1. Configuration ;
2. Exécution ;
3. Vue Globale ;
4. Logistique ;
5. Hiérarchie ;
6. Structure animée ;
7. Responsabilités et Machines ;
8. Nomenclature et matières.

Le suivi temps réel est une fenêtre ouverte par un bouton présent dans chacune des huit vues. Il ne constitue pas une neuvième vue.

La présentation de `Main` déclare 195 contrôles : 124 boutons, 38 champs d'entrée, 22 listes de sélection et 11 cases à cocher. Parmi les cases, six se trouvent dans une vue accessible. Cinq autres, associées aux processus Plan, Source, Make, Deliver et Return, sont situées hors des limites des huit vues et sont signalées comme contrôles dormants. Le nombre de champs utilisateur accessibles est donc 66, soit 38 champs d'entrée, 22 listes et six cases.

`UI_INVENTORY.md` relie les libellés utilisateur, rôles, valeurs attendues, effets, moments d'utilisation, précautions, preuves ALP et captures anciennes disponibles.

## Sauvegarde et chargement JSON

Les deux workflows ont été vérifiés par lecture du modèle validé. Cette vérification porte sur le chemin de code et ne revendique pas un nouveau test runtime.

Le fichier courant contient 13 blocs racine : `meta`, `parametresGlobaux`, `acteurs`, `postes`, `scenarios`, `machines`, `fichesMatiere`, `normalizationProfiles`, `ahpConfiguration`, `aboxExport`, `performanceMeasurement`, `isa95Hierarchy` et `isa95Assignments`.

La sauvegarde produit un quatorzième bloc, `responsabilites`. Le chargeur accepte son absence dans le fichier courant. Cette asymétrie est documentée et devra rester visible en annexe A.

La sauvegarde conserve une configuration. Elle ne crée pas un point de reprise d'une simulation en cours. Le chargement nettoie l'état, restaure les données persistées, recrée les postes et agents opérationnels, reconnecte les prédécesseurs, restaure les objets disponibles, valide la hiérarchie ISA-95, recalcule les regroupements et reconstruit l'animation. Les commandes actives, files, messages en transit, KPI courants, temporisations et mouvements ne sont pas restaurés comme état d'exécution.

## Illustrations

Le plan comprend 62 illustrations :

- 38 schémas générés, principalement diagrammes d'activité, de séquence, de classes, de hiérarchie ou de composants ;
- 20 captures réelles ;
- 4 zooms annotés.

Les cinq premières figures reproductibles ont été générées et contrôlées : architecture générale, cycle de commande, distinction CMD/REAPPRO, sauvegarde JSON et chargement JSON. Leur encodage, leurs accents, leur cadrage, leur cohérence fonctionnelle et leur lisibilité au format A4 ont été vérifiés. La figure du cycle pourra être enrichie pendant la rédaction du chapitre 4 sans modifier son principe.

Parmi les 18 anciennes captures, six sont classées `REUTILISABLE`, cinq `A_RECROPPER`, cinq `A_REMPLACER` et deux `OBSOLETE`. Ce classement autorise une image comme référence de travail, pas comme preuve expérimentale.

## Captures manuelles restantes

Les captures prioritaires à réaliser depuis le modèle courant concernent la navigation complète, Configuration, Logistique, Responsabilités/Machines, Nomenclature, Exécution, Vue Globale, Hiérarchie, Structure animée et suivi temps réel. Il faut aussi capturer proprement les fenêtres de stocks, profils de test et perturbations, puis une table de résultats associée à un run identifié.

Les captures de résultats doivent indiquer leur provenance. Les valeurs dynamiques des images anciennes ne seront pas reprises comme résultats du run validé.

## Corrections factuelles structurantes

1. `AER` n'est plus développé selon l'ancienne expansion non établie. La liste des sigles le décrit prudemment comme la classification des communications selon AMENDMENT, EXECUTION et REPORT.
2. Les anciennes notions « MTO partiel » et « MTO complet » sont remplacées par la distinction entre commande externe `CMD_*` et ordre interne autonome `REAPPRO_*`, qui préserve Make-to-Stock.
3. Les mesures VSM suivent le ledger courant et le correctif validé, pas l'ancienne logique de résidence.
4. Le suivi temps réel est une fenêtre, pas une vue supplémentaire.
5. Le JSON courant et le JSON produit par sauvegarde n'ont pas exactement le même nombre de blocs.
6. Une fonctionnalité implémentée ne sera qualifiée d'observée que si un run correspondant est archivé.

## État du squelette et prochaine tranche

Le squelette contient la page de titre, la table des matières, les listes des figures et tableaux, la liste des sigles, les cinq parties, 20 chapitres et six annexes. Les notes internes sont autorisées pour cette phase et seront masquées avant publication.

Deux passes XeLaTeX exécutées depuis la racine produisent `documentation/documentation.pdf`, 41 pages physiques au format A4. La table des matières, la liste des cinq figures, la liste du tableau de fondation, la liste des sigles et les annexes A à F sont présentes. Le journal final ne contient aucun avertissement LaTeX, aucune référence indéfinie et aucun débordement signalé. Le contrôle qualité dédié passe sur les 29 fichiers LaTeX en mode fondation.

La première tranche recommandée couvre les chapitres 1 à 5 : présentation, architecture, données métier, cycle de commande, stocks et réapprovisionnement. Elle fixe le vocabulaire et les workflows dont dépend le reste du guide. La tranche suivante doit couvrir les chapitres 11 à 15, appuyée sur les captures manuelles actuelles.
