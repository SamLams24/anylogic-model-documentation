# Audit final de la documentation SCONTO-SVU

Date: 2026-09-04. Branche: documentation-latex-rewrite. Commit de référence audité: `0ada48eac6f5f781fcf91217c89f4ad1a980647e`.

Mission en lecture seule: aucun fichier LaTeX, Markdown ou figure n'a été modifié. Seul ce rapport est écrit.

## Résumé exécutif

Le document est scientifiquement sobre et globalement fiable: les 14 valeurs numériques publiées de l'exécution de validation (temps VSM, scores d'attribut, PI, AHP local, ISA-95) ont toutes été vérifiées au chiffre près contre `RUN_VERIFICATION.md` sans le moindre écart, les distinctions structurantes (CMD/REAPPRO, AHP local/PI, AER sans expansion inventée, PCE estimé, portée du PI, SCOR interne vs officiel, ISA-95 190/71) sont posées et respectées de façon cohérente sur les vingt chapitres et les six annexes, et la bibliographie reprend exactement les dix références fournies sans altération.

Deux catégories de problèmes empêchent néanmoins une validation immédiate. D'abord, un nom de fonction fabriqué dans l'annexe B (`declencherRetourClient`, absent de l'ALP) et deux identifiants d'interface inexacts dans l'annexe E violent directement la règle de ce projet: ne jamais présenter un nom technique comme vérifié sans confirmation dans l'ALP. Ensuite, plusieurs défauts de rendu réels ont été confirmés visuellement: chevauchement de texte illisible dans le tableau A.3, deux tableaux vedettes (A.1 et C.2) dont la dernière colonne empiète sur l'en-tête de page en mode paysage, et quatre captures d'écran présentant soit un état incohérent avec le reste du chapitre, soit un contenu ne correspondant pas à la légende, soit des éléments d'interface étrangers au modèle (barre de favoris de navigateur, console IDE en arrière-plan).

## BLOCKERS (1)

1. **Fonction inventée dans l'annexe B.** `documentation/appendices/b-fonctions.tex:51` catalogue `declencherRetourClient` comme fonction ouvrant la chaîne Return. Cette fonction n'existe pas dans `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp` (0 occurrence). Les fonctions réelles couvrant ce rôle sont `evaluerRetourClientApresLivraison` et `lancerFluxVisuelRetourClient` (confirmées présentes par recherche directe dans l'ALP). Ce point viole directement la politique de sources du projet, qui interdit de deviner un nom technique.

## MAJOR (9)

1. **Identifiant d'interface inexact, annexe E (préexistant).** `documentation/appendices/e-interface.tex:63` cite le contrôle `btnResetPoidsN3`. Ce nom n'existe pas dans l'ALP; le bouton réel est `btnReinitialiserPoidsN3`.
2. **Identifiant d'interface inexact, annexe E (introduit dans la tranche précédente).** `documentation/appendices/e-interface.tex:106` cite `supervisor.getGoulotsText`, absent de l'ALP. Ce nom provient de `UI_INVENTORY.md`, qui semble lui-même désynchronisé de l'ALP sur ce point; le bouton et la méthode réels s'apparentent à `btnDashGoulots` et `getGoulotsRapport`. `UI_INVENTORY.md` mériterait une revalidation contre l'ALP avant réutilisation.
3. **Chevauchement de texte illisible, tableau A.3.** `documentation/appendices/a-structure-json.tex:92`. La ligne `tailleLot, attendTousLesPredecesseurs` déborde sa colonne (0,24 largeur de texte) sans point de coupure; le rendu montre `attendTousLesPredecessebooléen`, le mot chevauchant la colonne Type voisine. Confirmé visuellement à 150 dpi sur la page correspondante du PDF.
4. **Débordement systématique du tableau A.1 (Blocs racine).** Les cinq groupes de lignes du tableau provoquent un `Overfull \hbox` de 48,01 pt en mode paysage (`a-structure-json.tex` lignes 17–47). Le rendu confirme que la colonne Remarque empiète visiblement sur l'en-tête de page pivoté (« Documentation SCONTO-SVU » / « Fonctionnement et utilisation ») sur les deux pages du tableau, et que la ligne `responsabilites` affiche `responsabiliteFromJsonresponsabiliteToJson` collés sans séparation entre les colonnes Fonction de chargement et Fonction de sauvegarde.
5. **Débordement systématique du tableau C.2 (Agents et objets pilotés).** Même défaut que le point précédent (`c-agents.tex` lignes 45–77, `Overfull \hbox` de 27,94 pt répété cinq fois): la colonne Objets pilotés empiète sur l'en-tête de page pivoté sur plusieurs lignes (Stratégique, Pilotage opérationnel, Exécution, Machine).
6. **Barre de favoris de navigateur visible dans une capture.** `documentation/figures/screenshots/ui_nomenclature.png` et sa variante annotée `ui_nomenclature_annotee.png` montrent, en haut à droite, des icônes et libellés tronqués (`nonRegressionRow`, `documentationS15C...`, `documentationS15F...`) qui appartiennent à la barre de favoris du navigateur ayant servi à la capture, pas à l'application SCONTO-SVU.
7. **Fenêtre IDE visible en arrière-plan d'une capture.** `documentation/figures/screenshots/ui_retours_qualite.png` laisse apparaître, derrière la boîte de dialogue modale, du texte d'arrière-plan (« ...odel required to build the model: », un chemin local `C:\Program Fil...`, « [Java Application] ») provenant probablement d'une console d'exécution Eclipse/IDE.
8. **État incohérent d'une capture réutilisée deux fois.** `documentation/figures/screenshots/ui_responsabilites_machines.png` (utilisée au chapitre 12 et au chapitre 16) affiche « Responsabilités configurées : 0 », « Machines configurées : 0 » et un champ Micro-activité vide (« aucune micro-activité configurée »), alors que la configuration de référence chargée dans les autres captures du même chapitre comporte 71 postes et 1 machine (confirmé par `ui_json_charge.png`, qui affiche explicitement « Machines : 1 »). La capture semble provenir d'une session sans configuration chargée.
9. **Contenu de capture ne correspondant pas à sa légende.** `documentation/figures/screenshots/ui_profils_test.png`, légendée « Fenêtre Profils de test » au chapitre 15, montre en réalité une liste déroulante de scénarios (`SCENARIO DISTRIBUTION`, `ZENER CAS 1/2/3...`) avec un menu contextuel flottant « Supprimer ce scenario », et non une fenêtre dédiée avec les quatre profils Cas 1/Cas 2/Cas 3/Personnalisé décrits dans le texte et le tableau 15.1.

## MINOR (2)

1. **Texte de panneau tronqué au bord gauche de plusieurs captures.** `ui_configuration.png`, `ui_configuration_annotee.png` et `ui_vue_globale.png` laissent voir, en bordure gauche, des fragments de texte d'une liste déroulante coupée (« eMicro », « esManager », « ntentF » répété). Non trompeur, mais visuellement imparfait.
2. **Léger chevauchement décoratif.** `documentation/figures/cycle_commande.png`: le libellé « Source puis Make si besoin » touche la pointe de la flèche entrant dans « Créditer le stock fini », rendant le mot « Make » partiellement masqué.

## TYPOGRAPHIE (1)

1. **Lignes de flux qui se croisent.** `documentation/figures/modele_donnees_metier.png`: les relations « responsable » et « porte » se croisent en diagonale au centre du schéma. Les étiquettes restent lisibles individuellement; c'est un choix de mise en page perfectible, pas une erreur.

## OPTIONNEL (3)

1. Revalider systématiquement `UI_INVENTORY.md` contre l'ALP: au moins deux identifiants qu'il porte (`btnResetPoidsN3`, `supervisor.getGoulotsText`) ne correspondent plus aux noms réels, ce qui suggère que ce document de référence intermédiaire a pu dériver depuis sa dernière vérification directe.
2. Rééquilibrer les largeurs de colonnes des tableaux A.1 et C.2 (par exemple réduire la colonne Remarque/Objets pilotés de quelques points de pourcentage et redistribuer vers les colonnes plus courtes) pour supprimer structurellement le débordement plutôt que de le tolérer.
3. Envisager un renvoi explicite en note de bas de tableau pour la mention « cf.~profil » de l'annexe D (Bottom/Perfect), déjà expliquée en tête de section mais qui gagnerait en clarté avec un renvoi direct sur chaque occurrence.

## Table des incohérences numériques

| Valeur publiée | Source de vérité (`RUN_VERIFICATION.md`) | Valeur dans la documentation | Écart |
| --- | --- | --- | --- |
| Order Processing Time | 18 116,83756052 s | 18 116,84 s (chapitre 8, annexe D) | Aucun |
| Order Waiting Time | 46 924,40300189 s | 46 924,40 s | Aucun |
| Order Fulfillment Lead Time | 65 041,24056241 s | 65 041,24 s | Aucun |
| ZENER Process Time | 59,38852156 s | 59,39 s | Aucun |
| ZENER Waiting Time | 12,69587399 s | 12,70 s | Aucun |
| PCE estimé | 0,70870898 | 70,9 % | Aucun |
| RL | 7,5 | 7,50000000 | Aucun |
| RS | 5,94733671 | 5,94733671 | Aucun |
| AG | 4,73462025 | 4,73462025 | Aucun |
| CO | 0 | 0,00000000 | Aucun |
| AM | 9,70588235 | 9,70588235 | Aucun |
| PI | 6,11881172 | 6,11881172 | Aucun |
| AHP local | 0,730 | 0,730 | Aucun |
| ISA-95 | 190 / 71 | 190 / 71 | Aucun |

Aucune incohérence numérique détectée sur les quatorze valeurs contrôlées.

## Table des problèmes terminologiques

Aucune incohérence terminologique retenue. Les variantes de casse repérées (« Vue Globale » en titre de section et citation littérale de bouton, contre « la vue Globale » en prose descriptive, même schéma pour Logistique, Hiérarchie et Structure animée) suivent une convention cohérente et volontaire distinguant la citation exacte d'un libellé d'interface de la référence descriptive en prose; ce n'est pas un défaut. Aucun usage de « MTS » n'a été trouvé (toujours « Make-to-Stock » en toutes lettres). CMD/REAPPRO, AHP local/PI et AER restent strictement distingués partout où ils apparaissent.

## Table des problèmes de figures

| Figure | Problème | Sévérité |
| --- | --- | --- |
| `ui_nomenclature.png`, `ui_nomenclature_annotee.png` | Barre de favoris du navigateur visible | MAJOR |
| `ui_retours_qualite.png` | Fenêtre IDE/console en arrière-plan, chemin local visible | MAJOR |
| `ui_responsabilites_machines.png` | État à 0 responsabilités/0 machines incohérent avec le reste du chapitre | MAJOR |
| `ui_profils_test.png` | Contenu capturé ne correspond pas à la légende | MAJOR |
| `ui_configuration.png`, `ui_configuration_annotee.png`, `ui_vue_globale.png` | Texte de liste tronqué au bord gauche | MINOR |
| `cycle_commande.png` | Étiquette touchant une flèche | MINOR |
| `modele_donnees_metier.png` | Lignes de relation qui se croisent | TYPOGRAPHIE |

Les 61 figures uniques référencées dans le document ont été contrôlées une à une; aucune figure manquante, aucun texte de type « Illustration planifiée » n'a été trouvé dans le PDF rendu.

## Table des Overfull \hbox

27 avertissements au total sur la compilation d'audit à deux passes (`final_audit`), tous confirmés par relecture visuelle plutôt que présumés.

| Fichier source | Lignes | Amplitude | Impact visuel | Correction nécessaire |
| --- | --- | --- | --- | --- |
| a-structure-json.tex | 8–9 | 17,35 pt | Aucun, fin de paragraphe justifié | INVISIBLE_ACCEPTABLE |
| a-structure-json.tex | 17–47 (5 occurrences) | 48,01 pt | Colonne Remarque du tableau A.1 empiète sur l'en-tête pivoté; `responsabiliteFromJson`/`ToJson` collés | A_CORRIGER |
| a-structure-json.tex | 43–44 | 9,33 pt | Partie du même débordement de tableau A.1 | A_CORRIGER |
| a-structure-json.tex | 46 (2 occurrences) | 12,58 pt / 3,13 pt | Partie du même débordement de tableau A.1 | A_CORRIGER |
| a-structure-json.tex | 71 (2 occurrences) | 3,45 pt / 4,70 pt | Aucun, tableau A.2 lisible | INVISIBLE_ACCEPTABLE |
| a-structure-json.tex | 96 (2 occurrences, 12,74 pt et 0,99 pt) | ≤ 12,74 pt | Aucun impact distinct de celui déjà listé ci-dessous | INVISIBLE_ACCEPTABLE |
| a-structure-json.tex | 96 (27,24 pt) | 27,24 pt | Chevauchement `attendTousLesPredecessebooléen` dans le tableau A.3, confirmé visuellement | A_CORRIGER |
| a-structure-json.tex | 175–176 | 20,36 pt | Aucun, prose | INVISIBLE_ACCEPTABLE |
| b-fonctions.tex | 6–7 | 21,80 pt | Aucun, paragraphe d'introduction | INVISIBLE_ACCEPTABLE |
| b-fonctions.tex | 76 (2 occurrences) | 7,86 pt / 12,35 pt | Aucun, tableau B.1 confirmé lisible | INVISIBLE_ACCEPTABLE |
| c-agents.tex | 45–77 (5 occurrences) | 27,94 pt | Colonne Objets pilotés du tableau C.2 empiète sur l'en-tête pivoté | A_CORRIGER |
| c-agents.tex | 69 | 1,66 pt | Aucun | INVISIBLE_ACCEPTABLE |
| d-metriques.tex | 44–45 | 2,39 pt / 2,78 pt | Aucun, tableau D.1 confirmé lisible | INVISIBLE_ACCEPTABLE |
| f-glossaire.tex | 24–25 | 8,21 pt | Aucun, entrée CMD lisible | INVISIBLE_ACCEPTABLE |

Total: 14 occurrences A_CORRIGER (concentrées sur trois défauts réels: tableaux A.1, A.3 et C.2), 13 INVISIBLE_ACCEPTABLE.

## Évaluation des annexes A à F

- **Annexe A (Structure JSON).** Contenu exact: 13 blocs racine du fichier de référence et 14ᵉ bloc produit par la sauvegarde correctement documentés, `schemaVersion` et chargement tolérant bien qualifiés comme comportement actuel distinct d'une recommandation. Défaut de rendu confirmé sur les tableaux A.1 et A.3 (voir MAJOR ci-dessus).
- **Annexe B (Fonctions).** Un nom de fonction fabriqué (`declencherRetourClient`, BLOCKER). Les 47 autres entrées vérifiées correspondent à des noms réels de l'ALP. Bon équilibre entre fonctions individuelles et groupes documentés.
- **Annexe C (Agents).** Contenu correct et bien sourcé (les huit entrées, y compris `AERMessage` et `Machine (instance)`, sont exactement ce que montre `ui_hierarchie.png`). Défaut de rendu confirmé sur le tableau C.2. Le classement d'`AERMessage` comme entrée « transversale » plutôt que comme agent décisionnel, et de `Machine` comme niveau Exécution non décisionnel, correspond à la distinction que l'annexe pose elle-même en §C.1; le titre de l'annexe reste approprié tel quel.
- **Annexe D (Métriques).** Toutes les valeurs numériques vérifiées exactes contre `RUN_VERIFICATION.md`. Statuts de preuve correctement différenciés, AHP local explicitement exclu de la table PI. Aucun défaut de rendu trouvé.
- **Annexe E (Interface).** Deux identifiants inexacts (voir MAJOR). Le reste des contrôles ajoutés cette tranche correspond exactement à `UI_INVENTORY.md`; la couverture reste raisonnable sans chercher l'exhaustivité des 195 contrôles.
- **Annexe F (Glossaire).** 42 termes, définitions courtes et cohérentes avec le corps du texte, AER jamais développé de façon incorrecte. Aucun défaut trouvé.

## Évaluation de la bibliographie

Les dix références de `documentation/references.tex` correspondent exactement, terme à terme, à la liste fournie et déjà vérifiée dans le projet (auteurs, titres, années, DOI). Aucune recherche externe n'a été effectuée, conformément à la consigne. Les citations dans le corps du texte (chapitres 5, 6, 7, 8, 9, 10) sont placées à des endroits qui nécessitent effectivement une source et n'envahissent pas les chapitres 11 à 20.

## Évaluation du guide utilisateur (chapitres 11 à 17)

Cohérent avec l'annexe E et les captures d'écran, à l'exception des points de capture listés ci-dessus. La distinction chapitre 11 (où cliquer) / chapitre 16 (comment lire) est explicitement posée et respectée. Aucune affirmation trouvée laissant croire qu'une seule exécution valide tout le modèle, que le PI mesure une performance absolue, que le PCE est mesuré sur le terrain, que Return, les pannes, la qualité ou les bursts sont validés: chaque chapitre concerné rappelle explicitement les limites (chapitres 6, 15, 19 notamment).

## Évaluation de la maintenabilité

Le chapitre 20 pose des invariants clairs et vérifiables, correctement alignés avec les statuts probatoires du chapitre 19. Le tableau des impacts par type d'évolution renvoie vers les bonnes annexes. La principale fragilité de maintenabilité découverte par cet audit n'est pas dans le corps mais dans le processus amont: au moins un document intermédiaire (`UI_INVENTORY.md`) semble avoir dérivé de l'ALP sans revalidation, ce qui a produit deux identifiants inexacts dans l'annexe E.

## Verdict final

**CORRECTIONS_MAJEURES_REQUISES**

Justification: un nom de fonction fabriqué (BLOCKER) et neuf défauts MAJOR confirmés (deux identifiants d'interface inexacts, un chevauchement de texte rendant un identifiant illisible, deux tableaux vedettes dont une colonne empiète sur l'en-tête de page, quatre captures d'écran avec un problème de contenu ou d'hygiène de capture) doivent être corrigés avant toute validation humaine finale. Aucun de ces points ne remet en cause la rigueur scientifique du contenu vérifié (valeurs numériques, distinctions structurantes, bibliographie), mais leur persistance contredirait la politique de sources du projet et nuirait à la crédibilité des annexes techniques auprès d'un lecteur qui les utiliserait pour retrouver un objet réel dans l'ALP.
