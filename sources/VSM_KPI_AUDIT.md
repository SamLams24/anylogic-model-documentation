# Audit des familles de KPI VSM et des métriques temporelles

## Objet et sources

Cet audit porte sur le projet `SCONTO_SVU_FINAL.alp` et sur les artefacts primaires du scénario de retard fournisseur identifiés par le `runId` `RUN_1773129600000_1788030213308`. Il vérifie les chaînes d'alimentation et d'export sans modifier le modèle. Les résultats décrits dans le classeur et l'ABox restent des observations de cette exécution. Leur présence ne suffit pas à valider la définition scientifique de chaque indicateur.

La conclusion principale est la suivante. Les quatre familles de KPI ne représentent pas le même objet. `kpiParMicroActivite` et `kpiParMacro` agrègent des passages de postes ou des étapes instrumentées. `kpiZener` restreint ces mêmes observations au périmètre `ACT_4`. `kpiGlobal` reçoit une observation par commande cliente close. Les valeurs temporelles globales ne doivent donc pas être interprétées comme la somme directe des KPI de postes.

## Règles communes de `KPIBundle`

La méthode `addObservation()` conserve des sommes simples et des sommes pondérées par `quantityWeight`. Lorsque le poids cumulé est positif, les moyennes de cycle et d'attente sont calculées par quantité:

`cycle moyen = somme(cycle multiplié par quantité) / somme(quantité)`

`attente moyenne = somme(attente multipliée par quantité) / somme(quantité)`

`PCE = somme(VA multipliée par quantité) / somme((cycle + attente) multiplié par quantité)`

`avgLeadTime()` additionne la moyenne du cycle et la moyenne de l'attente. Cette identité est cohérente à l'intérieur d'un même bundle lorsque les deux composantes utilisent la même unité et le même périmètre.

`kpiGlobal` constitue une exception d'alimentation. `notifierFin()` écrit directement dans les sommes non pondérées et n'alimente pas les champs pondérés. Une observation globale représente donc une commande cliente close, indépendamment de sa quantité.

## `kpiParMicroActivite`

### Alimentation et objet observé

`BlackboardAgent.notifierPassage()` indexe ce bundle par `idPoste`. Deux chaînes l'appellent:

1. La sortie du bloc de traitement d'un poste physique calcule le temps de traitement par différence d'horloge, reprend le temps réellement passé dans la file précédente et applique le `tauxVA` du poste. Les jetons purement visuels sont exclus avant l'appel à `notifierPassage()`.
2. `enregistrerTraceExecutionCommande()` instrumente des étapes du moteur de commande. Il reçoit un temps de cycle, un temps d'attente et une quantité, puis calcule la valeur ajoutée à partir du poste trouvé ou d'un taux de repli.

Le bundle peut donc contenir des passages d'unités physiques et des étapes de commande instrumentées. Son compteur ne doit pas être lu uniformément comme un nombre d'unités, de commandes ou de postes. La pondération par quantité s'applique aux moyennes exposées par `KPIBundle`, mais certaines fonctions SCOR, notamment `avgCycleTimeCodes()` et `pceCodes()`, relisent les sommes non pondérées.

### Mesures, estimations et sorties

Le temps de file du flux physique est observé dans l'horloge de simulation. Le temps de traitement du poste physique est également observé. Pour une étape orchestrée, la durée peut provenir d'une loi de poste, d'une différence d'horloge ou d'une valeur fournie par le moteur. La part de valeur ajoutée reste estimée, car elle résulte d'un taux configuré.

Les feuilles `Dashboard Micro` et `KPI par Poste` utilisent cette famille, avec repli possible sur `kpiParPoste`. L'ABox exporte les micro-activités configurées et les événements bruts, mais elle ne crée pas d'individu portant directement la consolidation de `kpiParMicroActivite`.

Les fonctions `avgCycleTimeCodes()`, `countCycleTimeCodes()` et `pceCodes()` utilisent cette famille pour plusieurs métriques détaillées. Elles servent notamment aux temps de cycle de niveau détaillé et aux proxies AG fondés sur le PCE de groupes de codes.

## `kpiParMacro`

### Alimentation et objet observé

Chaque appel à `notifierPassage()` extrait le code SCOR de la clé composite acteur et processus, puis regroupe l'observation sous `sP`, `sS`, `sM`, `sD` ou `sR`. La famille reçoit les mêmes temps, taux VA et poids que les bundles micro. Elle agrège plusieurs postes et peut réunir des activités appartenant à des acteurs différents dès lors qu'elles partagent le même macro-processus.

Les moyennes sont pondérées par la quantité transmise à `notifierPassage()`. Le compteur reste un nombre d'observations, pas un nombre de produits. Le run audité illustre ce point avec 181 observations Make pour un lot de 20 unités.

### Sorties et métriques liées

La feuille `Dashboard Macro` expose le nombre d'observations, le cycle, l'attente, le Lead Time et le PCE par macro-processus. L'ABox crée seulement les individus `vsm_cycle_sS`, `vsm_cycle_sM`, `vsm_cycle_sD` et `vsm_cycle_sR`. Elle n'exporte pas l'attente ni le PCE macro dans des individus équivalents.

`calculerPIGlobal()` lit directement les cycles macro pour `RS.2.1`, `RS.2.2`, `RS.2.3` et `RS.2.5`. Ces métriques contribuent à Responsiveness lorsqu'un macro-processus possède au moins une observation.

## `kpiZener`

### Délimitation du périmètre focal

`notifierPassage()` alimente `kpiZener` lorsque la clé SCOR composite commence par `ACT_4|`. Cette clé est produite par `cleKPI()` à partir de `idActeurResponsable`. Les deux appels actifs à `notifierPassage()` utilisent cette construction. La sélection repose donc sur l'acteur responsable du poste, et non sur son seul code SCOR.

Les jetons visuels sont exclus dans la chaîne des postes physiques. Les observations ajoutées par `enregistrerTraceExecutionCommande()` ne sont pas des jetons visuels, mais des étapes instrumentées. Elles peuvent aussi entrer dans `kpiZener` si le poste résolu appartient à `ACT_4`.

### Portée scientifique

Cette famille fournit un périmètre plus pertinent que `kpiGlobal` pour une VSM de l'entreprise focale, car elle conserve les postes de `ACT_4`, les files observées et les temps de traitement associés. Elle n'est toutefois pas immédiatement publiable comme mesure VSM homogène. Son alimentation combine des passages physiques et des étapes orchestrées, et les phases du modèle n'utilisent pas toutes la même échelle temporelle.

Les temps d'attente des passages physiques proviennent réellement des files. Les temps VA ne sont pas observés directement. Ils sont calculés comme le temps de traitement multiplié par un taux configuré ou par un taux de repli. Le modèle ne doit donc pas les nommer temps VA mesurés sans préciser cette hypothèse.

Les cartes de l'interface lisent `kpiZener` pour Process Time, Waiting Time et PCE. Aucune feuille Excel dédiée ne l'exporte dans le classeur audité. L'ABox ne crée pas non plus d'individus VSM propres à `kpiZener`. `calculerPIGlobal()` ne lit pas cette famille directement.

## `kpiGlobal`

### Alimentation et périmètre

`enregistrerFinCommandeGlobale()` choisit `CommandeAgent.dureeReelleAccumulee` lorsque cette valeur est positive. Il exclut ensuite les identifiants `REAPPRO_*` et appelle `BlackboardAgent.notifierFin()`. Le bundle reçoit une observation par commande cliente close:

`process = leadTime - waitTime`

`attente = waitTime`

`valeur ajoutée = leadTime multiplié par 0,65`

La quantité commandée n'entre pas dans cette consolidation. Le bundle représente donc la fermeture des commandes clientes, pas les postes, les unités produites ni l'entreprise focale seule.

### Sorties et métriques liées

La feuille `Dashboard Global` utilise `kpiGlobal` pour le Process Time, le Lead Time et le PCE, mais elle remplace son attente moyenne par `tempsAttenteGlobalCoherent()`. L'ABox utilise directement `kpiGlobal` pour `vsm_cycle_global`, `vsm_wait_global` et `vsm_lead_global`.

Le pipeline SCOR utilise `kpiGlobal.avgLeadTime()` pour `RS.1.1`. Il utilise `tempsAttenteGlobalCoherent()` pour `RS.3.94`. Cette différence explique qu'une métrique SCOR de l'ABox puisse porter 5 256,598 s tout en déclarant qu'elle agrège l'individu `vsm_wait_global` égal à 0 s.

## Audit du PCE global

`enregistrerFinCommandeGlobale()` fixe la valeur ajoutée globale à `vat = lt multiplié par 0,65`. `notifierFin()` répartit le même `lt` entre cycle et attente. Pour une commande:

`cycle + attente = (lt - attente) + attente = lt`

La méthode `KPIBundle.pce()` calcule alors:

`PCE = vat / (cycle + attente) = 0,65 multiplié par lt / lt = 0,65`

La relation reste vraie pour plusieurs commandes, car la somme des valeurs ajoutées vaut 0,65 fois la somme des Lead Times. Le PCE global de 65 pour cent n'est donc pas une mesure. `KPIBundle.pce()` ne contient pas lui-même une constante de 65 pour cent, mais son résultat global est la conséquence algébrique d'une valeur ajoutée fixée à 65 pour cent lors de chaque clôture. Il s'agit d'une estimation imposée par hypothèse.

Pour le run audité, `lt = 15 018,85274794 s`. Le tableau de bord calcule:

`Waiting Time reconstruit = 15 018,85274794 multiplié par (1 - 0,65) = 5 256,59846178 s`

Les affichages arrondis deviennent donc un Lead Time de 15 018,853 s, un PCE de 65 pour cent et un Waiting Time de 5 256,598 s. Ces trois valeurs ne constituent pas trois mesures indépendantes.

## Audit du Waiting Time global

La cause de la divergence est établie.

La feuille `Dashboard Global` appelle `tempsAttenteGlobalCoherent()`. Tant que le PCE est compris entre zéro et un, cette fonction renvoie `Lead Time multiplié par (1 - PCE)` et ignore `kpiGlobal.avgWaitTime()`.

L'ABox crée `vsm_wait_global` à partir de `board.kpiGlobal.avgWaitTime()`. Dans le run audité, `CMD_1` est réveillée après la clôture de `REAPPRO_1`, puis suit le chemin de livraison depuis le stock. `finaliserReceptionClientDirecte()` appelle `enregistrerFinCommandeGlobale()` avec une attente nulle. Le temps passé par `CMD_1` à attendre la reconstitution du stock n'est jamais ajouté à son attente globale. Les attentes Make mesurées appartiennent aux unités de `REAPPRO_1` et ne sont pas transférées au bundle global de la commande cliente.

L'ABox est elle-même incohérente sur ce point. L'individu VSM `vsm_wait_global` vaut 0 s, tandis que la métrique `RS.3.94` vaut 5 256,59846178 s, car le pipeline emploie la fonction reconstruite. Le lien RDF affirme pourtant que cette métrique agrège `vsm_wait_global`.

Une attente observée doit provenir des files ou d'un état d'attente explicitement horodaté. La valeur 5 256,598 s est une reconstruction issue du PCE imposé et ne peut pas être qualifiée d'attente mesurée.

## Audit du Lead Time de la commande cliente

`CommandeAgent.dureeReelleAccumulee` commence à zéro. `planifierAvecEchelle()` ajoute une durée réelle échantillonnée à cet accumulateur, puis planifie l'action après division par `simToRealSeconds`. Make n'emploie pas cette conversion et ajoute, à la clôture d'une commande qui produit elle-même, le temps simulé écoulé depuis `tDebutProduction`.

Dans la politique MTS autonome observée, `CMD_1` et `REAPPRO_1` conservent des accumulateurs distincts. Pour `CMD_1`, l'accumulateur reçoit les durées de réception de commande, d'analyse initiale du stock, de Deliver après disponibilité du stock et de réception client. Les nouvelles tentatives d'analyse pendant l'attente utilisent `planifierActionCommande()` et n'ajoutent aucune durée. Source, la planification de Make et Make appartiennent à `REAPPRO_1`. La branche de clôture de cet ordre interne réveille `CMD_1`, mais elle ne transfère ni ses durées ni ses attentes à la commande cliente.

Le Lead Time de 15 018,853 s est donc une somme reconstruite et partielle de durées métier échantillonnées pour le parcours propre de `CMD_1`. Il exclut le temps pendant lequel cette commande attend la reconstitution, ainsi que les durées Source et Make exécutées sous `REAPPRO_1`. Il ne représente ni le temps calendaire client complet ni la somme complète du chemin Source, Make et Deliver.

L'écart entre T=53 s et T=1990 s vaut environ 1 937 s de simulation. Cet intervalle ordonne correctement la création et la clôture et inclut l'attente de la commande pendant `REAPPRO_1`. Il ne doit pas être converti par un facteur unique, car Source, Deliver, Plan et Return sont accélérés alors que Make conserve sa dynamique propre.

## Impact sur Responsiveness et le PI

`calculerPIGlobal()` ajoute systématiquement `RS.1.1` et `RS.3.94` à Responsiveness. Il ajoute aussi les cycles Source, Make, Deliver et Return lorsque ces macros ont été exécutées. Dans le run audité, Source, Make et Deliver contribuent avec les deux métriques globales. Chaque métrique RS reçoit donc un poids de 0,2 avant l'agrégation floue.

`RS.1.1` utilise le Lead Time partiel de 15 018,853 s. `RS.3.94` utilise l'attente reconstruite de 5 256,598 s. Le PCE imposé agit ainsi indirectement sur Responsiveness par `RS.3.94`. L'ABox donne un score RS de 6,48470653 avec un poids d'attribut de 0,2. Le PI de 6,22653408, affiché 6,227 dans Excel, dépend donc de deux entrées temporelles dont la sémantique n'est pas défendable.

Le statut actuel du PI est `CALCULE_MAIS_NON_VALIDABLE`. Excel et ABox confirment l'exécution du calcul, mais pas la validité expérimentale de ses entrées temporelles. Le PI ne doit pas être publié comme résultat final avant correction et nouveau run.

## Taux de valeur ajoutée et valeurs de repli

Pour un poste physique, le temps de traitement et le temps de file sont observés. La valeur ajoutée est estimée par multiplication du temps de traitement par `p.tauxVA`. Ce taux est un paramètre de poste chargé depuis la configuration ou saisi dans le modèle. Il n'est pas observé pendant l'exécution. Si la configuration JSON omet le champ, le chargeur lui donne la valeur 1,0.

`tauxValeurAjouteeTrace()` privilégie le taux du poste lorsqu'il est strictement positif. Si aucun taux positif n'est disponible pour une étape instrumentée, la fonction applique les hypothèses suivantes:

* D1.1: 0,70;
* D1.3: 0,80;
* D1.4: 0,75;
* S1.2: 0,60;
* S1.3: 0,65;
* tout code Make: 0,80;
* autre code: 0,60.

Ces valeurs sont des fallbacks codés, pas des observations. Même lorsqu'un taux est configuré par poste, le temps VA qui en résulte demeure une estimation fondée sur ce paramètre.

## Correction minimale recommandée

### Stratégie 1, horloge client réelle et liaison explicite avec l'ordre interne

Cette stratégie est recommandée pour la version destinée à VSM, SCOR et PI. Elle conserve la politique `CMD_*` et `REAPPRO_*`, mais ajoute un lien explicite entre l'ordre interne et les commandes clientes qu'il sert. Un petit registre temporel par commande distingue le traitement, l'attente mesurée, la valeur ajoutée estimée et l'unité.

Les fonctions à modifier sont `planifierAvecEchelle()`, `analyserStockCommandeOrchestree()`, la clôture de `REAPPRO_*` dans `finDeParcours`, `enregistrerFinCommandeGlobale()`, `tempsAttenteGlobalCoherent()`, `dashboardGlobalRows()`, `exporterABoxRuntimeTTL()` et `calculerPIGlobal()`. `CommandeAgent` doit recevoir les champs de liaison et les accumulateurs séparés.

Le Lead Time client devient la durée du chemin critique réellement imputable à la commande, y compris la reconstitution qui conditionne sa livraison. L'attente provient des files et de l'état explicite d'attente de stock. Le PCE utilise une valeur ajoutée estimée par poste divisée par un Lead Time construit dans la même unité. La constante globale de 65 pour cent est supprimée.

Le principal risque est le double comptage lors des réveils répétés ou lorsqu'un ordre de stock sert plusieurs commandes. Une garde par identifiant de liaison et par segment clôturé limite ce risque. Un nouveau run est indispensable. Il faut comparer avant et après les jalons, le Lead Time client, l'attente de stock, les attentes de files, le Process Time, le PCE, `RS.1.1`, `RS.3.94`, le score RS et le PI.

### Stratégie 2, métriques strictement exprimées en temps de simulation

Cette alternative plus légère définit le Lead Time client comme `time() - tCreation` et mesure l'attente de stock entre la première insuffisance et le réveil de la commande, dans la même unité de simulation. `tempsAttenteGlobalCoherent()` est supprimée au profit de l'attente enregistrée. Le PCE global est calculé à partir des observations de `kpiZener`, en conservant la mention de valeur ajoutée estimée.

Les fonctions à modifier sont `analyserStockCommandeOrchestree()`, la branche de réveil de `REAPPRO_*`, `enregistrerFinCommandeGlobale()`, `dashboardGlobalRows()`, `exporterABoxRuntimeTTL()` et `calculerPIGlobal()`. Cette stratégie respecte la séparation entre commandes et ordres internes, mais ses résultats décrivent le calendrier du simulateur, pas un délai métier réel. Les profils de normalisation RS doivent être recalibrés dans cette unité.

Le risque de régression est faible, mais le changement de définition rend les résultats incompatibles avec les anciennes valeurs en secondes reconstruites. Un nouveau run reste nécessaire pour vérifier les égalités d'export et recalculer RS et le PI.
