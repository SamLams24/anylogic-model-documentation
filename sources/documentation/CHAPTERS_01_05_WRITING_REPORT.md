# Rapport de rédaction des chapitres 1 à 5

## Périmètre réalisé

Les cinq premiers chapitres de la documentation ont été rédigés intégralement:

1. présentation de SCONTO-SVU;
2. architecture générale;
3. chaîne logistique et données métier;
4. cycle d'une commande cliente;
5. stocks et réapprovisionnement.

Les notes internes de fondation ont été retirées de ces chapitres. Les notes des chapitres suivants restent inchangées.

## Sources utilisées

La rédaction s'appuie en priorité sur le modèle `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp`, le JSON courant `sources/model/scenario_ZENER_RETARD_FOURNISSEUR.json` et le rapport `sources/runs/vsm_validation/RUN_VERIFICATION.md`. Le rapport scientifique consolidé, les règles documentaires et les audits de fondation ont servi à contrôler la terminologie, la portée et la cohérence. L'ancien document a conservé un rôle pédagogique de dernier rang.

Le modèle candidat modifié localement par l'utilisateur n'a été ni lu comme source, ni modifié, ni ajouté à la tranche.

## Figures produites et réutilisées

Huit figures nouvelles ont été créées:

| ID | Fichier | Fonction |
|---|---|---|
| DOC-A01 | `finalite_publics.png` | Relier les finalités du simulateur à ses publics. |
| DOC-A03 | `trois_flux.png` | Distinguer les flux physique, informationnel et probatoire. |
| DOC-A04 | `chaine_acteurs.png` | Montrer les fournisseurs, l'entreprise focale et le client. |
| DOC-A05 | `modele_donnees_metier.png` | Expliquer les relations entre les principaux objets métier. |
| DOC-A07 | `sequence_commande_client.png` | Montrer les échanges utiles au traitement d'une commande. |
| DOC-A09 | `decision_stock_fini.png` | Séparer la décision de service de la décision de reconstitution. |
| DOC-A10 | `besoin_net_matiere.png` | Rendre lisibles les données mobilisées par les besoins matière. |
| DOC-A11 | `sequence_reconstitution_stock.png` | Suivre l'ordre interne jusqu'au réveil de la commande. |

DOC-A02, DOC-A06 et DOC-A08 ont été réutilisées. DOC-A06 a été enrichie par une boucle explicite de réveil et de nouvelle analyse. Le générateur unique `documentation/scripts/generate_documentation_figures.ps1` produit l'ensemble de ces figures de manière reproductible.

## Choix de représentation

L'architecture utilise un diagramme de composants simplifié. Les flux et décisions utilisent des diagrammes d'activité ou des arbres de décision. Les échanges de commande et de reconstitution utilisent deux diagrammes de séquence. Les relations de données sont décrites par un diagramme de classes métier simplifié.

Ces représentations omettent volontairement les méthodes Java, les collections, les agents relais et les messages purement techniques. Les libellés conservent les noms de messages lorsqu'ils aident à suivre une responsabilité réelle.

## Décisions de simplification

Le corps du document sépare systématiquement configuration, exécution et preuve. Le JSON est présenté comme un exemple de configuration, jamais comme un résultat. La commande cliente et l'ordre interne de reconstitution disposent de parcours distincts. Les politiques de produit fini et de matière sont rapprochées dans un tableau, sans prétendre qu'elles appliquent une formule unique.

Les détails suivants restent destinés aux annexes ou aux chapitres techniques:

* signatures Java et graphes d'appels;
* cardinalités et attributs complets des objets persistés;
* hiérarchie exhaustive des agents;
* catalogue complet des messages AER;
* paramètres détaillés et schéma technique du JSON.

## Limites conservées

Un seul run archivé illustre le chemin de commande nécessitant une reconstitution. Il confirme ce comportement pour `CMD_1`, sans valider quantitativement les autres chemins ou jeux de paramètres. Le chemin avec stock initial suffisant est documenté comme implémenté, mais n'est pas présenté comme observé dans un second run.

Les correspondances SCOR ne sont pas développées dans cette tranche et ne sont pas présentées comme des métriques officielles. Les figures de séquence sont des vues pédagogiques des échanges utiles, non des traces exhaustives.

## Points à faire relire

Une relecture métier est recommandée pour le niveau de simplification du diagramme DOC-A05 et pour la présentation comparée des politiques de stock dans le chapitre 5. Aucun point bloquant n'a été identifié pendant la compilation ou le contrôle visuel.

## Pagination et compilation

Le PDF comptait 41 pages physiques avant rédaction. Il en compte 51 après intégration, soit 10 pages physiques supplémentaires. La pagination principale se termine à la page 43, les pages de titre et de matière liminaire expliquant l'écart avec le nombre physique du fichier.

Le contrôle `python documentation/scripts/quality_check_documentation.py` réussit en mode fondation. Deux passes XeLaTeX finales ont été exécutées avec succès. Le journal final ne contient aucune référence indéfinie, aucun débordement et aucun avertissement LaTeX.
