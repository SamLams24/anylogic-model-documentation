# Rapport de finalisation: annexes techniques et références bibliographiques

Date: 2026-09-04. Branche: documentation-latex-rewrite.

## 1. Annexes techniques finalisées

| Annexe | Fichier | Statut | Contenu principal |
| --- | --- | --- | --- |
| A | `appendices/a-structure-json.tex` | Réécrite intégralement | 14 blocs racine documentés (13 du fichier de référence + `responsabilites` produit par la sauvegarde), 44 propriétés JSON détaillées en tableau (acteurs, postes, scénarios, fiches matière, machines), sections prose pour responsabilités, profils de normalisation, mesure de performance, hiérarchie/affectations ISA-95, 4 extraits JSON réels, section chargement tolérant avec distinction explicite comportement actuel / recommandation de maintenance. |
| B | `appendices/b-fonctions.tex` | Réécrite intégralement | 48 lignes couvrant les fonctions structurantes par domaine (Initialisation, Commandes clientes, Stocks et réappro., Source, Make, Deliver, Return, Agents et AER, Blackboard, VSM, SCOR/PI, JSON, ISA-95, ABox, Exports, Interface utilisateur); plusieurs lignes regroupent une fonctionnalité répartie sur plusieurs fonctions coopérantes, portant le nombre de noms de fonctions individuellement cités au-delà de 70. |
| C | `appendices/c-agents.tex` | Réécrite intégralement | 8 entrées (5 niveaux de décision + Machine, BlackboardAgent, AERMessage), figure de hiérarchie reprise, section de distinction acteur / agent / poste / micro-activité / machine, exemple de trace de propagation du retard fournisseur avec phase AER par message. AER jamais développé comme acronyme dans cette annexe. |
| D | `appendices/d-metriques.tex` | Réécrite intégralement | 16 métriques cataloguées par attribut SCOR (RL, RS, AG, CO, AM), table des 6 mesures VSM transversales avec périmètre exact, table du Performance Index (5 attributs, poids, contributions, PI = 6,11881172), note explicite AHP local ≠ pipeline PI, statuts de preuve distingués (association SCOR du modèle / métrique interne / proxy explicite / mesure VSM), toutes les valeurs runtime qualifiées "exemple du run validé". |
| E | `appendices/e-interface.tex` | Auditée et étendue (non réécrite) | 75 contrôles recensés au total (71 avant cette tranche, 4 lignes ajoutées: rapports VSM/SCOR/N3/efficacité globale, KPI par micro-activité/goulots, décisions/traçabilité/journal, commande "Voir tout" de la vue Structure animée), toutes nommées explicitement en prose au chapitre 16 mais absentes de l'annexe avant l'audit. Colonnes existantes conservées à l'identique. Aucune capture d'écran insérée. |
| F | `appendices/f-glossaire.tex` | Réécrite intégralement | 42 termes en glossaire alphabétique, définitions de 1 à 3 phrases, renvois vers les chapitres et annexes concernés. |

## 2. Bibliographie

`documentation/references.tex` créé avec un mécanisme `thebibliography` simple (pas de BibLaTeX/Biber), inséré dans `documentation.tex` après le chapitre 20 et avant `\appendix`. 10 références reprises telles que fournies, sans recherche de nouvelles sources: APICS SCOR v12.0 (2017), ISA ANSI/ISA-95.00.01-2025 / IEC 62264-1 (2025), Rother & Shook (2003), Saaty (1990), Zadeh (1965), Chan & Qi (2003), Theeranuphattana & Tang (2008), Theeranuphattana, Tang & Khang (2012), Harris (1913/1990), Erlenkotter (1990).

Citations insérées avec parcimonie: chapitre 5 (EOQ, Harris/Erlenkotter), chapitre 6 (SCOR, APICS), chapitre 7 (AHP, Saaty), chapitre 8 (VSM, Rother & Shook), chapitre 9 (APICS, Chan & Qi, Theeranuphattana & Tang x2, Zadeh), chapitre 10 (ISA-95). Les chapitres 11 à 20 n'ont reçu aucune citation nouvelle, conformément à la consigne de ne pas sur-citer le guide utilisateur.

## 3. Nettoyage structurel

- Page de titre: mention "Squelette documentaire structuré" retirée, remplacée par "Cas d'étude : ZENER SA Togo"; aucune information institutionnelle (université, auteur, encadreur, jury) ajoutée à ce stade.
- `documentation/chapters/00-sigles.tex`: audité et complété avec les sigles réellement employés et absents (ABox, AG, AM, CO, EOQ, KPI, PCE, RL, ROP, RS, TBox), `\DocumentationNote` retiré.
- Balayage complet du document: 0 occurrence de `\DocumentationNote` dans les chapitres et annexes (seule la définition de la macro subsiste dans `preamble.tex`, conservée telle quelle).

## 4. Script de contrôle qualité

`documentation/scripts/quality_check_documentation.py` modifié: la vérification de l'absence de `\DocumentationNote` est désormais active en permanence (plus seulement en mode `--final`), afin de garantir qu'aucune note interne ne puisse être réintroduite silencieusement. Les vérifications de jargon UI restent limitées aux chapitres utilisateur (11 à 17) et ne s'appliquent pas aux annexes techniques, comme demandé. Les vérifications `--final` portant sur `\FigureOrPlaceholder`/`\TablePlaceholder` n'ont pas été activées par défaut: ce sont des macros de sécurité permanentes qui restent utilisées même lorsque la figure existe réellement (mécanisme `\IfFileExists`), leur simple présence dans le source ne signale donc pas un placeholder non résolu. L'absence de texte "Illustration planifiée" dans le PDF rendu a été vérifiée directement.

## 5. Compilation

Compilation XeLaTeX exécutée avec `-jobname=doc_build -output-directory=documentation` (contournement requis du bug de collision jobname/nom du répertoire de sortie), puis renommage déterministe de `doc_build.*` vers `documentation.*`. Quatre passes ont été nécessaires au total: deux passes standard, puis deux passes supplémentaires après correction des débordements de tableau (`\allowbreak` sur les identifiants longs dans les annexes A, B, D et E) afin de vérifier que la correction n'affectait pas la pagination des références croisées.

- Pages du PDF: 102 avant cette tranche, 127 après (116 pages numérotées dans le corps, plus front matter).
- Références non définies: 0.
- Avertissements LaTeX/Package restants dans le journal final: 0.
- Boîtes `Overfull \hbox`: 119 avant correction ciblée, 27 après (essentiellement des artefacts structurels mineurs de mise en page de tableaux en mode paysage, sous les 50pt, sans dépassement visible hors marge lors de la relecture visuelle).
- Boîtes `Underfull \hbox`: 5, préexistantes, non liées au contenu de cette tranche.

## 6. Revue visuelle

Pages inspectées via rendu PNG (`pdftoppm`): page de titre (p.1), table des matières (p.2), bibliographie (p.90-91), ouverture de chaque annexe A à F (p.93, 101, 107, 112, 118, 125), deux tableaux en mode paysage (p.102 annexe B, p.113 annexe D, p.118 et p.124 annexe E), une page de glossaire (p.125), fin de document (p.127). Aucune anomalie constatée: figures résolues, tableaux dans les marges, retours à la ligne corrects sur les identifiants techniques longs, numérotation cleveref cohérente en français.

## 7. Contrôle global

- Figures: toutes résolues (aucun texte "Illustration planifiée" dans le texte extrait du PDF).
- Placeholders: 0 (recherche textuelle sur le PDF rendu).
- Citations: toutes définies (0 undefined dans le journal de compilation).
- Références croisées (`\ref`/`\cref`): toutes résolues (0 undefined, aucun marqueur "??" dans le texte extrait).
- Fichiers inclus: tous présents (la compilation aurait échoué avec `-halt-on-error` sinon).

## 8. Fichiers protégés exclus

`sources/model/SCONTO_SVU_FINAL_VSM_FIX_CANDIDATE.alp`, `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp.autosave` et l'ensemble des fichiers PNG non suivis dans `sources/model/` n'ont pas été modifiés, ni ajoutés, ni committés au cours de cette tranche.

## 9. Points nécessitant une revue humaine

- Le champ "Bottom"/"Perfect" de plusieurs métriques (RS.1.1, RS.3.94, AG.1.1, PROXY.AG.SYSTEM_UTILIZATION, AM.3.9, AM.2.2) renvoie au profil `normalizationProfiles` plutôt qu'à une valeur numérique isolée: une personne disposant du fichier de référence complet devrait confirmer si une valeur numérique explicite serait préférable dans le tableau de l'annexe D.
- L'annexe E reste volontairement non réécrite; une revue ciblée sur la vue Logistique (panneaux KPI, `showActeursChaineTable`, `kpiLogisticsText`, `pceGlobalText`, mentionnés en prose au chapitre 16 mais non ajoutés ici par prudence de périmètre) pourrait être envisagée dans une tranche ultérieure si jugée utile.
- Les 27 boîtes `Overfull \hbox` restantes, essentiellement des artefacts d'alignement de tableaux longtable en mode paysage inférieurs à 50pt, n'ont pas d'impact visuel constaté lors de la revue mais pourraient être réduits davantage par un réglage plus fin des largeurs de colonnes si une relecture typographique complète est planifiée.
- Aucune information institutionnelle (université, auteur, formation, encadreur, jury) n'a été ajoutée à la page de titre, conformément à la consigne; cette information reste à valider avant toute diffusion finale.

## 10. Recommandation

La relecture éditoriale complète des vingt chapitres du corps du document (cohérence terminologique fine, relecture stylistique ligne à ligne) n'a pas été entreprise dans cette tranche et reste la mission suivante, comme demandé explicitement.
