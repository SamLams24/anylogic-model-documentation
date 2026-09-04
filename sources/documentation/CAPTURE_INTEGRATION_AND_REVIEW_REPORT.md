# Rapport d'intégration des captures et de révision conceptuelle

## Découverte des captures

L'utilisateur avait initialement copié les schémas générés de `documentation/figures/` dans `documentation/figures/screenshots/` par erreur; ces 30 fichiers étaient des doublons identiques, sans rapport avec des captures d'interface, et ont été supprimés après vérification octet par octet contre leurs originaux. Les 16 véritables captures d'interface se trouvaient dans `sources/documentation/figures/`, nommées conformément à la checklist. Aucun fichier n'a été supprimé sans vérification préalable de sa provenance.

## Captures intégrées

Seize captures ont été inspectées visuellement, confirmées conformes au modèle validé, exemptes de donnée personnelle ou de chemin local sensible, puis déplacées vers `documentation/figures/screenshots/` sous leur nom canonique:

`ui_navigation.png`, `ui_configuration.png`, `ui_poids_attributs.png`, `ui_poids_n3.png`, `ui_logistique.png`, `ui_nomenclature.png`, `ui_fiche_matiere.png`, `ui_json_zone.png`, `ui_json_liste.png`, `ui_retours_qualite.png`, `ui_animation_parametres.png`, `ui_stocks_initiaux.png`, `ui_profils_test.png`, `ui_suivi_temps_reel.png`.

`ui_nomenclature.png` a reçu un recadrage léger (largeur 1920 vers 830 px) pour retirer une large zone blanche à droite du formulaire et aligner sa largeur sur celle de son zoom annoté; aucun élément de contenu utile n'a été retiré.

Les deux zooms annotés `ui_configuration_annotee.png` et `ui_nomenclature_annotee.png` fournis par l'utilisateur se sont révélés être des recadrages presque identiques des captures de base, sans repère numéroté ni annotation réelle (confirmé par comparaison de dimensions: 904 contre 897 px de hauteur pour la paire Configuration, une différence qui exclut une simple duplication mais ne correspond à aucune annotation visible). Ils ont donc été régénérés proprement à partir de `ui_configuration.png` et `ui_nomenclature.png`: trois repères numérotés pour la Configuration (identité du poste, gestion de la séquence, scénario), quatre repères numérotés pour la Nomenclature (les quatre zones exactement décrites au chapitre 13). Aucun bouton ni contrôle inexistant n'a été ajouté; seuls des cadres et des numéros ont été superposés sur les captures réelles.

## Captures rejetées

Aucune capture n'a été rejetée pour non-conformité. Les deux zooms annotés ont été régénérés plutôt que rejetés, comme prévu par les instructions de cette mission lorsqu'un zoom fourni ne contient pas d'annotation exploitable.

## Captures encore manquantes

Cinq captures de la checklist restent absentes et conservent leur placeholder `FigureOrPlaceholder`:

| ID | Fichier | Chapitre |
|---|---|---|
| DOC-B06 | `ui_responsabilites_machines.png` | 12 |
| DOC-B24 | `ui_json_charge.png` | 14 |
| DOC-B08 | `ui_controle_commandes.png` | 15 |
| DOC-B09 | `ui_temps_budgets.png` | 15 |
| DOC-B14 | `ui_perturbations.png` | 15 |

## Déplacements réalisés

Les 16 fichiers validés ont été copiés de `sources/documentation/figures/` vers `documentation/figures/screenshots/`, avec vérification `cmp` octet par octet pour les 14 captures non modifiées. Le dossier `sources/documentation/figures/` a ensuite été supprimé: il ne contenait plus, après ce déplacement, aucun fichier utilisateur utile, uniquement les copies déjà transférées et un sous-dossier `screenshots` vide et daté du 3 septembre. Les 30 doublons de schémas générés accidentellement placés dans `documentation/figures/screenshots/` ont également été supprimés après confirmation qu'ils dupliquaient exactement les fichiers déjà suivis dans `documentation/figures/`.

Les légendes `FigureOrPlaceholder` des 16 captures désormais réelles ont été reformulées: la mention « Emplacement prévu pour une capture réelle de… », devenue inexacte, a été remplacée par une description directe de ce que montre l'image. Les cinq légendes correspondant aux captures encore manquantes conservent leur formulation de placeholder.

## Corrections conceptuelles

**EOQ.** Au chapitre 6, « quantité économique de Wilson » est remplacée par « quantité économique de commande selon le modèle EOQ classique ». Aucune formule du modèle n'a été modifiée.

**AM.3.18.** Au chapitre 9, la phrase présentant la valeur d'actif fixe `AM.3.18` comme cohérente avec les coûts en FCFA est retirée du corps. Le paragraphe Asset Management ne mobilise plus que `AM.3.9` et `AM.2.2`, avec une phrase renvoyant les autres paramètres économiques informatifs à l'annexe.

**AHP local et PI.** La section 9.5 est renommée « AHP local et pipeline du PI: deux mécanismes distincts ». La figure, renommée `ahp_vs_pi.png` (l'ancien fichier `deux_usages_ahp.png` est supprimé), montre désormais deux chaînes verticalement disjointes, AHP LOCAL et PI, séparées par un repère explicite « Aucun lien de calcul démontré », sans connexion entre elles. Un tableau comparatif à quatre lignes (entrée, mécanisme, sortie, portée) remplace l'ambiguïté de l'ancienne formulation « deux usages de l'AHP ». `DOCUMENTATION_ILLUSTRATION_PLAN.md` reflète le nouveau nom de fichier.

**CO.1.1.** Le paragraphe introductif du chapitre 9 ne présente plus `CO.1.1` comme l'exemple affirmatif d'une métrique SCOR officielle. Il est reformulé pour dire que le modèle utilise des identifiants associés à SCOR, des métriques internes et des proxys explicites, et que le code seul ne suffit pas à établir la conformité officielle; `CO.1.1` illustre désormais une association du modèle, pas une métrique officielle certifiée. L'interprétation de `CO.1.1` comme rapport coût total simulé sur chiffre d'affaires estimé, distincte d'un taux de livraison, est conservée sans changement.

**SCOR version 12.0 / APICS 2017.** Conservé sans modification, conformément à l'instruction de cette mission. Le statut `REDIGE_A_REVOIR` du chapitre 9 dans `DOCUMENTATION_WRITING_READINESS.md`, qui portait sur ce point ainsi que sur l'attribution bibliographique, est levé; les autres corrections de cette tranche (AHP/PI, AM.3.18, CO.1.1) sont mentionnées comme résolues dans la justification.

**Bibliographie.** Aucune référence existante (Chan et Qi, Theeranuphattana et Tang, Zadeh, Saaty) n'a été modifiée. Aucune infrastructure bibliographique nouvelle n'a été introduite.

## État de rédaction des chapitres 11 à 15

Avec toutes leurs captures désormais intégrées, les chapitres 11 et 13 passent au statut `REDIGE` dans `DOCUMENTATION_WRITING_READINESS.md`. Les chapitres 12, 14 et 15 restent `REDIGE_AVEC_CAPTURES_A_FAIRE`, chacun avec la liste précise de la ou des captures qui leur manquent encore.

## Pagination et compilation

Le PDF comptait 88 pages physiques avant cette mission. Il en compte 90 après intégration des 16 captures réelles, recadrage de `ui_nomenclature.png` et régénération des deux zooms annotés.

La compilation a été réalisée avec le contournement de jobname requis par cette mission:

```
xelatex -interaction=nonstopmode -halt-on-error -jobname=doc_build -output-directory=documentation documentation/documentation.tex
xelatex -interaction=nonstopmode -halt-on-error -jobname=doc_build -output-directory=documentation documentation/documentation.tex
```

suivie du renommage déterministe de `documentation/doc_build.pdf` vers `documentation/documentation.pdf` et des fichiers auxiliaires correspondants. Les deux passes se terminent sans avertissement, sans référence indéfinie et sans débordement (`overfull hbox`). Le contrôle `python documentation/scripts/quality_check_documentation.py` réussit sur 29 fichiers LaTeX, avec zéro caractère U+2014, zéro tiret long, zéro métadiscours interdit et zéro jargon UI mal placé.

Le décompte des placeholders `FigureOrPlaceholder` restants dans le PDF compilé donne exactement cinq occurrences, correspondant terme à terme aux cinq captures encore manquantes listées ci-dessus; aucun placeholder inattendu n'a été détecté.

## Revue visuelle

Ont été inspectées après compilation: une page de chaque chapitre 11 à 15 avec ses nouvelles captures, les deux zooms annotés régénérés (Configuration et Nomenclature), la section 9.5 corrigée avec sa nouvelle figure `ahp_vs_pi.png` et son tableau comparatif, le chapitre 6 avec la formulation EOQ corrigée, et une page de l'annexe E en paysage. Aucune capture coupée, mal orientée ou illisible n'a été observée. La légende de `Figure 15.6` (Perturbations, encore manquante) a été vérifiée pour confirmer qu'elle conserve correctement sa formulation de placeholder.

Un point mineur non bloquant a été relevé: la capture `ui_retours_qualite.png` laisse voir, en arrière-plan derrière la boîte de dialogue, un fragment de fenêtre affichant un chemin `C:\Program Files\...`; ce chemin est générique (aucun nom d'utilisateur ni dossier personnel) et n'a pas été jugé sensible, mais un recadrage plus serré resterait possible si l'utilisateur le souhaite. La capture `ui_poids_n3.png` ne montre que la commande `Rafraîchir liste` parmi les quatre commandes de gestion décrites dans le texte du chapitre 12; le texte reste exact, mais l'image ne les illustre pas toutes.

## Points nécessitant relecture humaine

Les cinq captures manquantes nécessitent une campagne complémentaire: `ui_responsabilites_machines.png`, `ui_json_charge.png`, `ui_controle_commandes.png`, `ui_temps_budgets.png` et `ui_perturbations.png`. Le point mineur sur `ui_retours_qualite.png` et l'illustration partielle de `ui_poids_n3.png` méritent un arbitrage humain sur l'opportunité d'un recadrage supplémentaire.
