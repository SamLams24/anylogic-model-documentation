# Étape 4 — Sources vérifiables et premier lot de figures scientifiques (F1, F2, F3)

Ce document complète `AUDIT_ONTOLOGIE_SCONTO_SVU_CH3.md`, `ETAPE2_VALIDATION_ARCHITECTURE_SCONTO_SVU_CH3.md` et `ETAPE3_CONSOLIDATION_MODULES_DIAGRAMMES.md`. Les figures elles-mêmes et leur registre détaillé se trouvent dans `LIVRABLE_SCONTO_SVU/figures/` (`sources/`, `svg/`, `png/`, `registre_figures.md`). Aucun artefact ontologique ni fichier du manuscrit n'a été modifié.

---

## 1. Corrections de formulation intégrées

### 1.1 « Incompatibilité » vs « absence d'alignement »

Correction appliquée dans `ETAPE3_CONSOLIDATION_MODULES_DIAGRAMMES.md` (section 6.3) : les occurrences affirmant que Forecast/MTS et ISA-95 sont « incompatibles » avec le Core 4.3.0 ont été reformulées. Le fait vérifié reste inchangé (imports pointant vers Core 4.1.0/Agent 1.0.0), mais la formulation précise désormais qu'aucun test de cohérence conjoint (chargement par raisonneur des deux lignes ensemble) n'a été réalisé, et qu'aucune incompatibilité logique n'est donc démontrée — seule une absence d'alignement et de revalidation est constatée. Cette distinction est reprise dans F1 et dans le registre de figures.

### 1.2 Restrictions existentielles, universelles et cardinalités

Vérification faite directement dans les cinq fichiers concernés (Core, Agent, AER, Forecast/MTS, ISA-95) :

| Fichier | `someValuesFrom` (existentielle) | `allValuesFrom` (universelle) | `owl:cardinality` / `min` / `max` / `qualifiedCardinality` | `owl:FunctionalProperty` |
|---|---|---|---|---|
| Core 4.3.0 | 0 | 0 | 0 | 0 |
| Agent 1.1.2 | 23 | 4 | 0 | 0 |
| AER 1.1.2 | 11 | 0 | 0 | 0 |
| Forecast/MTS (retenu) | 9 | 0 | 0 | 0 |
| ISA-95 | 10 | 0 | 0 | 0 |

**Aucune restriction de cardinalité numérique n'existe dans ces cinq ontologies.** Toutes les restrictions présentes sont soit existentielles (`owl:someValuesFrom` : « au moins une valeur de ce type »), soit universelles (`owl:allValuesFrom` : « s'il y a des valeurs, elles sont uniquement de ce type » — ce qui n'impose pas de minimum). Aucune des deux ne se traduit directement par une multiplicité UML (`0..1`, `1..*`, etc.). **Conséquence directe appliquée aux trois figures** : aucune multiplicité UML n'est indiquée sur F1, F2 ou F3. Lorsqu'une restriction existentielle ou universelle réelle est pertinente, elle est citée en toutes lettres dans le texte d'accompagnement (ex. registre de figures) plutôt que traduite en notation de cardinalité.

### 1.3 Correspondances modules ↔ couches : conceptuelles, pas assertées

Déjà corrigé dans `ETAPE3...md` (remplacement des égalités « bande = couche » par « correspondance conceptuelle documentée, non assertée dans l'OWL »). F2 reprend cette précaution : l'encart de vigilance sur `belongsToLayer` (jamais assertée) est affiché directement sur la figure, pas relégué à une note externe.

---

## 2. Inventaire des sources pour vérification indépendante

Chemins actuels (environnement local, hors dépôt Git), version déclarée dans chaque fichier, et empreinte SHA-256 calculée directement sur le fichier tel qu'actuellement présent sur disque.

| # | Fichier | Version | Chemin actuel (local) | SHA-256 |
|---|---|---|---|---|
| 1 | Core | 4.3.0 | `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCONTO_SVU_Core_v4.3.0.ttl` | `e1b7770899f6caddfaa03d63a1002e4227967285c53863c089af7c69ba105109`¹ |
| 2 | Agent Extension | 1.1.2 | `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCONTO_VSM_Agent_Extension_v1.1.2.ttl` | `0a8048d4e2b1a97ddeb1332b8a34a142ea2b86ee1a1deedb751e0ca76b39d2ea`¹ |
| 3 | AER Extension | 1.1.2 | `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCONTO_VSM_AER_Extension_v1.1.2.ttl` | `2dcffffaa2fdf84bad13b7d10cf9b584fa4a1215d0cc1e9f242be0c32e683831`¹ |
| 4 | SCOPRO (tierce) | s.v. (2014) | `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCOPRO.owl` | `8ca1fc1cfb23b18707d6ba725f29b0ad78f23a1581c0cebe2d976fceb5b667a3`¹ |
| 5 | SCOME (tierce) | s.v. (2014) | `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCOME.owl` | `c5396e9ee10e1950bb89d02ae24983b85b883c2768ca36bc2c035b3f1ea3c10e`¹ |
| 6 | SCOBE (tierce) | s.v. (2014) | `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\SCOBE.owl` | `767b24e6587927d7d41693fde1c422b68def545420b3c9f20a12889ae8122a99`¹ |
| 7 | Catalogue d'imports | — | `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\catalog-v001.xml` | `49660a8c856a959242ce9e29610e3a0a5dd37a1579488f13f4cfac6963dda80d`¹ |
| 8 | Rapport de validation raisonneur (C14) | — | `evolution_project\SCONTO_SVU_S2_2_C14_FINAL_ALIGNMENT_TEST_PACKAGE\C14_RAPPORT_ALIGNEMENT_FINAL.md` | `803af95deaf67bcfa10f26c322e9d2bb863576d2bdcd6f90444dd08d6937a14a`¹ |
| 9 | Rapport de validation raisonneur (C11) | — | `evolution_project\SCONTO_SVU_S2_2_C11_FINAL_REASONER_READY_PACKAGE\C11_RAPPORT_FINAL_COHERENCE_S2_2.md` | `7e0f32cf278b3795189de531566621e9ab02386f44116a092bd7ef096f20def9`¹ |
| 10 | Forecast/MTS (retenu) | 1.0.0 | `Downloads\sconto-vsm-forecast-mts-extension_1.ttl` | `53ae651140e0dbf83af2484ba2d2b3b2704f6a86f370c4c2e345a4c9c6627cca`¹ |
| 11 | ISA-95 | 1.0.0 | `Downloads\sconto-vsm-isa95-extension-v1.0.ttl` | `6e91063ce78288ece9aa1ca9c2a365e0247ad452109c8668ff1af15e8b86d8ca`¹ |
| 12 | Diagramme six bandes (base F2) | — | `Downloads\DocumentsToSend\sconto_svu_core_main_concepts.drawio` | `250fca016233313776a8d623224c971c2da2d112523d10aa22931ac43f6a3ce5`¹ |
| 13 | `01_CORE.drawio` | — | `work on documentation\ONTOLOGIES_DIAGRAMMES_SUPERVISION\DRAWIO\01_CORE.drawio` | `d0443aa867be8f0fc09599973ca1af2fd962632aca5720e5a6325ba3a7626eb3`¹ |
| 14 | `02_AGENT.drawio` | — | `...\DRAWIO\02_AGENT.drawio` | `48e080d7a53d2ec60b3320b059120a4b6522cd4f091d6ee76a33bfef921760f5`¹ |
| 15 | `03_AER.drawio` | — | `...\DRAWIO\03_AER.drawio` | `2f223a64bad16ea279b389bfeca07ddee982ce87038ae62706405ffd1658918e`¹ |
| 16 | `05_FORECAST_MTS.drawio` | — | `...\DRAWIO\05_FORECAST_MTS.drawio` | `3e16f7313c1b276a3b11205af7c74b22c74df01f52d05a737492afd07162ffe4`¹ |
| 17 | `06_ISA95.drawio` | — | `...\DRAWIO\06_ISA95.drawio` | `78583fbc78b96c619b0baca74d8ccdfcbfa9f4977e942e1219102290be3f7548`¹ |

¹ Hachages calculés avec `sha256sum` (GNU coreutils 8.32) directement sur les fichiers tels que présents sur disque au moment de cet audit ; 64 caractères hexadécimaux chacun. La version « s.v. » pour SCOPRO/SCOME/SCOBE signifie qu'aucun `owl:versionIRI` n'est porté par ces fichiers tiers (voir audit §1.1).

### 2.1 Disponibilité sur le dépôt GitHub

**Aucun des 17 fichiers ci-dessus n'est actuellement présent sur le dépôt** `anylogic-model-documentation` (vérifié : seuls les rapports Markdown des étapes 1 à 3 y ont été publiés). Le dépôt étant **public**, je n'ai publié aucun de ces fichiers automatiquement, conformément à votre consigne.

**Catégorisation pour décision** :
- **Fichiers #1-3, 10-11 (ontologies « maison », Core/Agent/AER/Forecast-MTS/ISA-95)** : travail de recherche original de la thèse. Publication publique à votre seule discrétion.
- **Fichiers #4-6 (SCOPRO/SCOME/SCOBE)** : ontologies tierces sous licence CC-BY 4.0 (Böhm, Henning, Leone, Vegetti, 2014) — leur republication est permise par la licence, sous réserve d'attribution, mais reste une décision éditoriale à confirmer.
- **Fichiers #7-9 (catalogue, rapports de raisonneur)** : artefacts techniques internes, probablement sans sensibilité particulière mais à votre jugement.
- **Fichiers #12-17 (diagrammes `.drawio`)** : déjà produits pour un usage de publication (dossier de supervision), les cinq derniers (#13-17) sont d'ores et déjà dans l'arborescence du dépôt local mais non suivis par Git (`ONTOLOGIES_DIAGRAMMES_SUPERVISION/` apparaît en `??` dans `git status`) ; leur publication est probablement la moins sensible du lot.

### 2.2 Proposition de solution de partage privée

Trois options, par ordre de simplicité de mise en œuvre :
1. **Dépôt GitHub privé dédié** (ex. `sconto-svu-sources-privees`), avec accès en lecture donné nommément aux personnes chargées de la vérification indépendante (encadrant, rapporteurs). Permet un contrôle de version propre et des liens directs comme pour les rapports déjà publiés.
2. **Passage du dépôt `anylogic-model-documentation` lui-même en privé**, le temps de la vérification, puis invitation nominative des vérificateurs. Plus simple si ce dépôt n'a pas vocation à rester public à ce stade, mais change la portée de tous les autres contenus déjà publiés dessus (hors périmètre de cette mission) — décision qui vous appartient.
3. **Partage hors Git** (archive chiffrée ou lien de partage à expiration, déposé sur un espace déjà utilisé pour l'encadrement, par exemple le même canal que `SendToMrsANAKPA`/`SendToMrANAKPA` déjà utilisé dans ce projet). Le plus rapide à mettre en place sans toucher à la configuration du dépôt, mais sans traçabilité de version.

**Aucune de ces trois options n'a été engagée** ; je reste dans l'attente de votre choix avant de publier quoi que ce soit au-delà des rapports Markdown déjà convenus.

---

## 3. Premier lot de figures

Trois figures produites, vérifiées visuellement (texte lisible, pas de chevauchement, flèches correctes) et corrigées une fois chacune après inspection (voir `registre_figures.md` pour le détail des corrections). Résumé :

| Figure | Fichier | Emplacement proposé | Statut |
|---|---|---|---|
| F1 | `LIVRABLE_SCONTO_SVU/figures/{svg,png}/F1_organisation_generale.*` | Chapitre 3, ouverture | Version éditable, prête pour revue |
| F2 | `LIVRABLE_SCONTO_SVU/figures/{svg,png}/F2_concepts_core.*` | Chapitre 3, architecture conceptuelle du Core | Version éditable, prête pour revue (une erreur de hiérarchie N1/N2/N3 corrigée avant livraison) |
| F3 | `LIVRABLE_SCONTO_SVU/figures/{svg,png}/F3_modules_I_J_pipeline_performance.*` | Chapitre 3, référentiel SCOR et pipeline de performance | Version éditable, prête pour revue ; contient un point de vigilance non résolu (axiome `SCORPerformanceEvaluation`/`Benchmarking_project`, détaillé en figure et dans le registre) |

Détail complet (classes retenues, relations représentées, omissions volontaires, limites, vérifications syntaxique/graphique/raisonneur séparées) : `LIVRABLE_SCONTO_SVU/figures/registre_figures.md`.

---

## 4. Livraison Git

*(section complétée après publication — voir message de retour pour le SHA du commit et les liens directs)*
