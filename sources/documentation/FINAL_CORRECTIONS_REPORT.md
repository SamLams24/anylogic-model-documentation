# Rapport de correction de l'audit final SCONTO-SVU

Date: 2026-09-04. Branche: documentation-latex-rewrite. Commit du document audité: `0ada48eac6f5f781fcf91217c89f4ad1a980647e`. Commit de l'audit: `fe020a856499ceb65b8fec13b4664bae93c3c6ab`.

Chaque point de `FINAL_DOCUMENTATION_AUDIT.md` est repris ci-dessous avec son identifiant, sa sévérité initiale, la correction appliquée, la preuve et le statut final.

## BLOCKER

**B1 — Fonction Return inventée.** Sévérité initiale: BLOCKER.
Correction: `documentation/appendices/b-fonctions.tex` ne cite plus `declencherRetourClient`. Vérification directe dans l'ALP (`sources/model/SCONTO_SVU_FINAL_VALIDATED.alp`, lignes 4440 et 4731) a confirmé deux fonctions réelles et liées par appel, pas deux étapes indépendantes: `evaluerRetourClientApresLivraison(cmd)` décide si un retour est déclenché après réception, selon la probabilité configurée (`champProbabiliteRetourProduits`, désactivable via `retoursProduitsActifs`/`modeTestSansRetours`), trace la décision, puis, si un retour est tiré, enregistre les traces d'exécution des postes Return et appelle `lancerFluxVisuelRetourClient(cmd)`, qui construit et lance l'animation de la route `sSR1.3.1 → sDR1.1.1 → sSR1.5.3 → sDR1.3.1 → sDR1.4.1 → sDR1.4.2`. Les deux fonctions sont documentées comme un groupe, avec la relation d'appel explicite, plutôt que par un remplacement mécanique d'un seul nom.
Preuve: grep direct sur l'ALP confirmant l'existence et le corps des deux fonctions; ligne 51 de `b-fonctions.tex` réécrite.
Statut final: **RESOLU**.

## MAJOR

**M1 — `btnResetPoidsN3` inexistant.** Sévérité initiale: MAJOR.
Correction: `documentation/appendices/e-interface.tex` porte désormais `btnReinitialiserPoidsN3`, confirmé présent dans l'ALP (`<Name><![CDATA[btnReinitialiserPoidsN3]]></Name>`, id `1790000000646`). `UI_INVENTORY.md` ne contenait pas ce nom littéralement (seulement une notation d'intervalle « btnRafraichirMetriquesN3 à btnVoirRapportPoidsN3 »); aucune correction n'y était donc nécessaire pour ce point précis.
Preuve: grep ALP positif sur `btnReinitialiserPoidsN3`.
Statut final: **RESOLU**.

**M2 — `supervisor.getGoulotsText` inexistant.** Sévérité initiale: MAJOR.
Correction: `documentation/appendices/e-interface.tex` cite désormais `btnDashGoulots` (le bouton réel, id `1781643767210`) et précise qu'il appelle `supervisor.getGoulotsRapport()` (méthode confirmée, id `1781200000052`), retrouvés tous deux dans l'ALP. `sources/documentation/UI_INVENTORY.md` ligne 120 a été corrigée de la même façon, puisque le nom inexact y figurait littéralement.
Preuve: grep ALP positif sur `btnDashGoulots`, `getGoulotsRapport`, et sur l'appel `supervisor.getGoulotsRapport()` dans le code du bouton.
Statut final: **RESOLU**.

**M3 — Chevauchement de texte, tableau A.3.** Sévérité initiale: MAJOR.
Correction: `\allowbreak` inséré dans `attendTousLesPredecesseurs` (`a-structure-json.tex`, ligne 92). Compilation à 150 dpi confirmant que le mot se coupe désormais proprement sur deux lignes dans sa cellule, sans toucher la colonne Type.
Preuve: rendu visuel de la page correspondante avant/après; l'entrée n'apparaît plus dans la liste des `Overfull \hbox`.
Statut final: **RESOLU**.

**M4 — Débordement structurel du tableau A.1.** Sévérité initiale: MAJOR.
Correction: colonnes rééquilibrées (somme des largeurs ramenée de 1,00 à environ 0,90 `\linewidth`, à l'image des tableaux B.1/D.1/E.1 déjà corrects), `\tabcolsep` réduit de 3 pt à 2 pt, et `\allowbreak` ajouté sur tous les identifiants longs restés entiers (`chargerScenarioJSON`, `sauverScenarioJSON`, `matriceAHPFromJson`/`ToJson`, `isa95NodeFromJson`/`ToJson`, `ahpConfiguration`, `isa95Hierarchy`, `isa95Assignments`, `responsabilites`, `responsabiliteFromJson`/`ToJson`). Une régression intermédiaire (fusion visuelle de `chargerScenarioJSON`/`sauverScenarioJSON` après le premier rééquilibrage) a été détectée par relecture visuelle puis corrigée avant la version finale.
Preuve: 0 occurrence `Overfull \hbox ... in alignment` pour ce fichier dans le journal de compilation final; rendu à 150 dpi des deux pages du tableau confirmant l'absence d'empiètement sur l'en-tête pivoté et l'absence de texte collé.
Statut final: **RESOLU**.

**M5 — Débordement structurel du tableau C.2.** Sévérité initiale: MAJOR.
Correction: même traitement que M4 (`c-agents.tex`): largeurs réduites de 0,98 à 0,89 `\linewidth`, `\tabcolsep` réduit à 2 pt, `\-` ajouté dans `OperationalPilot` et `OperationalExecution`.
Preuve: 0 occurrence `Overfull \hbox ... in alignment` pour ce fichier; rendu confirmant l'absence d'empiètement sur l'en-tête pivoté.
Statut final: **RESOLU**.

**M6 — Barre de favoris visible (`ui_nomenclature.png`, `ui_nomenclature_annotee.png`).** Sévérité initiale: MAJOR.
Correction: aucune. Aucune nouvelle capture n'a été déposée par l'utilisateur (`git status` ne montre aucune modification ni ajout dans `documentation/figures/screenshots/` pour ces deux fichiers). Conformément à la consigne de ne pas fabriquer une fausse capture ni recadrer une capture dont le défaut porte sur une zone impossible à isoler proprement sans perte d'information utile (les favoris chevauchent la zone utile de l'interface), le point reste ouvert.
Preuve: `git status --short` sans changement sur ces fichiers avant la présente tranche.
Statut final: **RESTE_OUVERT** — nécessite une nouvelle capture propre fournie par l'utilisateur.

**M7 — Fenêtre IDE visible (`ui_retours_qualite.png`).** Sévérité initiale: MAJOR.
Correction: aucune, pour la même raison que M6. Aucune nouvelle capture fournie.
Preuve: `git status --short` sans changement sur ce fichier.
Statut final: **RESTE_OUVERT** — nécessite une nouvelle capture propre fournie par l'utilisateur.

**M8 — État incohérent (`ui_responsabilites_machines.png`).** Sévérité initiale: MAJOR.
Correction: aucune. Ce fichier porte un horodatage de modification plus récent que les autres captures du répertoire, mais `git diff` ne montre aucun changement de contenu par rapport à la version déjà commise: il ne s'agit pas d'une nouvelle capture corrigée. L'incohérence signalée par l'audit (0 responsabilité, 0 machine, aucune micro-activité, alors que la configuration de référence en charge 71 et 1) subsiste donc.
Preuve: `git status --short` ne signale aucune modification de ce fichier.
Statut final: **RESTE_OUVERT** — nécessite une nouvelle capture prise avec la configuration de référence chargée.

**M9 — Contenu ne correspondant pas à la légende (`ui_profils_test.png`).** Sévérité initiale: MAJOR.
Correction: aucune, pour la même raison que M8 (aucun changement de contenu détecté). La légende n'a pas été modifiée pour masquer le problème, conformément à la consigne.
Preuve: `git status --short` sans changement sur ce fichier.
Statut final: **RESTE_OUVERT** — nécessite une capture réelle de la fenêtre Profils de test.

## MINOR

**MIN1 — Texte tronqué au bord gauche (`ui_configuration.png`, `ui_configuration_annotee.png`, `ui_vue_globale.png`).** Sévérité initiale: MINOR.
Correction: recadrage de 110 px depuis le bord gauche des trois fichiers (via un script Python/Pillow, aucune reconstruction ni retouche de contenu, uniquement un découpage rectangulaire). `ui_vue_globale.png` ne montre plus aucun fragment. `ui_configuration.png` et `ui_configuration_annotee.png` ne montrent plus le bloc de fragments principal (`eMicro`, `esManager`, etc.); un résidu minime (`ISSEUR]`, fin du mot `[FOURNISSEUR]`) subsiste sur une seule ligne, à quelques pixels du début du libellé légitime « Loi de distribution : » — un recadrage supplémentaire aurait coupé ce libellé réel, ce qui a été jugé comme dégradant la compréhension au sens de la consigne. Ce résidu très réduit est accepté comme mineur.
Preuve: relecture visuelle avant/après des trois fichiers; les figures compilées dans le PDF final restent nettes et correctement dimensionnées.
Statut final: **RESOLU** (`ui_vue_globale.png` entièrement propre) / **ACCEPTE_COMME_MINEUR** (résidu ponctuel restant sur `ui_configuration.png` et `ui_configuration_annotee.png`, sans perte d'information utile).

**MIN2 — Chevauchement décoratif (`cycle_commande.png`).** Sévérité initiale: MINOR.
Correction: le générateur `documentation/scripts/generate_documentation_figures.ps1` a été modifié pour accepter un décalage d'étiquette optionnel par arête (`-LabelOffsetX`/`-LabelOffsetY` sur `New-Edge`, valeurs par défaut inchangées `0`/`-28` pour ne pas affecter les autres figures), puis l'arête « Source puis Make si besoin » a reçu un décalage explicite (`+130`, `-15`) qui l'éloigne de la ligne et de la pointe de flèche. La figure a été régénérée en relançant le script complet; les 34 autres figures produites sont restées strictement identiques (`git status` ne montre que `cycle_commande.png` modifié).
Preuve: rendu visuel confirmant que l'étiquette ne touche plus la flèche ni la case « Créditer le stock fini ».
Statut final: **RESOLU**.

## TYPOGRAPHIE

**T1 — Lignes qui se croisent (`modele_donnees_metier.png`).** Sévérité initiale: TYPOGRAPHIE.
Correction: aucune. Le générateur actuel ne trace que des segments directs entre centres ou bords de case; supprimer le croisement demanderait un routage à points de passage non supporté aujourd'hui, ou un réagencement des huit cases qui déplacerait plusieurs relations non concernées par le signalement. Les étiquettes « responsable » et « porte » restent chacune lisibles individuellement malgré le croisement.
Preuve: relecture visuelle confirmant la lisibilité individuelle des étiquettes malgré le croisement.
Statut final: **ACCEPTE_COMME_MINEUR** — compromis documenté, original conservé.

## OPTIONNEL

**O1 — Revalidation de `UI_INVENTORY.md` contre l'ALP.** Sévérité initiale: OPTIONNEL.
Correction: extraction automatique des 147 identifiants techniques entre accents graves du fichier (`btn*`, `get*`, `show*`, `supervisor.*`, `champ*`, `combo*`, `view*`, etc.) et vérification individuelle contre l'ALP. Un seul était désynchronisé (`supervisor.getGoulotsText`, voir M2), déjà corrigé. Après correction, les 147 identifiants sont confirmés présents dans l'ALP.
Preuve: script de vérification exécuté deux fois (avant et après correction): 1 puis 0 identifiant manquant sur 147.
Statut final: **RESOLU**.

**O2 — Rééquilibrage structurel des tableaux A.1 et C.2.** Sévérité initiale: OPTIONNEL.
Correction: appliquée conjointement avec M4 et M5 ci-dessus, plutôt que comme un correctif séparé, puisque la seule façon de supprimer l'empiètement de façon fiable était de rééquilibrer réellement les colonnes.
Statut final: **RESOLU** (voir M4, M5).

**O3 — Note explicite Bottom/Perfect, annexe D.** Sévérité initiale: OPTIONNEL.
Correction: ajout, immédiatement après le tableau D.1 dans `documentation/appendices/d-metriques.tex`, d'un encart Bon à savoir reprenant exactement le texte demandé: « Les valeurs Bottom et Perfect sont définies dans les entrées correspondantes de `normalizationProfiles`. Elles sont des paramètres du modèle et ne constituent pas une calibration terrain. » Aucune valeur numérique n'a été ajoutée ou inventée.
Preuve: relecture du fichier source et de la page compilée correspondante.
Statut final: **RESOLU**.

## Point additionnel traité: nomenclature de l'annexe C (section 18 de la mission)

Bien que non comptabilisé parmi les 16 points ci-dessus (il provient de la section 18 de cette mission corrective, pas directement de `FINAL_DOCUMENTATION_AUDIT.md`), ce point a été traité par prudence structurelle: le titre de chapitre « Catalogue des agents » a été conservé tel quel, conformément à la consigne de ne pas modifier la structure documentaire pendant cette mission. À la place, une phrase a été ajoutée juste avant le tableau C.2 précisant explicitement que celui-ci réunit les cinq agents décisionnels, la ressource Machine et les deux structures transversales Blackboard et AER, et la légende du tableau a été reformulée en « Agents décisionnels, structures transversales et ressources pilotées, par niveau » pour ne plus laisser croire que toutes les lignes sont des agents décisionnels. `AERMessage` et `Machine (instance)` restent dans le catalogue, comme demandé.

## Vérification finale

- Compilation `xelatex` deux fois avec `-jobname=final_corrected`, jobname distinct de `documentation`.
- 0 référence non définie, 0 citation non définie après la deuxième passe.
- 127 pages physiques (stable entre la première relecture et la version corrigée).
- `Overfull \hbox`: 27 avant correction, 13 après; les entrées `in alignment` (tableaux A.1 et C.2) ont toutes disparu. Les 13 restantes sont des débordements inférieurs à 21 pt dans du texte justifié ou des cellules isolées, confirmées sans impact visuel par relecture directe des pages concernées lors de l'audit initial et non retouchées cette fois puisqu'elles n'ont pas été signalées comme `A_CORRIGER`.
- `python documentation/scripts/quality_check_documentation.py`: SUCCES.
- `python documentation/scripts/quality_check_documentation.py --final`: SUCCES (le script a été corrigé pour vérifier l'existence réelle du fichier référencé par chaque `\FigureOrPlaceholder` plutôt que d'interdire la macro elle-même; `\TablePlaceholder` et le texte « Illustration planifiée » restent interdits en mode final, hors définition de macro dans `preamble.tex`).
- 0 occurrence de « Illustration planifiée » dans le texte extrait du PDF final.
- 0 caractère U+2014.
- `documentation/documentation.pdf` régénéré depuis la compilation corrigée (renommage déterministe depuis `final_corrected.*`, comme dans les tranches précédentes).

## Point hors périmètre signalé pour information

`sources/model/SCONTO_SVU_FINAL_VALIDATED.alp` porte, au moment de cette mission, une modification non produite par cette session (aucun outil d'écriture n'a été appelé sur ce fichier ici): le champ interne `<Name>` est passé de `SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE` à `SCONTO_SVU_FINAL_VALIDATED`, un changement d'une ligne, horodaté pendant la fenêtre de cette session. Un fichier `sources/model/SCONTO_SVU_FINAL_VALIDATED.original.alp`, non suivi par git et daté du 2026-09-01, est également présent. Ni l'un ni l'autre n'a été modifié, restauré, stagé ou commité par cette mission; ce constat est signalé pour la vigilance de l'utilisateur, probablement lié à une action externe (AnyLogic ouvert en parallèle) plutôt qu'à cette session.
