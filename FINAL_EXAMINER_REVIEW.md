# Revue finale par un examinateur académique et technique

Commit audité: `913cc17838d95dc36d7904c041cc735aaaee0f90`

## 1. Verdict exécutif

Verdict: `CORRECTIONS_MAJEURES_REQUISES`.

Le rapport est techniquement cohérent, lisible et prudent sur la portée de son unique exécution validée. Les valeurs centrales sont concordantes avec le socle probatoire, les périmètres temporels sont séparés, le PCE reste qualifié comme estimation et aucune causalité quantitative non soutenue n'a été relevée. Les quatre figures sont exploitables dans le PDF.

La remise académique immédiate n'est toutefois pas recommandée. Trois faiblesses importantes subsistent: l'absence totale de bibliographie et de citations, la documentation insuffisante de la logique floue et de la métrique interne `AG.1.1`, puis une page de garde dépourvue des informations académiques et d'identification normalement attendues. Ces problèmes n'invalident pas les observations du run, mais ils fragilisent la justification théorique, la reproductibilité du PI et la conformité formelle du document.

Décompte:

- BLOCKER: 0
- MAJOR: 3
- MINOR: 3

## 2. BLOCKERS

Aucun BLOCKER n'a été identifié. Le rapport ne contient pas de valeur centrale contradictoire, de confusion susceptible d'invalider le PI, ni de conclusion causale incompatible avec le protocole disponible.

## 3. Points MAJOR

### MAJOR 1: absence de bibliographie et de citations

Le PDF ne contient ni bibliographie, ni liste de références, ni citation dans le corps du texte. Pourtant, le raisonnement mobilise SCOR, VSM, ISA-95, AHP, la quantité économique de Wilson, la logique floue et une méthode adaptée identifiée dans les artefacts comme `THEERANUPHATTANA_CHAN_QI_ADAPTED`.

Cette absence empêche le lecteur de distinguer les définitions issues de cadres reconnus, les adaptations propres au modèle et les choix méthodologiques des auteurs. Elle est particulièrement sensible pour les codes proches de SCOR, les profils Bottom/Perfect, l'agrégation floue et la formule de Wilson. Dans un rapport scientifique de cette nature, ce défaut doit être corrigé avant soutenance.

### MAJOR 2: reproductibilité incomplète du pipeline flou et qualification insuffisante de `AG.1.1`

Le rapport expose correctement la chaîne mesures, normalisation, logique floue, attributs, pondération et PI. Il publie les valeurs d'attribut et la somme pondérée finale. Il ne décrit toutefois pas les fonctions d'appartenance, les règles d'inférence, la méthode d'agrégation ou de défuzzification, ni le contenu exact de l'adaptation méthodologique. Un lecteur ne peut donc pas reconstruire les scores RL, RS, AG, CO et AM à partir des valeurs brutes en s'appuyant sur le rapport seul.

Le cas de `AG.1.1` renforce cette réserve. L'implémentation l'étiquette comme stabilité du débit, calculée par `1 - coefficient de variation`, alors que le catalogue interne lui associe l'intitulé Upside Supply Chain Adaptability. La fonction retourne aussi la valeur neutre `0,5` lorsque l'historique comporte moins de trois points ou lorsque le débit moyen est nul. L'export observé donne `0,5`, sans indiquer si cette valeur provient du calcul ou du repli neutre. Le chapitre 7 la qualifie seulement de mesure du pipeline interne, et l'annexe D ne la recense pas alors qu'elle contribue à AG, puis au PI.

Il faut donc expliciter qu'il s'agit d'une approximation interne, documenter la condition de repli, exporter ou établir la provenance de la valeur observée, et compléter l'annexe D. Sans cela, la valeur finale reste correcte comme sortie du logiciel, mais sa reconstruction et son interprétation méthodologique demeurent incomplètes.

### MAJOR 3: page de garde académiquement incomplète

La page de garde présente le titre, le sous-titre, l'application à ZENER SA Togo et la date. Elle ne présente ni auteur, ni établissement, ni formation ou diplôme, ni encadrement, ni année académique. Sauf existence d'une couverture institutionnelle séparée, le PDF final n'est pas identifiable comme un mémoire ou un rapport académique remis par une personne déterminée.

Ce défaut ne porte pas sur les résultats, mais il peut empêcher une remise formellement conforme. Les mentions doivent être complétées selon le modèle officiel de l'établissement, sans inventer les informations absentes du dépôt.

## 4. Points MINOR

### MINOR 1: date de remise à confirmer

La page de garde indique `Août 2026`. Si la date officielle de remise est septembre 2026, le statut est `DATE_A_CONFIRMER`. Aucun changement ne doit être fait avant confirmation institutionnelle.

### MINOR 2: liste des sigles incomplète

La liste couvre AER, AHP, PI, SCOR, VSM et WIP, mais le rapport emploie aussi de manière structurante ISA-95, RDF, GPL, CMD, REAPPRO, RL, RS, AG, CO et AM. Leur ajout réduirait la charge de lecture, surtout pour un jury qui ne connaît pas les identifiants du modèle.

### MINOR 3: catégorie visuelle ambiguë dans la figure 4.1

La figure 4.1 place `MaterialAvailable`, un message ou événement de disponibilité, dans la même catégorie colorée que le diagnostic et le crédit de stock, sous la légende « Stock ou disponibilité ». Le texte du chapitre 3 distingue pourtant explicitement flux physique, message, animation et mesure. Une catégorie visuelle propre aux messages rendrait cette distinction plus nette. L'ambiguïté reste limitée, car la figure n'attribue aucune quantité physique au message.

## 5. Points jugés ACCEPTABLE

- La validation expérimentale est limitée à une exécution unique. Le rapport le déclare à plusieurs reprises et ne généralise pas les valeurs à l'entreprise réelle.
- Les périmètres de la commande cliente et de `ACT_4` sont distingués sans ambiguïté. Les indicateurs de commande ne sont pas confondus avec les temps ZENER.
- Le PCE de 70,9 pour cent reste qualifié comme estimation fondée sur des taux VA configurés. Il n'est présenté ni comme un chronométrage terrain, ni comme une norme externe, ni comme une amélioration par rapport à une ancienne valeur.
- `CO.1.1` est défini comme coût total simulé rapporté au chiffre d'affaires estimé. Le score CO nul est expliqué comme une conséquence du profil de normalisation, pas comme un coût nul ou une absence de performance économique réelle.
- Le PI est présenté comme une synthèse multicritère interne aux profils retenus. Il n'est pas assimilé à une certification SCOR, à une note absolue de ZENER SA Togo ou à un effet du retard fournisseur.
- `CMD_*` désigne la commande cliente externe et `REAPPRO_*` l'ordre autonome interne. Cette distinction reste cohérente dans les chapitres 2, 4, 6, 8, 9 et dans la conclusion.
- La politique reste décrite comme Make-to-Stock. L'attente d'une reconstitution ne devient pas une commande Make-to-Order.
- AER est relié aux catégories AMENDMENT, EXECUTION et REPORT sans expansion non soutenue de l'acronyme.
- Le score AHP local de 0,730 est clairement séparé du PI. Aucun gain global ou effet positif sur le PI n'en est déduit.
- Le retard fournisseur est correctement circonscrit au GPL de `ACT_1`, avec 6 h nominales, 12 h effectives, 6 h supplémentaires et la première réception seulement. Les six messages attendus sont présents et ordonnés.
- Les nombres ISA-95 sont décrits comme une structure exportée du modèle: 190 sujets d'équipement typés, 71 micro-activités et 71 relations `executedAt`. Le texte ne prétend pas avoir observé 190 équipements physiques sur le terrain.
- La nomenclature et les stocks sont cohérents: commande 20, besoin GPL 250, GPL initial 0, bouteilles initiales 250, accessoires initiaux 300, bouteilles finales 230, accessoires finaux 280 et stock final de produit fini nul.
- La chronologie de simulation se termine à `T=2343 s`, tandis que le registre métier donne un Lead Time de `65 041,24056241 s`. Les deux échelles ne sont pas confondues.
- L'annexe E ne rend que les cinq artefacts utiles à la preuve finale. Aucun historique candidate ou baseline n'encombre le PDF.
- Le résumé, l'introduction, la discussion et la conclusion poursuivent les mêmes objectifs. Le résumé et la conclusion n'introduisent pas de résultat absent du développement.
- L'absence d'abstract anglais et de remerciements n'est pas classée comme défaut en l'absence d'une exigence institutionnelle fournie. Cette conformité reste à vérifier avec le canevas officiel.

## 6. Audit numérique

- Order Processing Time: `18 116,83756052 s`, conforme.
- Order Waiting Time: `46 924,40300189 s`, conforme.
- Order Fulfillment Lead Time: `65 041,24056241 s`, conforme.
- Identité temporelle: `18 116,83756052 + 46 924,40300189 = 65 041,24056241 s`, exacte.
- Part d'attente: `46 924,40300189 / 65 041,24056241 = 72,1456 %`, arrondie à 72,1 pour cent dans le rapport, conforme.
- ZENER Process Time: `59,38852156 s`, conforme.
- ZENER Waiting Time: `12,69587399 s`, conforme.
- Dénominateur PCE ZENER: `72,08439555 s`, exact.
- Valeur ajoutée estimée: environ `51,0869 s`, conforme à l'export et explicitement estimée.
- ZENER Estimated PCE: `0,70870898`, soit 70,9 pour cent affiché, conforme.
- RL: `7,5`, conforme.
- RS: `5,94733671`, conforme.
- AG: `4,73462025`, conforme comme sortie exportée, avec une réserve de provenance sur `AG.1.1`.
- CO: `0`, conforme au profil interne.
- AM: `9,70588235`, conforme.
- PI recalculé: `6,1188117195`, arrondi à `6,11881172`, exact.

Le calcul du PI vérifié est:

`0,40 x 7,5 + 0,20 x 5,94733671 + 0,10 x 4,73462025 + 0,15 x 0 + 0,15 x 9,70588235 = 6,1188117195`.

Les différences entre valeurs exactes et valeurs affichées sont des arrondis ordinaires. Aucune divergence numérique significative n'a été détectée entre le corps, les annexes, Excel, l'ABox et le rapport de vérification.

## 7. Audit causal

Statut: ACCEPTABLE.

Le document évite les formulations qui attribueraient quantitativement le statut tardif aux seules 6 h supplémentaires du fournisseur. Il rappelle qu'aucune exécution de référence sans retard, synchronisée avec le même modèle et une graine contrôlée, n'est disponible. Il sépare également la présence d'une décision `REBALANCE` de tout effet supposé sur le PI.

Les verbes plus affirmatifs portent sur des enchaînements observés ou des mécanismes implémentés: création de `REAPPRO_1`, passage de Source avant Make, crédit de stock, réveil de `CMD_1`, propagation des messages et clôture. Ces affirmations sont soutenues par les artefacts. Les phrases concernant la continuité du flux ou la capacité d'adaptation restent interprétables comme une lecture fonctionnelle du scénario, et elles sont suivies de limites explicites sur l'optimalité et la généralisation.

Aucune correction causale indispensable n'est requise. La réserve essentielle doit rester visible pendant la soutenance: le run établit une trajectoire perturbée cohérente, pas l'effet net du retard.

## 8. Audit normatif

Le rapport prend la précaution utile de ne pas transformer automatiquement tout code proche de SCOR en métrique normative. Les associations `RL.*`, `RS.*`, `CO.*` et `AM.*`, les approximations mono-produit et `PROXY.AG.SYSTEM_UTILIZATION` sont généralement qualifiées dans le chapitre 7 ou l'annexe D.

`CO.1.1` est cohérent dans tout le document avec le ratio coût simulé sur chiffre d'affaires estimé. `RS.2.5` est signalée comme absente lorsque Return n'est pas exécuté, sans remplacement par zéro. Les ratios mono-produit `RL.3.33` et `RL.3.35` sont correctement limités au scénario.

La réserve normative principale concerne `AG.1.1`. Son code peut suggérer une autorité SCOR, alors que son contenu effectif est une approximation interne de stabilité du débit avec possibilité de repli neutre. Cette métrique doit être qualifiée individuellement dans le chapitre 7 et l'annexe D, et non seulement couverte par une précaution générale.

La terminologie ISA-95 est employée pour la structure du modèle et les relations d'affectation, sans prétendre à un relevé physique de l'usine. AER et AHP sont employés de manière cohérente avec les artefacts, mais leurs fondements doivent être rattachés à des références vérifiées.

## 9. Audit bibliographique

Statut: MAJOR.

Aucune bibliographie n'apparaît dans le PDF. Aucun appel de citation ne permet de rattacher les cadres théoriques à une source. La correction doit reposer sur une recherche et une vérification documentaire réelles, sans produire d'auteur, d'année, de titre ou de DOI de mémoire.

Types de sources à rechercher:

- une référence officielle et actuelle du cadre SCOR utilisé;
- le texte normatif ou une référence autoritative pour ISA-95;
- un ouvrage ou article académique définissant la VSM et le PCE;
- une source académique fondatrice ou méthodologique sur l'AHP;
- une source fiable sur la quantité économique de commande, dite EOQ ou Wilson;
- une référence méthodologique sur la normalisation, les fonctions d'appartenance, l'inférence et la défuzzification retenues;
- l'article exact ou la documentation exacte correspondant à `THEERANUPHATTANA_CHAN_QI_ADAPTED`;
- si AER est une construction propre au projet, une source interne clairement qualifiée ou une définition méthodologique explicite, sans lui attribuer un statut normatif externe.

Les références devront être citées au point d'usage, notamment dans les sections 1.3, 2.3, 3.4, 5.5 et 7.1 à 7.4.

## 10. Audit visuel

Les 37 pages physiques du PDF et les quatre figures ont été inspectées. Aucun texte coupé, chevauchement, image manquante, flèche incohérente ou unité illisible n'a été relevé. Les couleurs présentent un contraste suffisant, les légendes sont visibles et les tableaux restent lisibles à l'échelle A4. La table des matières, la liste des figures, la liste des tableaux et les annexes sont présentes et cohérentes avec la pagination.

La figure 4.1 restitue correctement la séquence `CMD_1`, diagnostic, `REAPPRO_1`, Source, Make, crédit de stock, réveil et Deliver. Sa seule réserve est la catégorie commune « Stock ou disponibilité » appliquée à `MaterialAvailable`.

La figure 5.1 présente correctement les six messages du retard et leurs destinataires successifs. Elle ne revendique ni gain ni optimalité. La figure 6.1 sépare clairement les trois temps de commande des trois indicateurs focalisés sur ZENER et qualifie le PCE comme estimé. La figure 7.1 montre bien que la logique floue précède les attributs et la pondération; ses valeurs et ses poids concordent avec le texte.

La mise en page générale est sobre et professionnelle. Quelques fins de chapitre laissent une grande zone blanche, mais cela ne gêne ni la lecture ni l'intégrité du document. Le point formel le plus important reste la page de garde incomplète.

## 11. Quinze questions potentielles de soutenance

### 1. Que valide exactement l'unique exécution retenue?

- Pourquoi la question est probable: le rapport emploie le terme validation expérimentale avec un seul run.
- Éléments disponibles: chapitres 8 et 10, concordance Excel et ABox, chronologie, VSM et PI.
- Précaution: limiter la réponse à la cohérence fonctionnelle et probatoire du scénario, sans robustesse statistique ni généralisation terrain.

### 2. Pourquoi le modèle reste-t-il Make-to-Stock alors qu'une commande déclenche une reconstitution?

- Pourquoi la question est probable: le comportement peut sembler proche du Make-to-Order.
- Éléments disponibles: sections 2.3, 4.1 et 9.3, rôle de la politique de stock et distinction entre demande et ordre interne.
- Précaution: expliquer que `REAPPRO_1` rétablit un stock et ne devient pas une seconde commande cliente.

### 3. Pourquoi séparer `CMD_1` et `REAPPRO_1`?

- Pourquoi la question est probable: cette séparation est présentée comme un apport conceptuel central.
- Éléments disponibles: chapitres 4, 6 et 9, relations RDF directes et inverses, dénominateurs des KPI clients.
- Précaution: la règle d'imputation n'est validée que pour une commande et une reconstitution.

### 4. Comment concilier `T=2343 s` et un Lead Time de `65 041,24 s`?

- Pourquoi la question est probable: les deux durées diffèrent fortement.
- Éléments disponibles: sections 2.4, 4.2, 6.1 et 8.2, conversion temporelle et registre métier.
- Précaution: ne jamais convertir l'une en l'autre sans appliquer les règles propres aux processus.

### 5. Comment le PCE de 70,9 pour cent est-il obtenu?

- Pourquoi la question est probable: le PCE est un résultat central mais non chronométré directement.
- Éléments disponibles: équation 6.2, temps ZENER, environ 51,0869 s de valeur ajoutée estimée, taux VA configurés.
- Précaution: présenter le résultat comme `ESTIME`, non comme mesure terrain ou norme externe.

### 6. Que représente réellement la valeur `AG.1.1 = 0,5`?

- Pourquoi la question est probable: elle contribue à AG et son code évoque un indicateur SCOR.
- Éléments disponibles: chapitre 7, export du pipeline et implémentation de la stabilité du débit.
- Précaution: le rapport ne permet pas de déterminer si `0,5` est calculé ou produit par le repli neutre; reconnaître cette limite.

### 7. Quels indicateurs sont officiellement SCOR et lesquels sont internes?

- Pourquoi la question est probable: le chapitre 7 emploie de nombreux codes proches de SCOR.
- Éléments disponibles: précautions des sections 1.3 et 7.1, qualifications de l'annexe D.
- Précaution: ne revendiquer aucun statut officiel sans vérification dans une référence SCOR autoritative.

### 8. Pourquoi le score CO vaut-il zéro alors que des coûts existent?

- Pourquoi la question est probable: la valeur paraît contradictoire avec les coûts publiés.
- Éléments disponibles: section 7.2, ratio coût simulé sur chiffre d'affaires estimé et profil Bottom/Perfect.
- Précaution: zéro est un score normalisé du modèle, pas un coût nul ni une évaluation économique absolue.

### 9. Comment la logique floue produit-elle les scores d'attribut?

- Pourquoi la question est probable: elle constitue l'étape intermédiaire entre métriques et PI.
- Éléments disponibles: figure 7.1, sections 7.1 et 7.3, exports de scores.
- Précaution: les fonctions d'appartenance et les règles ne sont pas assez détaillées dans le rapport actuel; cette lacune doit être corrigée.

### 10. Quelle différence existe entre le score AHP de 0,730 et le PI de 6,119?

- Pourquoi la question est probable: les deux agrègent plusieurs critères dans la même exécution.
- Éléments disponibles: sections 5.5, 8.4 et 9.5.
- Précaution: l'AHP classe une décision locale; le PI synthétise des attributs globaux après logique floue. Aucun lien causal n'est établi entre eux.

### 11. Peut-on attribuer le retard client aux 6 h supplémentaires du fournisseur?

- Pourquoi la question est probable: le scénario est nommé par la perturbation fournisseur.
- Éléments disponibles: sections 5.2, 8.3, 9.7 et 10.1.
- Précaution: répondre non pour l'effet net, faute de scénario de référence apparié et de graine contrôlée.

### 12. Que prouvent les six messages AER?

- Pourquoi la question est probable: la propagation constitue une preuve centrale d'adaptation.
- Éléments disponibles: table 5.1, figure 5.1 et section 8.3.
- Précaution: ils prouvent la transformation et la circulation de l'information, pas une optimisation globale ni un transfert physique.

### 13. Que représentent les nombres 190 et 71 dans l'ancrage ISA-95?

- Pourquoi la question est probable: 190 peut être interprété comme un comptage terrain.
- Éléments disponibles: sections 3.4 et 8.5, ABox avec équipements typés, micro-activités et relations `executedAt`.
- Précaution: parler de sujets ou noeuds du modèle exporté, pas de 190 machines physiquement observées chez ZENER.

### 14. Dans quelle mesure l'expérience est-elle reproductible?

- Pourquoi la question est probable: l'identifiant d'exécution et les empreintes sont présents, mais la graine ne l'est pas.
- Éléments disponibles: sections 2.4, 9.4, 10.1 et annexe E.
- Précaution: distinguer intégrité des artefacts, reproduction de la configuration et reproduction exacte de la trajectoire aléatoire.

### 15. Quel protocole serait prioritaire pour renforcer la validation?

- Pourquoi la question est probable: le rapport assume plusieurs limites expérimentales.
- Éléments disponibles: section 9.8 et chapitre 10.
- Précaution: proposer d'abord des scénarios appariés avec et sans retard, des graines contrôlées et des réplications, puis une calibration terrain des taux VA et des profils Bottom/Perfect.

## 12. Décision finale de livrabilité

Décision: `CORRECTIONS_MAJEURES_REQUISES`.

Le document est suffisamment cohérent pour servir de base finale et ne nécessite pas de reprise des résultats du run. Il n'est pas encore recommandé pour remise ou soutenance dans sa forme actuelle. La bibliographie, la reproductibilité du pipeline flou avec la qualification de `AG.1.1`, et la page de garde doivent être corrigées avant livraison. Les points MINOR peuvent être traités dans la même passe éditoriale.

## 13. Liste minimale des corrections recommandées

1. Ajouter une bibliographie vérifiée et des citations au point d'usage pour SCOR, VSM, ISA-95, AHP, Wilson ou EOQ, la logique floue et la méthode adaptée exacte.
2. Documenter les étapes reproductibles de la normalisation et de la logique floue, puis expliquer la construction des cinq scores d'attribut.
3. Qualifier `AG.1.1` comme approximation interne, préciser le repli neutre à `0,5`, établir la provenance de la valeur du run et ajouter cette métrique à l'annexe D.
4. Compléter la page de garde selon le canevas institutionnel et confirmer la date officielle de remise.
5. Compléter la liste des sigles et distinguer visuellement `MaterialAvailable` d'un état de stock dans la figure 4.1.
