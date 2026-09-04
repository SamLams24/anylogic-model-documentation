# Rapport de rédaction des chapitres 11 à 15

## Périmètre réalisé

Les cinq chapitres prioritaires du guide utilisateur ont été rédigés intégralement:

1. prise en main et navigation;
2. configuration d'une simulation;
3. nomenclature, matières et stocks;
4. sauvegarde et chargement d'une configuration JSON;
5. lancement et suivi d'une simulation.

Les notes internes de fondation ont été retirées de ces chapitres. Une micro-passe dans les chapitres 1 à 5 a remplacé les emplois narratifs de `run` par `exécution` et reformulé le rôle de l'ordre `REAPPRO_*` sans lui attribuer une action d'agent.

## Sources utilisées

La source modèle est `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp`. Le JSON `sources/model/scenario_ZENER_RETARD_FOURNISSEUR.json`, les guides documentaires et les audits `UI_INVENTORY.md`, `JSON_WORKFLOW_AUDIT.md` et `OLD_DOC_AUDIT.md` ont complété la vérification. L'ancien DOCX a servi uniquement à repérer des cadrages possibles.

Le fichier candidat modifié localement par l'utilisateur n'a été ni utilisé comme preuve, ni modifié, ni ajouté à la tranche.

## Éléments d'interface vérifiés

L'audit a confirmé huit vues et une fenêtre complémentaire de suivi en temps réel. Les champs et commandes décrits couvrent la création des acteurs et des postes, les scénarios et gammes, les responsabilités et machines, les deux niveaux de pondération, les quatre zones de la nomenclature, les workflows JSON et les fenêtres de préparation d'une exécution.

Le démarrage, l'arrêt et la réinitialisation ont été relus dans le modèle. Le chargement JSON est refusé pendant une exécution active. La réinitialisation ne remplace pas le chargement d'une autre configuration. L'arrêt manuel reste distinct de la clôture métier d'une commande.

L'annexe E contient 73 lignes de référence couvrant 169 libellés de contrôle. Chaque ligne indique la vue ou fenêtre, le libellé visible, le type utilisateur, l'identifiant technique, le rôle, la valeur attendue, l'effet et la précaution. L'annexe est composée en paysage pour conserver une taille de lecture correcte.

## Captures

Aucune capture réelle actuelle n'a été intégrée. Les 21 emplacements prévus utilisent `FigureOrPlaceholder` avec un nom et une légende stables. La checklist `UI_CAPTURE_CHECKLIST.md` indique pour chaque capture l'état à préparer, les éléments obligatoires, les éléments à éviter, la présence éventuelle d'une ancienne image et le statut `CAPTURE_A_FAIRE`.

Les anciennes images restent des références de cadrage. Aucun écran n'a été reconstitué et aucun zoom annoté n'a été produit sans capture source actuelle.

## Diagrammes et workflows

Trois diagrammes ont été générés et contrôlés visuellement:

| ID | Fichier | Fonction |
|---|---|---|
| DOC-A26 | `parcours_utilisateur.png` | Distinguer les parcours Préparer, Exécuter et Analyser sans imposer un ordre unique. |
| DOC-A27 | `blocs_json.png` | Regrouper les treize blocs courants par famille métier. |
| DOC-A30 | `sequence_selection_json.png` | Montrer le rafraîchissement, la sélection, le chargement et la confirmation. |

Les workflows DOC-A28 et DOC-A29 sont réutilisés pour la sauvegarde et la reconstruction. Le générateur PowerShell a été étendu afin que les trois nouvelles figures restent reproductibles.

## Workflow JSON et portée de la preuve

Le chapitre 14 explique la sauvegarde, la détection des fichiers `scenario_*.json`, le chargement, le nettoyage de l'état précédent, la reconstruction et les contrôles utilisateur. Il indique très tôt que le JSON conserve la configuration et ne constitue pas un point de reprise d'une simulation en cours.

Le fichier courant possède treize blocs racine. La sauvegarde du modèle peut produire un quatorzième bloc consacré aux responsabilités. Cette asymétrie est présentée comme un enrichissement possible, pas comme une erreur.

Les valeurs des profils, retours, perturbations, budgets et animations sont qualifiées comme paramètres disponibles. Aucune option n'est déclarée validée quantitativement sans exécution archivée correspondante.

## Simplifications pédagogiques

Le corps emploie le vocabulaire de l'utilisateur: champ, liste, case, commande, fenêtre, vue, tableau et indicateur. Les identifiants techniques sont réservés à l'annexe E. La structure suit les objectifs de préparation, d'exécution et d'analyse, plutôt que l'ordre des variables du modèle.

Les treize blocs JSON sont regroupés par rôle au lieu d'être reproduits comme un inventaire brut. Les réglages d'animation sont séparés du temps métier. Le rapport des besoins matière est distingué d'une consommation observée. Les profils de test sont distingués des scénarios et des perturbations.

## Points de relecture humaine

Une relecture utilisateur reste recommandée pour les libellés visibles sans accents dans la zone JSON, la compréhension des deux commandes `Appliquer` de la nomenclature et la formulation des profils de test. La campagne de captures devra vérifier visuellement chaque libellé et chaque état contre le modèle validé.

L'annexe E doit être relue par un mainteneur afin de confirmer les identifiants regroupés et par un utilisateur afin de vérifier que les précautions restent compréhensibles. Les captures de suivi devront provenir d'une exécution identifiée et archivée.

## Pagination et compilation

Le PDF comptait 51 pages physiques avant cette tranche. Il en compte 75 après intégration, soit 24 pages physiques supplémentaires. La pagination principale se termine à la page 66, les pages liminaires expliquant l'écart avec le nombre physique du fichier.

Le contrôle `python documentation/scripts/quality_check_documentation.py` réussit en mode fondation. Deux passes XeLaTeX finales ont produit `documentation/documentation.pdf`. Le journal final ne contient aucun avertissement, aucune référence indéfinie et aucun débordement.

## Recommandation

La tranche suivante devrait commencer par la campagne manuelle des 21 captures. Les vues Exécution, Vue Globale, Hiérarchie et Structure animée pourront ensuite alimenter les chapitres 16 et 17 sans dupliquer les descriptions déjà établies dans le guide utilisateur.
