# Enrichissement scientifique et modèle de communication multi-agents

Date: 2026-09-04. Branche: documentation-latex-rewrite. Commit de départ: `5986fbdb73cc25c2b7e8098a65d7790ec591fdab`.

## Vérification préalable des documents sources

Conformément à la remarque de l'utilisateur sur une possible confusion de nommage, les cinq fichiers de `sources/documents/` ont été extraits (zip + XML, sans dépendance externe) et leur contenu réel lu avant toute utilisation:

- `communications_inter_agents_flux_global.docx` (53 Ko): confirmé comme le document A, « Tableaux clarifiés du flux global », avec la correspondance rôles/agents/messages et la note sur `ASup-sDx`/`AOe-sMx.2`.
- `analyse_tracable_execution_agents.docx` et `SCONTO_SVU_Analyse_Traceable_Execution_Rupture_Stocks_FINAL.docx` (778 348 octets chacun): fichiers strictement identiques octet pour octet; il s'agit du même document B déjà catalogué dans une tranche antérieure, pas d'un nouveau contenu.
- `guide_abox_vsm_scor_pi.docx` (72 Ko): confirmé comme le document C, guide de génération ABox et traçabilité VSM → SCOR → PI, mais explicitement titré « Baseline C14.2.1, Run final Cas 3 » avec un PI de 8,25041342/10: un ancien run, utilisé uniquement pour sa méthode, jamais pour ses chiffres.

## Profils de test: statut réel

Vérification directe dans l'ALP:

1. `ouvrirProfilsTest()` existe (ligne 4324): elle ouvre une boîte de dialogue `JOptionPane` listant Cas 1, Cas 2, Cas 3 et Personnalisé.
2. Un bouton réel l'appelle: `btnProfilsTest` (id `1799900001222`, `PublicFlag=true`, `PresentationFlag=true`, ligne 28708).
3. Ce bouton n'apparaît dans aucune capture de la vue Configuration réunie pour cette documentation, alors que les boutons voisins de réglage y figurent tous.

Conclusion retenue: **HIDDEN_OR_OUT_OF_VIEW** pour ce bouton précis. Un second mécanisme, entièrement distinct et confirmé visible, a été découvert dans le code: sélectionner une entrée `ZENER CAS 1/2/3` dans la liste normale des scénarios déclenche automatiquement `synchroniserProfilAvecScenarioSelectionne()` via `estScenarioCasTest()`, appliquant le même profil de stock. C'est ce mécanisme, réellement accessible, qui est désormais documenté comme voie principale.

Références corrigées: 6 emplacements (chapitre 15, chapitre 11, deux lignes de l'annexe E, `UI_INVENTORY.md`, `UI_CAPTURE_CHECKLIST.md`). La légende de `ui_profils_test.png` a été corrigée pour décrire fidèlement ce que la capture montre déjà (liste des scénarios), plutôt que de exiger une nouvelle capture impossible. Le bouton `btnProfilsTest` est documenté au chapitre Maintenance sous le statut `CAPACITE_INTERNE_NON_EXPOSEE`.

## Chapitre 9 enrichi

`documentation/chapters/09-scor-pi.tex` restructuré en 13 sections: position de SCOR, valeur physique vers score, introduction aux ensembles flous, grades flous SCONTO-SVU, agrégation d'un attribut, construction des cinq attributs, agrégation des cinq attributs, défuzzification et PI, mise en œuvre adaptée de Theeranuphattana et Tang, exemple numérique complet, lecture arborescente, distinction AHP local/PI, limites méthodologiques. Le chapitre reste pédagogique et renvoie systématiquement à la nouvelle annexe H pour les équations complètes.

Théorie floue ajoutée avec une formulation précise: SCONTO-SVU exploite des degrés d'appartenance à six grades linguistiques A à F et leurs vecteurs, sans réaliser l'arithmétique générale des nombres flous. Aucune affirmation d'implémentation plus large que ce qui est réellement codé.

## Exemple numérique: entièrement vérifié, pas recalculé arbitrairement

Le vecteur flou global du PI est **exporté directement** dans l'ABox du run de validation (`run:fuzzy_PI_RUN_1773129600000_1788264883846`), pas recalculé pour cette documentation. L'annexe H le reproduit tel quel: `[0,56113868; 0,04219465; 0,01666667; 0,01666667; 0,00160051; 0,36173282]`, dont la défuzzification redonne exactement 6,11881172.

L'exemple pédagogique détaillé porte sur l'attribut AG, entièrement reconstruit à partir de trois métriques réelles de l'ABox (`AG.1.1`, valeur 0,5, Bottom 0, Perfect 1, score 5, exactement au milieu des grades C et D; `AG.3.32`; `PROXY.AG.SYSTEM_UTILIZATION`), avec vérification que l'agrégation pondérée des trois vecteurs (poids 1/3 chacun) redonne exactement le score AG publié, 4,73462025.

## Theeranuphattana et Tang: mise en œuvre détaillée

Nouvelle sous-section distinguant explicitement la méthode de référence (valeurs de performance → normalisation → grades flous → agrégation multicritère → indice composite) de l'adaptation SCONTO-SVU (événements AnyLogic → VSM → valeur physique SCOR/interne → Bottom/Perfect, score → grades flous, agrégation par attribut → PI), avec la précision que la contribution propre du modèle se situe en amont, dans la transformation d'une exécution simulée en mesure physique. Chan et Qi restent cités pour justifier la mesure process-based et l'agrégation multicritère floue, sans affirmer une reproduction exacte.

## Arbres et diagrammes créés

Sept nouvelles figures, toutes générées par le script reproductible étendu (`documentation/scripts/generate_documentation_figures.ps1`, nouvelles fonctions `Write-TreeDiagram` et `Write-MembershipCurves`):

- `grades_flous_a_f.png`: fonctions d'appartenance triangulaires des six grades.
- `theeranuphattana_sconto.png`: comparaison à deux colonnes, méthode de référence et adaptation.
- `arbre_pi_metriques.png`: arbre à trois niveaux, PI → 5 attributs → 15 métriques contributives, avec de vrais embranchements.
- `arbre_construction_performance.png`: arbre événements → observations → métriques → grades → attributs → PI, avec embranchement par famille de processus et par attribut.
- `arbre_agents_detaille.png`: arbre des agents confirmés, du niveau stratégique à l'exécution, avec la règle Deliver explicitement représentée.
- `flux_global_messages.png`: arbre décisionnel de la commande au service, avec rappel explicite que CMD reste Make-to-Stock.
- `boucle_objectif_preuve.png`: boucle descendante objectif/plan et boucle montante fait/preuve.

Un bug de coordonnées (chevauchement de deux boîtes) et plusieurs chevauchements de titre ont été détectés par relecture visuelle et corrigés avant la version finale.

## Agents: deux niveaux de catalogue

`documentation/appendices/c-agents.tex` complétée d'une Table 2 (26 identifiants ou patrons d'agents), chaque identifiant vérifié individuellement contre l'ALP. Règles confirmées et documentées explicitement:

- Deliver: `ASup-sD1` encapsule uniquement `sD1.3` à `sD1.7`; `AOe-sD1.8` Inventory, Picking, Packing, Loading et Transport restent des agents d'exécution distincts. La trace du run utilise cependant les identifiants `AOp-sD1.1`, `AOp-sD1.3`, `AOp-sD1.7` comme émetteur/destinataire effectifs; les deux formes sont documentées plutôt que tranchées arbitrairement.
- Make: les contrôles de capacité sont portés collectivement par `AOe-sM1.2` à `AOe-sM1.7` et les `MachineAgent` concernés; `AOe-sM1.2` porte plus spécifiquement la vérification de disponibilité matière.

Deux tableaux de statut distincts: `IMPLEMENTE` (structure disponible) et `OBSERVE_RUN_FINAL` (confirmé émetteur ou destinataire dans l'ABox du run de validation, via `senderId`/`receiverId`), jamais les compteurs d'un ancien document.

## Messages: catalogue vérifié en trois temps

`documentation/appendices/g-messages-flux-global.tex`, nouvelle annexe obligatoire. Méthode: la liste candidate de 71 messages issue du document de travail source a été vérifiée mot pour mot contre l'ALP, puis contre les sujets `aer:hasMessageSubject` effectivement présents dans l'ABox du run de validation.

- 62 messages `OBSERVE_RUN_FINAL`, organisés dans le tableau principal par onze familles (A à K, moins Return qui reste sans catalogue de messages propre).
- 6 messages `IMPLEMENTE_NON_OBSERVE` (confirmés dans l'ALP, non déclenchés par ce run précis): `MakeOperationalFeasibility`, `ExecutionEnd`, `ProductionCompleted`, `ProductAvailableForDelivery`, `DeliveryTaskAssignment`, `PriorityDecision`.
- 6 messages `SOURCE_HISTORIQUE_NON_CONFIRMEE`, exclus du tableau principal: `ExecutionDelay`, `ExecutionFailure`, `EscalationRequest`, `PolicyDecision`, `DeliveryDateUpdate`, `ProposedDeliveryDate`.

La notation générique `x` du document source (MTS/MTO/ETO) est expliquée une seule fois puis abandonnée: seuls les identifiants de l'instance 1, réellement Make-to-Stock, sont publiés.

## Annexes G et H

- `documentation/appendices/g-messages-flux-global.tex`: créée, câblée dans `documentation.tex` après l'annexe F.
- `documentation/appendices/h-formalisme-pi.tex`: créée, câblée après l'annexe G. Contient les équations complètes (Bottom/Perfect, fuzzification, agrégation, défuzzification, agrégation globale) et les deux exemples numériques entièrement vérifiés.

## Anciennes valeurs volontairement exclues

Aucune valeur du document C (PI 8,25041342, Lead Time 361,92 s, 179 nœuds ISA-95, 64 micro-activités, 66 messages AER, `RUN_1773129600000_1786484573037`) n'a été recopiée dans la documentation finale. Seule la méthode de calcul (formules Bottom/Perfect, fuzzification, agrégation) a été reprise, puis appliquée aux données du run final `RUN_1773129600000_1788264883846`.

Valeurs actuelles confirmées préservées: RL = 7,5; RS = 5,94733671; AG = 4,73462025; CO = 0; AM = 9,70588235; PI = 6,11881172; AHP local = 0,730; ISA-95 = 190/71; CMD reste Make-to-Stock.

## Correction incidente: cleveref et les annexes

En relisant le chapitre 9 compilé, un défaut préexistant a été découvert: `\cref` pointant vers un label de niveau annexe (`ann:xxx`) affichait « appendix » en anglais au lieu de « annexe », faute d'un `\crefname{appendix}{...}` dans `preamble.tex`. Ce défaut affectait déjà plusieurs renvois antérieurs à cette tranche (annexes C, D, F). Corrigé une fois pour tout le document par l'ajout de `\crefname{appendix}{annexe}{annexes}` et `\Crefname{appendix}{Annexe}{Annexes}`; vérifié par relecture du texte extrait du PDF final: 0 occurrence de « appendix » restante.

## Compilation et contrôles

- `xelatex` deux fois avec `-jobname=sci_enrich`, jobname distinct de `documentation` et de `final_corrected`.
- 0 référence non définie après la deuxième passe.
- `Overfull \hbox`: 150 après la première rédaction complète, réduits à 30 après correction ciblée (`\allowbreak` sur les identifiants longs des nouvelles annexes G et H, rééquilibrage de deux tableaux de l'annexe H, correction de deux chevauchements de titre de figure et d'un chevauchement de coordonnées). Les deux plus grands tableaux ajoutés (catalogue des messages, Table 2 des agents) ont été relus visuellement à 130 dpi: aucun chevauchement de texte constaté.
- `python documentation/scripts/quality_check_documentation.py`: SUCCES (32 fichiers).
- `python documentation/scripts/quality_check_documentation.py --final`: SUCCES.
- 0 occurrence de « Illustration planifiée », 0 caractère U+2014, 0 marqueur « ?? » dans le texte extrait du PDF final.
- `documentation/documentation.pdf` régénéré depuis la compilation finale (renommage déterministe depuis `sci_enrich.*`).

## Points hors périmètre non résolus

Les quatre captures signalées `RESTE_OUVERT` par le rapport de corrections précédent (`ui_nomenclature.png`, `ui_retours_qualite.png`, `ui_responsabilites_machines.png`) restent dans le même état: aucune nouvelle capture n'a été fournie durant cette tranche.
