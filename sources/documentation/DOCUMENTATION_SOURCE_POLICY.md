# Politique des sources de la documentation SCONTO-SVU

## Ordre de préséance

Toute affirmation de la documentation doit être résolue selon l'ordre suivant :

1. `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp` pour la structure, les fonctions et l'interface du modèle ;
2. `sources/model/scenario_ZENER_RETARD_FOURNISSEUR.json` pour la configuration courante ;
3. les artefacts du run VSM validé et leurs rapports de vérification ;
4. le rapport scientifique final pour les explications déjà consolidées ;
5. `sources/documents/documentation_master_RC1.docx` pour l'historique, les formulations et les captures anciennes.

Un contenu de rang inférieur ne corrige jamais silencieusement un contenu de rang supérieur. L'écart est signalé dans l'audit, puis le texte suit la preuve la plus forte.

## Niveaux de preuve

Chaque assertion technique importante reçoit l'un des statuts suivants :

| Statut | Sens documentaire | Formulation permise |
|---|---|---|
| `IMPLEMENTE` | La logique existe dans le modèle validé ou dans le JSON courant. | « Le modèle contient », « la fonction réalise ». |
| `OBSERVE_RUNTIME` | Un run archivé montre effectivement le comportement ou la valeur. | « Le run validé montre », avec renvoi vers l'artefact. |
| `DISPONIBLE_NON_QUANTIFIE` | La fonction est présente, mais aucun run archivé ne permet une conclusion quantitative. | « La fonction est disponible », avec limite explicite. |
| `HISTORIQUE_A_REVERIFIER` | L'information vient uniquement de l'ancien DOCX. | Elle reste dans les fichiers d'audit et ne devient pas un fait du guide. |

L'existence d'un bouton, d'une fonction ou d'un calcul ne vaut pas validation expérimentale. Une capture ancienne ne vaut pas non plus résultat expérimental.

## Règles d'usage par type de source

### Modèle AnyLogic validé

Le fichier ALP établit les noms des vues, les contrôles, les actions, les fonctions de sauvegarde et de chargement, les classes, les valeurs de repli et les reconstructions exécutées. Les chaînes internes ou les commentaires de développement ne doivent pas être repris tels quels dans le corps utilisateur.

### JSON courant

Le JSON établit les 13 blocs réellement présents et leur contenu configuré. Il ne prouve pas à lui seul qu'une valeur a produit un effet durant un run. Une propriété absente mais prise en charge par le chargeur doit être décrite comme facultative ou rétrocompatible, jamais comme présente dans ce fichier.

### Artefacts runtime

Seuls les artefacts recensés et vérifiés peuvent soutenir une valeur observée. Les captures issues de l'ancien document servent à reconnaître l'interface, pas à remplacer les exports du run validé.

### Rapport scientifique

Le rapport fournit une synthèse interprétative utile, mais la documentation technique doit revenir au modèle ou aux artefacts lorsqu'elle décrit une action exacte. Aucune conclusion scientifique nouvelle ne sera ajoutée dans le guide sans preuve primaire.

### Ancien DOCX

Le DOCX est une source de couverture et de pédagogie. Ses 25 chapitres sont audités dans `OLD_DOC_AUDIT.md`. Les formulations « MTO partiel » et « MTO complet », l'ancien calcul de certaines mesures VSM, les résultats annoncés comme futurs et les métadonnées de version ne sont pas repris comme état actuel.

## Configuration et état d'exécution

La documentation distingue toujours :

* la configuration persistée, par exemple les acteurs, postes, scénarios, matières, profils et affectations ;
* les éléments reconstruits, par exemple les connexions, les agents opérationnels, le positionnement et les stations d'animation ;
* l'état d'exécution non persisté, par exemple les commandes actives, les produits en cours, les files, les messages AER, les KPI courants et les temporisations.

Quelques propriétés sauvegardées, telles que des compteurs séquentiels, `dernierAppro` ou `niveauStock`, peuvent refléter un état au moment de l'enregistrement. Elles doivent être décrites avec cette nuance.

## Traçabilité minimale

Une fiche de vue cite l'identifiant de la zone AnyLogic et les identifiants de contrôles pertinents. Une procédure JSON cite la fonction principale et ses fonctions auxiliaires. Une métrique cite le run lorsqu'une valeur est donnée. Une illustration de type B cite la capture réelle ou reste un placeholder identifié.

