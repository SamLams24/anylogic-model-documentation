# Étape 7 — Préparation de la refonte ontologique du chapitre 4

Rapport court et ciblé, conformément à la consigne : pas de réécriture, pas de nouveaux diagrammes, pas de modification d'ontologie à ce stade. Lecture intégrale du chapitre 4 effectuée sur `SOURCES_MANUSCRIT/Manuscrit_ANAKPA_version_metadonnees_corrigees.pdf` (pages imprimées 145-164, pages PDF 169-188, vérifié par relecture directe du texte extrait, pas seulement les métadonnées). Vérification structurelle des extensions Agent 1.1.2 et AER 1.1.2 par `rdflib` directement sur les fichiers `.ttl` (dossier `evolution_project/SCONTO_SVU_C14_3_COLLEAGUE_VALIDATED_JSON_INTEGRATION_TEST_PACKAGE/`). Aucune ontologie modifiée.

## 1. Structure actuelle du chapitre 4

| Section | Contenu | Appréciation |
|---|---|---|
| 4.1 Introduction | Présente les trois composantes (ISA-95, Agent, AER) et annonce le plan | Solide, pas de répétition à corriger ici |
| 4.2 Fondements des SMA et architectures holoniques (4.2.1-4.2.4) | Notions générales d'agent, caractéristiques, comparatif des cinq architectures (centralisée, hiérarchique, hétérarchique, holonique, hybride), choix justifié de l'architecture holonique hybride | Développement méthodologique, bien structuré, citations correctement utilisées ; ne nécessite pas de refonte |
| 4.3 Démarche de conception (4.3.1-4.3.3) | Principes de conception, critères d'agentification (formule 4.1), Tableau 4.1 (critères), Tableau 4.2 (dimensions de spécification, incluant déjà une ligne « Positionnement ISA-95 ») | Méthodologique, cohérent ; prépare les sections ontologiques suivantes |
| 4.4 Architecture conceptuelle multi-agents (4.4.1-4.4.4) | **4.4.1 est un intitulé vide** : « Vue d'ensemble de l'architecture » n'est suivi d'aucun texte avant 4.4.2. 4.4.2 : trois familles d'agents de pilotage + Tableau 4.3 (synthèse) + Tableau 4.5 (chaîne fonctionnelle, avec une colonne ISA-95). 4.4.3 : agents Machine/Produit/Commande. 4.4.4 : agent Blackboard. Tableau 4.7 (agents transversaux, avec une colonne ISA-95) | **Problème structurel identifié** : sous-section vide (4.4.1) ; le positionnement ISA-95 est répété sous forme de prose en 4.1, puis en tableau en 4.3.3, puis en prose et en tableau en 4.4.2 et 4.4.3/4.4.4 — une consolidation est possible sans perte d'information |
| 4.5 Formalisation ontologique de l'extension Agent | Décrit en **prose continue, sans tableau ni figure**, la classe racine, ses spécialisations, les rôles, les états, les cinq objets d'activité, les propriétés et les restrictions | **C'est la section la plus directement ontologique du chapitre et la moins outillée visuellement** : aucune figure, aucun tableau de classes/propriétés, alors que la section équivalente du chapitre 3 (nouvelle section 3.5) s'appuie sur sept figures et cinq tableaux |
| 4.6 Communication inter-agents (AER) | Même format que 4.5 : prose continue décrivant la classe racine, les trois phases, les classes de message, les statuts, les priorités, les restrictions | Même observation : dense, bien écrite, mais sans support visuel ni tabulaire |
| 4.7 Synthèse | Reprend methodiquement les apports du chapitre, transition vers le chapitre 5 | Correct, pas de problème identifié |

**Diagnostic global** : contrairement à l'ancienne section 3.5 (qui souffrait d'une duplication de contenu sur onze modules), le chapitre 4 ne présente pas de duplication massive de texte. Son problème principal est différent : **les deux sections les plus ontologiques (4.5 et 4.6) sont rédigées en paragraphes continus denses, sans aucune figure ni tableau**, ce qui est précisément ce que la demande de cette étape vise à corriger. La sous-section 4.4.1 vide est un défaut mineur et ponctuel (probablement un oubli de rédaction ou une sous-section fusionnée par erreur avec 4.4.2).

## 2. Concepts fondamentaux des extensions Agent et AER (vérifiés)

### Extension Agent 1.1.2

La hiérarchie réellement déclarée diffère de la description du texte sur un point important (détaillé en §4). Vérifiée :

- Racine : `HolonAgent` (sous-classe d'`AgentExtensionEntity`).
- Cinq spécialisations **directes** de `HolonAgent` : `StrategicAgent`, `TacticalAgent`, `CoordinatorAgent`, `OperationalAgent`, `BlackboardAgent`.
- `OperationalAgent` se spécialise à son tour en `OperationalPilotAgent` et `OperationalExecutionAgent` (hiérarchie à deux niveaux, pas plate).
- `MachineAgent` est une sous-classe d'`OperationalExecutionAgent` (pas un enfant direct de `HolonAgent`).
- `AgentRole` (7 spécialisations vérifiées : `ObservationRole`, `DecisionRole`, `CoordinationRole`, `ExecutionRole`, `MonitoringRole`, `AggregationRole`, `ReportingRole`).
- `AgentState` (7 spécialisations vérifiées, correspondant exactement aux sept états cités par le texte : `IdleState`, `ActiveState`, `WaitingState`, `DecisionState`, `CoordinationState`, `FailureState`, `MaintenanceState`).
- Cinq classes d'interaction, sous-classes d'`AgentInteraction` : `AgentObservation`, `AgentDecision`, `AgentCoordination`, `AgentExecutionTrace`, plus `AgentPerformanceRecord` (sous-classe directe d'`AgentExtensionEntity`, pas d'`AgentInteraction`).
- Positionnement ISA-95 : propriété de données simple `hasISA95Level` (entier), déclarée directement sur `HolonAgent`. Il n'y a pas de classe ni de restriction OWL dédiée au positionnement ISA-95 dans l'extension Agent.

### Extension AER 1.1.2

- Racine : `AERMessage` (sous-classe à la fois d'`AERExtensionEntity` et d'`AgentInteraction` — un double rattachement qui relie explicitement AER à l'extension Agent).
- Trois spécialisations : `AmendmentMessage`, `ExecutionMessage`, `ReportingMessage`.
- Sous-classes nommées vérifiées : `WorkOrderMessage` (sous `AmendmentMessage`), `ExecutionFailureMessage` (sous `ExecutionMessage`), `IndicatorReport` et `MetricReport` (sous `ReportingMessage`).
- `AERConversation`, `AERCorrelation`, `AERAcknowledgement`, `AERResponse` : quatre classes de traçabilité des échanges.
- Statuts, priorités et types de message sont représentés par des **classes avec individus nommés**, et non par de simples valeurs textuelles : `AERMessageStatus` porte sept individus (`MessageStatus_Created`, `_Sent`, `_Received`, `_Acknowledged`, `_Processed`, `_Failed`, `_Cancelled`), `AERMessagePriority` porte quatre individus (`Priority_Low`, `_Normal`, `_High`, `_Critical`), `AERMessageType` porte cinq individus. Le texte du manuscrit nomme ces valeurs sans préciser qu'il s'agit d'individus typés plutôt que de littéraux — une précision utile pour la refonte, dans l'esprit de ce qui a été fait pour `AggregationScope` en section 3.5.

### Extension ISA-95 1.0.0 — portée réelle différente de celle décrite en chapitre 4

Point de clarification important pour la refonte : l'extension ISA-95 (fichier séparé, importe Core **4.1.0**, génération non revalidée) **ne formalise pas le positionnement des agents**. Elle aligne les classes d'équipement du Core (`EquipmentElement`, `InformationSystem`, `StorageEntity` et leurs spécialisations) sur la hiérarchie ISA-95 des niveaux d'équipement (`EnterpriseLevel`, `SiteLevel`, `AreaLevel`, `WorkCenterLevel`, `WorkUnitLevel`, `EquipmentModuleLevel`, `ControlModuleLevel`) via des classes `ISA95Aligned*` et `*Role`. Le positionnement ISA-95 des **agents**, décrit en détail dans le texte du chapitre 4 (niveau 4 pour les agents stratégiques et tactiques, interface 4-3 pour les coordinateurs, niveau 3 pour les superviseurs, niveaux 3 ou 2 pour l'exécution), repose uniquement sur la propriété `hasISA95Level` de l'extension Agent elle-même, **indépendante du fichier ISA-95 Extension**. Ce sont deux mécanismes d'alignement ISA-95 distincts, l'un pour les équipements (fichier séparé, génération antérieure), l'autre pour les agents (intégré à l'extension Agent, ligne courante). Le texte actuel du chapitre 4 ne fait pas explicitement cette distinction ; une clarification améliorerait la rigueur sans nécessiter de réécriture lourde.

## 3. Propriétés et contraintes importantes (vérifiées)

- **27 restrictions dans Agent 1.1.2** (23 `someValuesFrom`, 4 `allValuesFrom`, 0 cardinalité numérique) : chiffre confirmé, cohérent avec les audits précédents.
- **11 restrictions dans AER 1.1.2** (11 `someValuesFrom`, 0 `allValuesFrom`, 0 cardinalité numérique) : chiffre non documenté dans les étapes précédentes, établi à cette étape.
- Quatre paires `owl:inverseOf` vérifiées, dont `isSupervisedByAgent` / `supervisesAgent` (non mentionnée dans le texte du chapitre 4, qui ne cite que le sens descendant).
- Propriétés de pont vers le noyau Core, toutes vérifiées : `representsActor`, `representsEquipment`, `representsMachine`, `observesEvent`, `observesIndicator`, `observesContext`, `observesEquipment`, `observesStorage`, `executesMicroActivity`, `computesSCORMetric` (portée réelle : union de `SCORMetric`/`SCORCompositeMetric`/`SCORMetricN1`/`N2`/`N3`, cohérente avec la chaîne de valeur de la section 3.5), `computesVSMIndicator`, `contributesToPerformanceAttribute`.
- Les restrictions citées en prose par le texte sont correctement formulées et vérifiables telles quelles : « tout `MachineAgent` doit représenter une machine », « toute `AgentObservation` doit être attribuée à un agent », « toute `AgentDecision` doit avoir un agent décideur », « toute `AgentExecutionTrace` doit concerner une micro-activité » correspondent chacune à une restriction `someValuesFrom` réelle.
- Côté AER, les restrictions citées (« tout `AERMessage` doit posséder au moins un expéditeur, un destinataire et un statut », etc.) sont également conformes aux 11 restrictions vérifiées.

## 4. Écarts vérifiés entre le texte et les artefacts OWL

| # | Affirmation du texte (§4.4-4.5) | Fait vérifié | Gravité |
|---|---|---|---|
| 1 | « …spécialisée en StrategicAgent, TacticalAgent, CoordinatorAgent, **SupervisorAgent**, **ExecutionAgent**, MachineAgent, **ProductAgent**, **OrderAgent** et BlackboardAgent » (9 classes) | `HolonAgent` n'a que **5 sous-classes directes** (`StrategicAgent`, `TacticalAgent`, `CoordinatorAgent`, `OperationalAgent`, `BlackboardAgent`). `SupervisorAgent` existe mais porte `owl:deprecated true` et `owl:equivalentClass OperationalPilotAgent` (alias historique v1.0, à ne plus utiliser). `ExecutionAgent` n'existe sous aucun nom ; la classe réelle est `OperationalExecutionAgent`, elle-même sous `OperationalAgent`, pas sous `HolonAgent` directement. **`ProductAgent` et `OrderAgent` n'existent nulle part dans le fichier**, bien que les §4.3 (critère d'agentification), §4.4.2 (tableaux), §4.4.3 (sous-section dédiée) et §4.5 en parlent comme d'agents pleinement formalisés. | **Majeur** — c'est l'écart le plus important relevé dans ce chapitre |
| 2 | §4.4.3 présente l'agent Produit et l'agent Commande au même niveau de détail que l'agent Machine, avec des responsabilités, des propriétés observées et des résultats produits | Aucune classe, aucune propriété (`representsProduct`, `representsOrder` ou équivalent) ne les formalise dans l'extension Agent | **Majeur**, conséquence directe du point 1 |
| 3 | Les statuts et priorités AER sont cités comme des valeurs (Created, Sent… ; faible, normale, élevée, critique) sans préciser leur nature ontologique | Ce sont des individus nommés de classes dédiées (`MessageStatus_Created` de type `AERMessageStatus`, `Priority_Low` de type `AERMessagePriority`), pas des littéraux | Mineur — précision à apporter, pas une erreur |
| 4 | Le texte ne mentionne que les relations descendantes `supervisesAgent`, `delegatesToAgent`, `reportsToAgent`, `coordinatesAgent` | `isSupervisedByAgent` (inverse déclaré de `supervisesAgent`) existe aussi et n'est pas cité | Mineur, complétude seulement |
| 5 | Le positionnement ISA-95 des agents est décrit comme un principe transversal sans préciser son mécanisme OWL | Mécanisme réel : une unique propriété de données `hasISA95Level` (entier) sur `HolonAgent`, indépendante du fichier ISA-95 Extension (qui concerne les équipements, génération Core 4.1.0 non revalidée) | Mineur à moyen — clarification utile, pas une erreur factuelle |
| 6 | 4.4.1 « Vue d'ensemble de l'architecture » | Sous-section sans contenu | Défaut rédactionnel, sans rapport avec l'ontologie |

Aucun de ces écarts ne remet en cause la cohérence d'ensemble de l'architecture décrite ; le point 1/2 (agents Produit et Commande non formalisés) est cependant substantiel et devra être traité explicitement dans la refonte : soit en nuançant le texte pour présenter ces deux agents comme une extension conceptuelle non encore formalisée dans l'extension Agent 1.1.2, soit en signalant le manque comme une limite assumée — sans inventer les classes manquantes.

## 5. Figures existantes réutilisables et figures à créer

Les trois diagrammes `.drawio` ont été ouverts et comparés aux vérifications ci-dessus (pas seulement visualisés) :

| Diagramme | Version indiquée | Constat |
|---|---|---|
| `02_AGENT.drawio` | Agent v1.1.1, importe Core v4.2.1 | **Globalement déjà aligné sur la réalité vérifiée** : montre `OperationalPilotAgent` (pas `SupervisorAgent`), `OperationalAgent` marqué «generic», `MachineAgent` positionné sous la branche opérationnelle. Ne montre ni `ProductAgent` ni `OrderAgent` — cohérent avec leur absence réelle. Antérieur d'un correctif de version (1.1.1 → 1.1.2) à revalider classe par classe avant réutilisation, mais constitue une bien meilleure base que le texte actuel du manuscrit |
| `03_AER.drawio` | Référence Agent v1.1 et Core v4.2 | Représente la typologie des messages, les individus de statut/type, et au moins deux restrictions OWL exactes (`MetricReport ⊑ ∃concernsSCORMetric.SCORMetric`, `IndicatorReport ⊑ ∃concernsVSMIndicator.VSMIndicator`) conformes aux vérifications. Base réutilisable, à revalider sur la version 1.1.2 |
| `06_ISA95.drawio` | ISA-95 v1.0, importe Core v4.1 | Représente correctement l'alignement **équipement** (pas agent) : niveaux Enterprise/Site/Area/WorkCenter/WorkUnit/EquipmentModule/ControlModule. Utile pour illustrer l'extension ISA-95 elle-même si le chapitre 5 ou une annexe la détaille, mais **ne doit pas être présenté comme illustrant le positionnement ISA-95 des agents** (mécanisme différent, voir §2) |

**Figures à créer pour la refonte** (aucune ne doit être produite à cette étape, sur accord préalable seulement) :

1. Une figure de taxonomie des agents conforme à la hiérarchie réelle (5 branches directes, `OperationalAgent` à deux niveaux), avec un traitement explicite du statut de `SupervisorAgent` (obsolète) et une note sur `ProductAgent`/`OrderAgent` (non formalisés).
2. Une figure des rôles et états (`AgentRole`, `AgentState`), plus légère, pouvant être fusionnée à la précédente ou tenue séparée selon la densité obtenue.
3. Une figure des objets d'activité et de leurs restrictions (`AgentObservation`, `AgentDecision`, `AgentCoordination`, `AgentExecutionTrace`, `AgentPerformanceRecord`), avec les quatre restrictions citées en prose par le texte.
4. Une figure de la typologie des messages AER (`AERMessage` → trois phases → sous-classes nommées), analogue à `03_AER.drawio` mais revalidée sur 1.1.2.
5. Une figure du cycle de traçabilité AER (`AERConversation`/`AERCorrelation`/`AERAcknowledgement`/`AERResponse`, statuts, priorités).
6. Un schéma conceptuel clarifiant la distinction entre les deux mécanismes ISA-95 (agents vs équipement) — un ajout nouveau, absent des diagrammes existants, qui répondrait directement à l'écart n°5 du tableau précédent.

## 6. Matrice des figures proposées (emplacement scientifique)

| Figure (identifiant de travail) | Section d'accueil | Contenu | Base de départ |
|---|---|---|---|
| F4a | 4.5 (ouverture) | Taxonomie `HolonAgent` réelle (5 branches, `OperationalAgent` à deux niveaux) | `02_AGENT.drawio`, à corriger/revalider |
| F4b | 4.5 | `AgentRole` et `AgentState` | `02_AGENT.drawio` (packages C et suivants, à vérifier) |
| F4c | 4.5 (clôture) | Objets d'activité et restrictions associées | Nouveau, inspiré de la structure de F3c (section 3.5) |
| F4d | 4.6 (ouverture) | Typologie `AERMessage` | `03_AER.drawio`, à revalider |
| F4e | 4.6 | Cycle conversation/corrélation/accusé/réponse, statuts et priorités | `03_AER.drawio`, à compléter |
| F4f | 4.1 ou 4.4 (selon la refonte retenue) | Les deux mécanismes ISA-95 (agents vs équipement) et leur périmètre respectif | Nouveau, aucune base existante |

Six figures proposées, du même ordre de grandeur que les sept figures de la section 3.5 ; à ajuster après examen par l'encadrement avant toute production.

## 7. Plan de refonte rédactionnelle proportionné

Conformément à l'instruction, l'objectif n'est **pas** une réécriture intégrale. Les sections 4.1 à 4.3 (méthodologiques) ne nécessitent pas de refonte. Le travail à prévoir, par ordre de priorité :

1. **Combler la sous-section 4.4.1 vide** — vérifier s'il s'agit d'un oubli ponctuel ou d'une fusion à faire avec 4.4.2.
2. **Corriger la taxonomie des agents en 4.4.2/4.4.3/4.5** : remplacer `SupervisorAgent` par `OperationalPilotAgent` (en signalant l'alias historique si pertinent pour le lecteur), clarifier le statut d'`ExecutionAgent`/`OperationalExecutionAgent`, et traiter explicitement l'écart `ProductAgent`/`OrderAgent` plutôt que de le laisser implicite.
3. **Restructurer 4.5 et 4.6** autour des figures proposées en §6, en répartissant le texte actuellement continu en paragraphes plus courts accompagnant chaque figure et tableau, à l'image de la méthode appliquée en section 3.5 — sans perdre les restrictions OWL déjà correctement formulées en prose, qu'il s'agit surtout de mettre en regard d'un support visuel.
4. **Ajouter la clarification sur les deux mécanismes ISA-95** (agents vs équipement), qui n'existe actuellement nulle part dans le texte.
5. **Consolider les mentions ISA-95 dispersées** (4.1, 4.3.3, 4.4.2, 4.4.3) en un renvoi cohérent plutôt qu'une répétition à quatre endroits, sans supprimer d'information.

Ce plan est volontairement proportionné : les sections 4.2, 4.3 et 4.7 restent en l'état, et seules 4.4.1 (défaut ponctuel), 4.4.2-4.4.3 (taxonomie à corriger) et 4.5-4.6 (à illustrer) sont concernées.

---

**Ontologies utilisées** (non modifiées) : `SCONTO_SVU_Core_v4.3.0.ttl`, `SCONTO_VSM_Agent_Extension_v1.1.2.ttl`, `SCONTO_VSM_AER_Extension_v1.1.2.ttl` (dossier `evolution_project/SCONTO_SVU_C14_3_COLLEAGUE_VALIDATED_JSON_INTEGRATION_TEST_PACKAGE/`), `sconto-vsm-isa95-extension-v1.0.ttl` (dossier `docs_new/`, confirmée identique à l'exemplaire à la racine de `Downloads` par `diff`). AHP non mobilisé. Aucune modification apportée à ces fichiers. Rédaction de la refonte non commencée, en attente de validation de cette proposition.
