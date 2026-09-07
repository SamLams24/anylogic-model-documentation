# Réaudit final complet — Documentation SCONTO-SVU

Mission en lecture seule. Aucun fichier LaTeX, figure, source ou modèle n'a été modifié pendant cette
mission. Seul ce rapport a été créé. Base auditée : commit `05a8d1c03036d2ec92c1301fc3c7eb8d70db3648`
("Enrich PI methodology and global agent communication model"), branche `documentation-latex-rewrite`.
Compilation de contrôle produite sous le jobname distinct `final_reaudit` (4 passes XeLaTeX), sans toucher
à `documentation.pdf`/`.aux`/etc. Document final : 148 pages physiques (numérotation arabe interne
1 à 136 après 12 pages de pages liminaires en tête, valeur stable entre la 3e et la 4e passe).

Hiérarchie des sources utilisée, dans l'ordre : `sources/model/SCONTO_SVU_FINAL_VALIDATED.alp`,
`sources/runs/vsm_validation/results_final.xlsx` (non requis pour les points ci-dessous),
`sources/runs/vsm_validation/abox_final.ttl`, `sources/runs/vsm_validation/RUN_VERIFICATION.md`,
`sources/documents/communications_inter_agents_flux_global.docx` (document de travail source de
l'annexe G). Le rapport interne `SCIENTIFIC_AND_AGENT_ENRICHMENT_REPORT.md` n'a été utilisé qu'à titre
de point de départ, jamais comme preuve ; chaque chiffre qu'il avançait a été recalculé indépendamment
depuis les sources ci-dessus.

## Résumé exécutif

Le document est mathématiquement et référentiellement solide sur les points qui comptent le plus :
le pipeline PI, l'exemple AG et le vecteur flou global ont été recalculés indépendamment à la main et
correspondent exactement (à un artefact d'arrondi de 1×10⁻⁸ près sur un score intermédiaire non publié)
aux valeurs de `abox_final.ttl`. Le désaccord arithmétique sur le comptage des messages de l'annexe G
(71 candidats vs. 62+6+6=74) est résolu ici avec une méthode explicite et un delta nommé : le chiffre de
71 candidats de mon rapport intermédiaire était lui-même faux (73 candidats réels dans le document
source), et un message (`SupplierDelayAlert`) provient de l'ABox sans exister dans le document source.
Deux défauts visuels réels ont été confirmés par inspection directe des pages compilées (un dépassement
de colonne dans le tableau E.1, une paire d'équations à la limite de la marge en annexe H) ; le reste des
30 avertissements Overfull du compilateur a été vérifié un par un et n'a aucun impact visuel. Une
ambiguïté de formulation réelle et récurrente (deux occurrences) concernant `AOe-sD1.8` a été confirmée
et localisée précisément. Aucune ancienne valeur numérique (8,248 / 361,921 / 179 éléments / etc.) n'a
été retrouvée dans le texte source. `quality_check_documentation.py` réussit dans les deux modes, 0
occurrence de U+2014, 0 occurrence du mot anglais « appendix ».

**Verdict global : CORRECTIONS_MINEURES_REQUISES.**

Aucun point ne remet en cause la validité scientifique ou la cohérence globale du document ; les points
relevés sont des corrections de formulation, de mise en page et de rigueur de rapport interne, pas des
erreurs de fond dans le modèle ou dans les résultats publiés.

## Liste des corrections nécessaires, par sévérité

### BLOCKER
Aucun.

### MAJOR

1. **Ambiguïté de formulation sur `AOe-sD1.8`, deux occurrences.**
   `documentation/chapters/07-agents-aer.tex:30` : « tandis que `AOe-sD1.8` Inventory, ainsi que Picking,
   Packing, Loading et Transport, restent des agents d'exécution distincts plutôt qu'absorbés par ce
   superviseur. » et `documentation/appendices/c-agents.tex:140` (légende sous l'arbre des agents) :
   « `AOe-sD1.8` Inventory, Picking, Packing, Loading et Transport restent des agents d'exécution
   distincts plutôt qu'absorbés par le superviseur. » Les deux phrases apposent les noms des cinq
   fonctions (Inventory, Picking, Packing, Loading, Transport) directement après le seul identifiant
   `AOe-sD1.8`, sans jamais nommer `AOe-sD1.9` à `AOe-sD1.12`. Une lecture rapide peut comprendre que
   `AOe-sD1.8` porte à lui seul les cinq fonctions. Le Tableau 2 de l'annexe C (lignes 126 à 130) est
   correct et sans ambiguïté (cinq lignes séparées, un identifiant par fonction) ; seules ces deux phrases
   de synthèse sont ambiguës. Comparaison utile : le document source
   (`communications_inter_agents_flux_global.docx`, § « Règle Deliver ») écrit sans ambiguïté « Les
   activités sDx.8, sDx.9, sDx.10, sDx.11 et sDx.12 restent portées par des agents opérationnels
   d'exécution distincts. » — c'est cette formulation à identifiants explicites qui devrait servir de
   modèle pour une future correction (non appliquée ici).

2. **Identifiant logique `ASup-sD1` jamais observé littéralement dans l'ABox ; seule sa décomposition en
   `AOp-sD1.x` l'est.** Vérification directe dans `abox_final.ttl` : la chaîne `"ASup-sD1"` a 0 occurrence
   comme `senderId`/`receiverId` (et 0 occurrence tout court dans l'ABox) ; elle apparaît 4 fois dans
   l'ALP (logique de canonicalisation de noms). Les identifiants réellement observés comme émetteur ou
   destinataire d'un message AER sont `AOp-sD1.1`, `AOp-sD1.3` et `AOp-sD1.7` (confirmé), et `AOp-sD1.4`,
   `AOp-sD1.5`, `AOp-sD1.6` existent bien comme agents instanciés dans l'ABox (`run:sourceAgentId`) mais
   sans y apparaître comme émetteur/destinataire d'aucun message de ce run. Le tableau 2 de l'annexe C
   (ligne `ASup-sD1`) cite déjà correctement « trace du run : `AOp-sD1.1`, `AOp-sD1.3`, `AOp-sD1.7` » — ce
   sous-ensemble est donc exact pour la définition « émetteur ou destinataire d'un message AER » ; mais
   ni cette ligne ni le texte narratif du chapitre 7 n'explicitent que `ASup-sD1` est un identifiant
   logique de synthèse qui n'existe littéralement dans aucune trace runtime, ce qui correspond exactement
   à l'ambiguïté « identifiant logique vs agent runtime » signalée pour audit.

3. **Overfull visible et réel : `documentation/appendices/e-interface.tex:90`, colonne « Effet » du
   tableau E.1 (Table E.1, ligne Configuration / ZENER CAS 1-3).** Le texte
   `ouvrirProfilsTest`/`btnProfilsTest` (78,71 pt de dépassement, le plus grand de tout le document)
   déborde visiblement de la colonne « Effet » et chevauche la règle verticale qui la sépare de la
   colonne « Précaution », vérifié par inspection directe de la page 132 (`Page 120 sur 136`) du PDF
   compilé. C'est le seul dépassement de tableau réellement visible sur les 30 avertissements Overfull du
   compilateur.

### MINOR

4. **Comptage des captures dans le rapport interne, incohérence propre : « quatre captures » puis
   énumération de trois noms seulement.** `sources/documentation/SCIENTIFIC_AND_AGENT_ENRICHMENT_REPORT.md:101` :
   « Les quatre captures signalées `RESTE_OUVERT`... (`ui_nomenclature.png`, `ui_retours_qualite.png`,
   `ui_responsabilites_machines.png`) » — la phrase annonce quatre captures mais n'en énumère que trois,
   omettant `ui_nomenclature_annotee.png`. Ce défaut n'affecte que le rapport interne (fichier de travail,
   jamais publié dans le document LaTeX) ; le nombre réel de captures concernées par ce point est bien
   quatre (`ui_nomenclature.png`, `ui_nomenclature_annotee.png`, `ui_retours_qualite.png`,
   `ui_responsabilites_machines.png`), toutes existantes sur disque et référencées dans le document.

5. **`documentation/appendices/h-formalisme-pi.tex`, équations H.9 et H.10 (page 136 sur 136, dernière
   page du document) : dépassement de 16,3 pt et 38,8 pt respectivement.** Ce sont les deux équations les
   plus importantes de l'exemple numérique (vecteur `G_AG` et score `Score_AG = 4,73462025`). Elles ne
   sont pas enveloppées dans `{\small ...}`, contrairement aux équations H.11/H.12 (vecteur et score du
   PI global) situées juste en dessous sur la même page, qui elles n'ont déclenché aucun avertissement.
   À l'inspection visuelle de la page compilée, le texte ne semble pas franchir nettement la marge
   physique de la page à la résolution consultée, mais l'ampleur de l'avertissement (38,8 pt, soit environ
   0,54 pouce) est trop importante pour être classée avec confiance INVISIBLE_ACCEPTABLE ; elle est donc
   classée par prudence à corriger, avec la même solution déjà appliquée à H.11/H.12 (envelopper dans
   `{\footnotesize}` ou `{\small}`, ou scinder l'équation sur deux lignes) recommandée pour une future
   passe corrective.

6. **Lettre de famille « H. » absente de la numérotation de l'annexe G.**
   `documentation/appendices/g-messages-flux-global.tex`, le tableau principal (`tab:messages-annexe`)
   enchaîne les familles A, B, C, D, E, F, G (« Exécution Deliver »), puis saute directement à I
   (« Retards, pannes et exceptions ») sans jamais utiliser la lettre H. Compte exact vérifié ligne par
   ligne : A=2, B=4, C=10, D=8, E=8, F=5, G=19, I=3, J=3, soit 62 lignes au total (le nombre annoncé dans
   le texte introductif est exact), mais la suite alphabétique des familles présente un trou cosmétique.

### TYPOGRAPHIE

7. **Confirmé tel que signalé par la mission : `documentation/chapters/09-scor-pi.tex:32` contient la
   phrase « Cette annexe ne développe pas un cours complet de logique floue : elle retient uniquement le
   mécanisme utilisé par SCONTO-SVU... » alors que ce texte se trouve dans le **chapitre** 9, pas dans une
   annexe.** Non corrigé pendant cette mission, conformément à l'instruction. Correction suggérée pour une
   future passe : remplacer « Cette annexe » par « Ce chapitre ».

### OPTIONNEL

8. **`ui_retours_qualite.png` et `ui_nomenclature.png` : chrome d'environnement (IDE/navigateur) visible
   en périphérie de la capture.** `ui_nomenclature.png` montre des éléments de bord tronqués à gauche et à
   droite (favoris de navigateur, boutons d'un panneau voisin coupés). `ui_retours_qualite.png` montre
   du texte de fond d'un IDE/console derrière la boîte de dialogue (dialogue lui-même parfaitement
   lisible). Classées A_REMPLACER_AVANT_REMISE ci-dessous (section captures) plutôt qu'un simple confort,
   car elles nuisent à l'aspect professionnel de la documentation finale, mais aucune information n'est
   perdue ou fausse.

9. **`ui_nomenclature_annotee.png` : les encadrés rouges d'annotation 3 et 4 chevauchent le haut du texte
   des sous-titres qu'ils sont censés mettre en évidence** (« 3. Mode d'approvisionnement du fournisseur »
   et « 4. Poste consommateur de matière » sont partiellement coupés par le bord supérieur de leur propre
   cadre rouge).

10. **`ui_responsabilites_machines.png` montre l'écran à l'état vide** (« aucune micro-activité
    configurée », « Responsabilités configurées : 0 », « Machines configurées : 0 ») plutôt qu'un exemple
    peuplé, ce qui réduit sa valeur pédagogique sans être un défaut technique.

11. **Étiquettes de sommet dans `grades_flous_a_f.png` (lettres A à F aux pics des triangles) peu
    lisibles à taille normale**, car rendues petites et dans la couleur de la courbe. La structure du
    graphique elle-même (six triangles se chevauchant, pics exacts à 0, 2, 4, 6, 8, 10) est correcte et
    conforme à la théorie décrite au chapitre 9.

## Audit PI (recalcul mathématique indépendant)

Recalcul effectué à la main (Python, valeurs décimales complètes), sans réutiliser les résultats du
rapport intermédiaire, directement à partir des tables publiées en annexe H et croisées avec les
triplets bruts de `abox_final.ttl`.

- **Score AG.1.1** (bénéfice, Bottom=0, Perfect=1, x=0,5) : `10×(0,5-0)/(1-0) = 5,00000000`. Conforme.
  Vecteur flou `[0;0;0,5;0,5;0;0]` (μ_C=(5-4)/(6-4)=0,5 ; μ_D=(6-5)/(6-4)=0,5). Conforme.
- **Score AG.3.32** (bénéfice, Bottom=0, Perfect=160, x=1,53649168) : `10×1,53649168/160 = 0,09603073`.
  Conforme. Vecteur `[0;0;0;0;0,04801536;0,95198464]`. Conforme.
- **Score PROXY.AG.SYSTEM_UTILIZATION** (coût, Bottom=1,5, Perfect=0, x=0,1338255) :
  `10×(1,5-0,1338255)/1,5 = 9,10783003`. Conforme. Vecteur `[0,55391502;0,44608498;0;0;0;0]`. Conforme.
- **Agrégation `G_AG`** (poids 1/3 chacun) recalculée terme à terme : `[0,18463834; 0,14869499;
  0,16666667; 0,16666667; 0,01600512; 0,31732821]`, somme des degrés = 1,00000000 exact. Conforme au
  vecteur publié.
- **Défuzzification `Score_AG`** : `10(0,18463834)+8(0,14869499)+6(0,16666667)+4(0,16666667)+
  2(0,01600512) = 4,73462026` (mon recalcul) contre `4,73462025` publié — écart de 1×10⁻⁸, un artefact
  d'arrondi sur la troncature à 8 décimales des composantes du vecteur intermédiaire, sans conséquence.
  **AG = 4,73462025 : confirmé.**
- **Agrégation globale `G_PI`** (poids RL=0,40, RS=0,20, AG=0,10, CO=0,15, AM=0,15) recalculée à partir
  des cinq vecteurs d'attribut publiés en Table H.2 : `[0,56113868; 0,04219465; 0,01666667; 0,01666667;
  0,00160051; 0,36173282]`, somme = 1,00000000 exact. **Identique triplet pour triplet à
  `run:fuzzy_PI_RUN_1773129600000_1788264883846` dans `abox_final.ttl` (lignes 13357-13362), vérifié
  directement dans le fichier Turtle, pas recopié du rapport intermédiaire.**
- **Défuzzification finale** : `10(0,56113868)+8(0,04219465)+6(0,01666667)+4(0,01666667)+
  2(0,00160051) = 6,11881172`. **PI = 6,11881172 : confirmé exactement, à la 8e décimale.**
- **Vecteur fuzzy global re-vérifié directement dans l'ABox : OUI.**
- **Exemple AG re-vérifié directement dans l'ABox (valeurs brutes AG.1.1, AG.3.32,
  PROXY.AG.SYSTEM_UTILIZATION toutes retrouvées littéralement dans `abox_final.ttl`, lignes 13818-13942) :
  OUI.**

Les formules de bornage 0-10, la fuzzification par interpolation entre deux grades voisins, la somme des
degrés égale à 1, l'agrégation pondérée locale puis globale, et la défuzzification par barycentre des
centres 10/8/6/4/2/0 sont conformes à la théorie des ensembles flous standard (Zadeh) telle que
restreinte par le document, et cohérentes de bout en bout entre le chapitre 9 (narratif), l'annexe D
(valeurs par attribut) et l'annexe H (équations et exemple).

## Audit fuzzy (théorie)

Le chapitre 9 distingue correctement ensemble classique (fonction caractéristique binaire) et ensemble
flou (`μ(x) ∈ [0,1]`), introduit les six grades A-F comme fonctions d'appartenance triangulaires
(confirmé visuellement dans `grades_flous_a_f.png`, six triangles centrés exactement sur 10, 8, 6, 4, 2,
0), et ne revendique nulle part l'implémentation d'une arithmétique floue complète (pas d'opérateurs
T-norme/T-conorme généraux, pas de nombres flous non triangulaires, pas de défuzzification par centre de
gravité continu). Le vocabulaire « degrés d'appartenance » et « vecteurs flous » est employé de façon
cohérente dans les chapitres 7, 9 et les annexes D, G, H. L'`\AttentionDoc{}` de
`h-formalisme-pi.tex:71` explicite correctement que l'écriture linéaire `PI = 0,40 RL + ...` est une
conséquence de la linéarité de la défuzzification employée ici, et non un raccourci que le modèle prend
réellement — formulation jugée sans ambiguïté, aucune correction nécessaire sur ce point.

## Audit Theeranuphattana / Chan-Qi

`theeranuphattana_sconto.png` présente deux colonnes visuellement distinctes (méthode de référence à
gauche : Valeurs de performance → Normalisation → Grades flous → Agrégation multicritère → Indice
composite ; adaptation SCONTO-SVU à droite : Événements AnyLogic → Observations VSM → Valeur physique
SCOR ou interne → Bottom/Perfect, score sur 10 → Grades flous, agrégation par attribut → Performance
Index) reliées par des flèches pointillées libellées « correspond à », sans jamais fusionner les deux
chaînes ni prétendre que SCONTO-SVU reproduit exactement la méthode de référence. Le texte du chapitre 9
(section « Mise en oeuvre adaptée de Theeranuphattana et Tang ») emploie le terme « adaptée » de façon
cohérente avec la figure. Aucune incohérence avec la bibliographie relevée.

## Audit agents

**Comptage structurel (Table 2, annexe C) : 26 lignes**, vérifié par comptage direct des lignes du
`longtable` `tab:agents-reels-annexe` (lignes 108 à 133 du fichier source), méthode de comptage
explicite : une ligne de tableau = une unité, y compris lorsque plusieurs identifiants runtime sont
regroupés dans une même ligne (`AOe-sM1.3` à `AOe-sM1.7`, comptés comme une seule unité structurelle).

**Comptage des agents observés dans le run, recalculé indépendamment depuis `senderId`/`receiverId` de
tous les messages AER de `abox_final.ttl` (et non recopié du rapport intermédiaire) :**

- 25 chaînes distinctes trouvées comme `senderId` ou `receiverId`, dont une anomalie de donnée :
  `"CUSTOMER:AOp-sS1.1"` (message `aerMessage_N_1`, sujet `CustomerOrder`), une chaîne composite qui
  n'est ni `CustomerActor` ni un identifiant d'agent propre — probablement un artefact de journalisation
  du moteur de simulation à l'origine de la commande cliente. `"CustomerActor"` proprement dit n'apparaît
  qu'une seule fois comme `receiverId` (jamais comme `senderId`) dans tout l'ABox de ce run. Ce n'est pas
  une erreur de documentation (rien dans le texte publié n'affirme le contraire), mais une nuance de
  provenance des données qu'il serait utile de connaître pour d'éventuelles analyses futures du run.
- En excluant ce doublon d'anomalie, **24 identifiants d'agents distincts** ont réellement échangé au
  moins un message AER dans ce run (méthode : ensemble des valeurs `senderId` ∪ `receiverId`).
- **Avec définition explicite « agents du modèle, acteurs externes exclus » (CustomerActor et
  SupplierActor retirés du compte) : 24 − 2 = 22 agents observés.** C'est très probablement l'origine du
  chiffre « 22 » du rapport intermédiaire, mais cette définition n'y était jamais rendue explicite — ce
  qui est exactement le défaut de méthode signalé par la mission. Avec les acteurs externes inclus, le
  compte exact est 24.
- `MachineAgent` n'apparaît dans aucun message AER comme émetteur ou destinataire de ce run (statut
  IMPLEMENTE, cohérent avec le Tableau 2). `AOe-sS1.4` (Transfer/Storage) et `AOe-sM1.4` à `.7` : absents
  également, cohérent avec leurs statuts IMPLEMENTE respectifs déjà publiés dans le Tableau 2. `AT-sP5`
  et `CA-sR` (Return) : absents, cohérent avec le statut IMPLEMENTE de Return.

**Aucune de ces deux valeurs (26 structurels, 22 observés en excluant les acteurs externes) n'apparaît
telle quelle dans le document LaTeX publié** (recherche exhaustive sans résultat) — la discrepance
constatée touchait uniquement le rapport de travail interne, jamais le PDF livré.

**Audit ASup-sD1 vs AOp-sD1.1/1.3/1.7 : voir MAJOR #2 ci-dessus.**

**Audit AOe-sM1.2 vs AOe-sM1.3-7 : conforme, aucune ambiguïté.** Le Tableau 2 (lignes 123-124) et le
document source (`communications_inter_agents_flux_global.docx`, note liminaire) emploient la même
formulation : `AOe-sM1.2` porte spécifiquement la vérification de disponibilité matière, tandis que
`AOe-sM1.2` à `AOe-sM1.7` et les `MachineAgent` concernés portent collectivement les contrôles de
capacité — cohérence vérifiée mot pour mot entre le document source, `c-agents.tex` et le `\BonASavoir{}`
de `c-agents.tex:142`.

## Audit messages (Annexe G) — résolution complète de l'écart arithmétique

Reconstruction indépendante et exhaustive de la liste candidate directement depuis
`sources/documents/communications_inter_agents_flux_global.docx` (extraction XML brute, sans recopier ni
faire confiance au rapport intermédiaire) :

- **N_source_document = 73** (et non 71 comme l'affirmait le rapport intermédiaire — ce chiffre de 71
  était lui-même erroné ; c'est la première source du désaccord). Liste unique de 73 identifiants de
  message CamelCase distincts, extraits des tableaux de scénarios 1 à 3 (S1.x, S2.x, S3.x) et du tronc
  commun (Cx) du document source, cellules combinées comme `ExecutionEnd / DeliveryCompleted` scindées
  en entrées séparées.
- **N_ajoutes_depuis_ALP_ou_run = 1** : `SupplierDelayAlert`. Recherche exhaustive confirmée : 0
  occurrence de « SupplierDelayAlert » ou « Supplier...Delay...Alert » dans le document source, alors
  qu'il existe exactement 1 fois dans l'ALP et exactement 1 fois dans `abox_final.ttl`
  (`aer:hasMessageSubject "SupplierDelayAlert"`). C'est donc le message ajouté depuis le run/l'ALP sans
  provenir de la liste candidate du document source, explicitement identifié comme demandé.
- **N_total_unique_examine = 74** = 62 (`OBSERVE_RUN_FINAL`) + 6 (`IMPLEMENTE_NON_OBSERVE`) + 6
  (`SOURCE_HISTORIQUE_NON_CONFIRMEE`), vérifié en recomptant ligne par ligne les trois tableaux de
  `g-messages-flux-global.tex`.
- **N_observe_run = 62** (recompté ligne par ligne par famille : A=2, B=4, C=10, D=8, E=8, F=5, G=19,
  I=3, J=3 = 62 exact).
- **N_implemente_non_observe = 6** (`MakeOperationalFeasibility`, `ExecutionEnd`, `ProductionCompleted`,
  `ProductAvailableForDelivery`, `DeliveryTaskAssignment`, `PriorityDecision`).
- **N_historique_non_confirme = 6** (`ExecutionDelay`, `ExecutionFailure`, `EscalationRequest`,
  `PolicyDecision`, `DeliveryDateUpdate`, `ProposedDeliveryDate`) — les six sont confirmées présentes
  dans le document source de travail (donc l'étiquette `SOURCE_HISTORIQUE_NON_CONFIRMEE` est correcte :
  elles proviennent bien de la source, sans confirmation dans l'ALP actuel).
- **Réconciliation exacte : les 73 candidats du document source = (62 observés + 6 implémentés non
  observés + 6 historiques non confirmés) − 1 (`SupplierDelayAlert`, absent du document source) = 74 − 1
  = 73.** Aucune ambiguïté résiduelle : l'union des 73 candidats et de `SupplierDelayAlert` couvre
  exactement, sans reste ni manque, les 74 messages publiés.
- **Comptage messages cohérent : OUI**, une fois la méthode de reconstruction rendue explicite comme
  ci-dessus. Le défaut relevé (BLOCKER potentiel évité) était uniquement le chiffre erroné « 71 » du
  rapport intermédiaire, jamais publié dans le document LaTeX lui-même.

**Vérification d'existence des messages listés dans la mission (CustomerOrder, OrderReceived, ...,
RevisedDeliveryPlan) : les 37 messages cités sont tous présents avec le statut `OBSERVE_RUN_FINAL` dans
le tableau principal de l'annexe G, confirmé par la reconstruction ci-dessus.**

**Messages non confirmés (ExecutionDelay, ExecutionFailure, EscalationRequest, PolicyDecision,
DeliveryDateUpdate, ProposedDeliveryDate) : recherche exhaustive dans tous les chapitres et annexes —
aucune occurrence en dehors de la section « Écart avec le document source » de l'annexe G. Ils ne sont
présentés nulle part ailleurs comme des messages courants du modèle.**

**`ExecutionEnd`, `ProductionCompleted`, `ProductAvailableForDelivery` : re-vérifiés directement contre
`abox_final.ttl` (recherche de `aer:hasMessageSubject` pour chacun des trois noms) — 0 occurrence dans
l'ABox du run final pour les trois. Classification `IMPLEMENTE_NON_OBSERVE` confirmée exacte, contre
l'ABox et non contre d'anciens runs.**

## Audit Flux global (`flux_global_messages.png`) et chapitre 6

Figure inspectée visuellement. CMD reste Make-to-Stock du début à la fin du diagramme (titre explicite :
« CMD reste Make-to-Stock »). Chemin de décision exact vérifié : CustomerOrder → InventoryCheck → « Stock
fini suffisant ? » → Oui → Deliver ; Non → Analyse Make → « Matières suffisantes ? » → Oui → Make puis
Deliver ; Non → Source → MaterialAvailable → Make puis Deliver. Aucune branche ne convertit la commande
en MTO. Conforme à la spécification exacte demandée.

## Audit Profils de test — investigation de géométrie complète

Investigation approfondie de l'ALP au-delà de la simple absence dans les captures, comme demandé.

- `btnProfilsTest` (Id `1799900001222`, X=930, Y=750, Width=180, Height=30) est déclaré avec
  `PublicFlag=true` et `PresentationFlag=true` (aucune condition de visibilité conditionnelle détectée
  dans son XML), sur le même canevas de présentation (`level1`, niveau racine) que ses deux voisins
  confirmés visibles : `btnNombreCommandesTest` (« Contrôle commandes », X=1120, Y=710) et
  `btnTempsBudgetSimulation` (« Temps & budgets », X=1310, Y=710) — 40 unités Y plus bas seulement.
- Le modèle .alp de ce projet ne définit aucun élément `<Views>`/`<View>` explicite ; la fenêtre visible à
  l'exécution correspond directement au niveau de présentation et à sa taille de fenêtre d'application,
  pas à une vue nommée séparée.
- La capture `ui_configuration.png` (seule capture documentant cet écran) montre exactement la même ligne
  de boutons que ses deux voisins confirmés (« Stocks initiaux », « Contrôle commandes », « Temps &
  budgets », alignés sur la même rangée visible en bas de la vue Configuration) mais **le cadrage de la
  capture s'arrête juste après une rangée de commandes supplémentaire, avec un liseré de rangée coupée
  visible tout en bas de l'image** — cohérent avec un bouton positionné juste sous la limite de cadrage
  de cette capture précise plutôt que réellement invisible dans l'application.
- **Classification retenue : `VISIBLE_BUT_NOT_CAPTURED`** (et non `HIDDEN_OR_OUT_OF_VIEW` comme conclu
  dans la tranche précédente). Justification : aucune condition de masquage (`HIDDEN_BY_LOGIC` écartée),
  le contrôle possède un vrai `Control Type="Button"` avec `ActionCode` réel (`FUNCTION_ONLY` écartée), il
  est positionné sur le même canevas que des boutons confirmés visibles, juste en dessous de la limite de
  cadrage de l'unique capture existante de cet écran. Aucune capture du jeu complet ne le montre
  effectivement rendu à l'écran, donc `VISIBLE_ACCESSIBLE` n'est pas non plus démontrable avec certitude
  absolue à partir des seules captures disponibles — d'où le choix de la catégorie intermédiaire.
- **Le mécanisme ZENER CAS 1/2/3 reste documenté comme chemin utilisateur principal pour la sélection de
  profil**, confirmé génuinement accessible : capturé dans `ui_profils_test.png`, cohérent avec
  `estScenarioCasTest`/`synchroniserProfilAvecScenarioSelectionne` dans l'ALP et avec le contenu du
  Tableau E.1.
- **Recherche exhaustive dans le document entier** de toute instruction résiduelle demandant à l'usager
  de cliquer sur `btnProfilsTest`/« Profils de test » sans avertissement : aucune trouvée. Les trois
  occurrences restantes (`11-prise-en-main.tex`, `15-lancer-suivre.tex`, `20-maintenance-extension.tex`,
  plus la ligne de tableau `e-interface.tex:90`) présentent toutes le bouton avec la réserve explicite
  « existe... mais leur position visible n'est pas confirmée » ou équivalent. **Références utilisateur
  invalides vers Profils de test : 0.**

## Audit tableaux

Toutes les tables `longtable`/`tabularx` en mode paysage (Annexes A, B, C, E, G) ont été inspectées page
par page dans le PDF compilé (`final_reaudit.pdf`). Un seul défaut visuel réel de dépassement de colonne
trouvé (voir MAJOR #3). Les en-têtes se répètent correctement sur chaque page de continuation
(`\endhead`/`\endfirsthead` vérifiés visuellement présents et actifs). Aucune cellule vide inattendue,
aucun désalignement de colonnes constaté ailleurs.

## Audit références et citations

`references.tex` inclus et compilé sans avertissement de citation indéfinie dans le journal de
compilation (`final_reaudit.log`, recherche exhaustive de « undefined » + « citation » : 0 résultat).
**Citations indéfinies : 0.**

## Audit valeurs numériques

Recherche exhaustive dans l'ensemble des fichiers `.tex` (chapitres et annexes) des anciennes valeurs
listées par la mission : `8.248`, `8,248`, `8.250`, `8,250`, `8.250413`, `361.921`, `361,921`, `372.05`,
`372,05`, `179 éléments`, `64 micro-activités`, `66 messages` — **0 occurrence trouvée**. Toutes les
valeurs numériques listées au début de cette mission (temps VSM, PCE, RL, RS, AG, CO, AM, PI, AHP local,
ISA-95) ont été retrouvées cohérentes partout où elles apparaissent dans le document, sans variante
divergente. **Anciennes valeurs présentées comme courantes : 0.**

## Audit style

Recherche ciblée d'AI-slop et de métadiscours sur les ~21 pages ajoutées lors de la tranche précédente
(chapitre 9 restructuré, annexes G et H, section 20.4, paragraphes ajoutés au chapitre 7 et à l'annexe
C) : aucune formule générique creuse, aucune phrase de méta-commentaire sur le processus de rédaction, ni
de répétition structurelle excessive relevée à la lecture. Le style reste factuel et dense, cohérent avec
le reste du document. `quality_check_documentation.py` (mode par défaut et `--final`) confirme
l'absence de métadiscours interdit et de jargon UI mal placé sur l'ensemble des 32 fichiers LaTeX
contrôlés, dans les deux modes.

## Audit limites scientifiques

Confirmé cohérent partout : PCE toujours qualifié ESTIME (chapitre 8, glossaire) ; PI présenté comme
synthèse interne, jamais comme optimum global démontré (chapitre 9, limites méthodologiques 9.13) ;
Bottom/Perfect explicitement qualifiés de paramètres du modèle non calibrés sur des références terrain
(annexe H, section Traçabilité, et annexe D) ; AHP local distingué du PI sans causalité affirmée entre
les deux (chapitre 9.12) ; le document ne revendique nulle part une validation sur plusieurs exécutions
ni une optimisation globale démontrée — un seul run de validation est cité comme source de toutes les
valeurs numériques (`RUN_1773129600000_1788264883846`), explicitement nommé à chaque table de valeurs.

## Audit captures d'écran

Quatre captures explicitement visées par la mission, classées individuellement par inspection visuelle
directe (voir aussi MINOR #4, OPTIONNEL #8-10) :

| Capture | Classification |
|---|---|
| `ui_nomenclature.png` | A_REMPLACER_AVANT_REMISE (chrome de capture visible aux deux bords) |
| `ui_nomenclature_annotee.png` | A_REMPLACER_AVANT_REMISE (même défaut de base + chevauchement des cadres d'annotation 3 et 4 sur le texte des sous-titres) |
| `ui_retours_qualite.png` | A_REMPLACER_AVANT_REMISE (arrière-plan d'IDE visible autour de la boîte de dialogue, dialogue lui-même intact) |
| `ui_responsabilites_machines.png` | OPTIONNEL_A_AMELIORER (capture techniquement propre, mais état vide plutôt qu'exemple peuplé) |

**Captures A_REMPLACER_AVANT_REMISE : 3 (`ui_nomenclature.png`, `ui_nomenclature_annotee.png`,
`ui_retours_qualite.png`).**

## Audit figures (ensemble complet)

**66 fichiers figures distincts référencés** (71 appels `\FigureOrPlaceholder`/`\includegraphics` au
total, certaines figures étant réutilisées), et non « ~68 » comme l'estimait le rapport intermédiaire —
écart mineur de comptage, sans figure manquante : **les 66 fichiers existent tous sur disque**, aucun
`\FigureOrPlaceholder` n'est retombé sur son placeholder de secours (vérifié par absence de la chaîne
« Illustration planifiée » dans le texte extrait du PDF compilé). 25 de ces 66 fichiers sont des captures
d'écran sous `documentation/figures/screenshots/`.

Figures nouvellement ajoutées lors de la tranche précédente inspectées individuellement :
`grades_flous_a_f.png` (structure correcte, six triangles aux centres exacts 0/2/4/6/8/10 ; étiquettes de
pic peu lisibles, voir OPTIONNEL #11), `theeranuphattana_sconto.png` (deux colonnes clairement distinctes
reliées par « correspond à », conforme), `arbre_pi_metriques.png` (21 nœuds, 15 feuilles de métriques
réparties RL=4/RS=5/AG=3/CO=1/AM=2, correct et lisible, aucun chevauchement), `arbre_construction_performance.png`,
`arbre_agents_detaille.png`, `flux_global_messages.png` (conforme, voir section dédiée),
`boucle_objectif_preuve.png` (conforme, voir section dédiée) — toutes rendues sans chevauchement de texte
ni de boîtes.

**Figures problématiques : 0** au sens d'un défaut bloquant (contenu erroné, absence, chevauchement
rendant le contenu illisible). Un seul défaut esthétique mineur relevé (étiquettes de
`grades_flous_a_f.png`, OPTIONNEL #11).

## Audit Overfull hbox (recompilation complète)

30 avertissements Overfull au total dans `final_reaudit.log` après 4 passes de compilation stables.
Chacun a été localisé précisément (fichier source et ligne) puis vérifié visuellement dans le PDF
compilé, pas seulement compté depuis le journal.

| Ampleur | Fichier | Verdict |
|---|---|---|
| 78,71 pt | `e-interface.tex` (Table E.1) | **A_CORRIGER** (MAJOR #3) |
| 45,97 pt | `11-prise-en-main.tex` | INVISIBLE_ACCEPTABLE (le token entier est reporté à la ligne suivante, aucun débordement visible) |
| 43,38 pt | `h-formalisme-pi.tex` (intro exemple AG) | INVISIBLE_ACCEPTABLE (paragraphe, retour à la ligne propre) |
| 38,82 pt | `h-formalisme-pi.tex`, éq. H.10 | **A_CORRIGER par prudence** (MINOR #5) |
| 36,85 pt | `h-formalisme-pi.tex` (chemins de fichiers, traçabilité) | INVISIBLE_ACCEPTABLE (déjà retravaillé lors d'une tranche précédente, revérifié visuellement propre) |
| 21,80 pt | `b-fonctions.tex` | INVISIBLE_ACCEPTABLE |
| 20,36 pt | `a-structure-json.tex` | INVISIBLE_ACCEPTABLE |
| 18,60 pt | `c-agents.tex` | INVISIBLE_ACCEPTABLE |
| 17,35 pt | `a-structure-json.tex` (nom de fichier JSON) | INVISIBLE_ACCEPTABLE, vérifié visuellement (page 87) |
| 16,31 pt | `h-formalisme-pi.tex`, éq. H.9 | **A_CORRIGER par prudence** (MINOR #5, même paire que H.10) |
| 15,34 pt | `h-formalisme-pi.tex` (traçabilité) | INVISIBLE_ACCEPTABLE |
| 12,74 pt et moins (19 avertissements restants, dont 5 alignements de tableau à 3,89 pt identiques dans `c-agents.tex`) | divers | INVISIBLE_ACCEPTABLE, sous le seuil de risque de chevauchement visuel |

**Overfull A_CORRIGER : 3** (le tableau E.1, et la paire d'équations H.9/H.10 comptée comme un seul point
de correction). **Overfull INVISIBLE_ACCEPTABLE : 27.** L'objectif « A_CORRIGER = 0 » n'est donc pas
atteint ; il reste 2 points de correction identifiés avec précision (fichier, ligne, cause) pour une
future passe corrective, contre 5 points constatés lors du cycle correctif précédent — progression nette
mais non totale.

## Contrôles automatisés

- `python documentation/scripts/quality_check_documentation.py` (mode par défaut) : **SUCCÈS**, 32
  fichiers LaTeX contrôlés, 0 U+2014, 0 tiret long LaTeX, 0 métadiscours interdit, 0 jargon UI mal placé.
- `python documentation/scripts/quality_check_documentation.py --final` : **SUCCÈS**, mêmes résultats en
  mode final.
- U+2014 dans le texte extrait du PDF compilé (`pdftotext`, contrôle indépendant du script) : **0**.
- Occurrences du mot anglais « appendix » dans le texte extrait du PDF compilé : **0** (le correctif
  `\crefname{appendix}{annexe}{annexes}` ajouté à `preamble.tex` lors de la tranche précédente tient
  toujours).
- Citations indéfinies dans le journal de compilation : **0**.

## Structure du document

Page de titre, table des matières (jusqu'à la partie IV vérifiée, structure à 20 chapitres en 5 parties
cohérente avec le sommaire), annexes A à H toutes présentes et dans l'ordre attendu, bibliographie
(`references.tex`) incluse après le chapitre 20 et avant les annexes, dernière page (annexe H, section
Traçabilité des données) se termine proprement sans contenu tronqué. Aucun défaut structurel constaté.

## Table des corrections nécessaires

| # | Sévérité | Emplacement | Nature |
|---|---|---|---|
| 1 | MAJOR | `07-agents-aer.tex:30`, `c-agents.tex:140` | Ambiguïté de formulation sur `AOe-sD1.8` (deux occurrences) |
| 2 | MAJOR | `c-agents.tex` (ligne `ASup-sD1`), chapitre 7 | Absence d'explicitation que `ASup-sD1` est un identifiant logique jamais observé littéralement dans l'ABox |
| 3 | MAJOR | `e-interface.tex:90` | Dépassement visible de colonne dans le Tableau E.1 |
| 4 | MINOR | Rapport interne uniquement | « Quatre captures » énumérées à trois dans le rapport intermédiaire |
| 5 | MINOR | `h-formalisme-pi.tex`, éq. H.9/H.10 | Dépassement à la marge sur la page finale, non enveloppé dans `\small` contrairement à H.11/H.12 |
| 6 | MINOR | `g-messages-flux-global.tex` | Lettre de famille « H. » absente de la numérotation A-J |
| 7 | TYPOGRAPHIE | `09-scor-pi.tex:32` | « Cette annexe » au lieu de « Ce chapitre » |
| 8-10 | OPTIONNEL | 3 captures d'écran | Chrome de capture visible, chevauchement d'annotation |
| 11 | OPTIONNEL | `grades_flous_a_f.png` | Étiquettes de pic peu lisibles |

---

# Réponse finale

SHA : `05a8d1c03036d2ec92c1301fc3c7eb8d70db3648`
Pages auditées : 148 (physiques), 136 (numérotation arabe interne)
Chapitres audités : 20/20
Annexes auditées : 8/8 (A-H)
Figures auditées : 66/66 fichiers distincts (71 appels)
Tableaux audités : toutes les tables landscape/longtable des annexes A, B, C, E, G
BLOCKERS : 0
MAJOR : 3
MINOR : 3
TYPOGRAPHIE : 1
OPTIONNEL : 4
PI recalculé (valeur) : 6,11881172 (confirmé exact, recalcul indépendant)
Vecteur fuzzy global vérifié directement dans l'ABox : OUI
Exemple AG vérifié directement dans l'ABox : OUI
Incohérences numériques : 0
Comptage messages source (nombre) : 73 (et non 71 ; correction du rapport intermédiaire)
Messages ajoutés hors source (nombre) : 1 (`SupplierDelayAlert`)
Messages uniques totaux examinés (nombre) : 74
Messages OBSERVE_RUN_FINAL (nombre) : 62
Messages IMPLEMENTE_NON_OBSERVE (nombre) : 6
Messages historiques non confirmés (nombre) : 6
Comptage messages cohérent : OUI (73 + 1 = 74 = 62+6+6, sans reste)
Agents structurels vérifiés (nombre) : 26 (lignes du Tableau 2)
Agents observés vérifiés (nombre) : 24 avec acteurs externes inclus, 22 sans (définition à préciser dans le document, absente du PDF publié)
Nomenclature Deliver correcte : AMBIGUË (voir MAJOR #1, deux occurrences précisément localisées)
Profils de test statut définitif : VISIBLE_BUT_NOT_CAPTURED
Références utilisateur invalides vers Profils de test (nombre) : 0
Anciennes valeurs présentées comme courantes (nombre) : 0
Captures A_REMPLACER_AVANT_REMISE (nombre et liste) : 3 (`ui_nomenclature.png`, `ui_nomenclature_annotee.png`, `ui_retours_qualite.png`)
Figures problématiques (nombre) : 0 bloquant, 1 esthétique mineur
Overfull A_CORRIGER (nombre) : 3 (Table E.1 ; paire d'équations H.9/H.10)
Overfull INVISIBLE_ACCEPTABLE (nombre) : 27
Citations indéfinies (nombre) : 0
U+2014 (nombre) : 0
Quality check résultat : SUCCÈS
Quality check --final résultat : SUCCÈS
Verdict : CORRECTIONS_MINEURES_REQUISES
Corrections absolument nécessaires : reformuler les deux phrases `AOe-sD1.8` (MAJOR #1) ; expliciter le statut d'identifiant logique de `ASup-sD1` (MAJOR #2) ; corriger le débordement de colonne du Tableau E.1 (MAJOR #3).
