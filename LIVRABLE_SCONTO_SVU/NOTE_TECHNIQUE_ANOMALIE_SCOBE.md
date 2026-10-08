# Note technique — anomalie `SCORPerformanceEvaluation` / `scobe:Benchmarking_project`

Aucun fichier OWL n'a été modifié pour produire cette note. Toutes les vérifications ont été refaites avec un analyseur RDF/OWL structuré (`rdflib` 7.5.0, parseur Turtle et RDF/XML), en plus de la relecture directe déjà faite dans `ETAPE4_FIGURES_F1_F2_F3.md`.

---

## 1. Analyse technique

### 1.1 Axiome exact, tel que chargé par le parseur

Fichier : `SCONTO_SVU_Core_v4.3.0.ttl`, ligne 910. Chargement avec `rdflib.Graph().parse(..., format="turtle")` (1494 triples chargés) :

```
subClassOf object IRI exact -> http://www.semanticweb.org/indonto/ontologies/2014/0/SCOBE#Benchmarking_project
```

L'IRI complète visée par l'axiome, résolue à partir du préfixe `@prefix scobe: <http://www.semanticweb.org/indonto/ontologies/2014/0/SCOBE#>` déclaré dans le même fichier (ligne 53), est donc :

```
http://www.semanticweb.org/indonto/ontologies/2014/0/SCOBE#Benchmarking_project
```

(`p` minuscule à « project »).

### 1.2 Classes effectivement déclarées dans SCOBE.owl

Chargement de `SCOBE.owl` avec `rdflib.Graph().parse(..., format="xml")` (486 triples chargés). Recherche des deux IRI candidates :

| IRI recherchée | `rdf:type` trouvé | Triples (sujet) | Triples (objet) |
|---|---|---|---|
| `...SCOBE#Benchmarking_Project` (P majuscule) | `owl:Class` | 6 | 7 |
| `...SCOBE#Benchmarking_project` (p minuscule) | **aucun — ressource non typée** | **0** | **0** |

`Benchmarking_Project` (P majuscule) est une classe réelle, pleinement déclarée : elle porte notamment un `owl:equivalentClass` vers une expression de classe anonyme et un `rdfs:subClassOf owl:Thing`. `Benchmarking_project` (p minuscule) **n'existe nulle part** dans le graphe SCOBE — ni comme sujet, ni comme objet d'aucun triple.

### 1.3 Résolution dans le graphe fusionné (Core + SCOBE, tel que chargé ensemble)

```
Triples charges (fusion) : 1980
Cible de rdfs:subClassOf = http://www.semanticweb.org/indonto/ontologies/2014/0/SCOBE#Benchmarking_project
Cette IRI est-elle declaree owl:Class dans le graphe fusionne ? False
```

**Conclusion technique, démontrée par le parseur et non par une simple lecture textuelle** : l'axiome `:SCORPerformanceEvaluation rdfs:subClassOf scobe:Benchmarking_project` crée bel et bien une référence vers une IRI distincte de la classe réellement visée (`scobe:Benchmarking_Project`). Ce n'est pas une similarité trompeuse à l'œil : ce sont, au sens strict du W3C RDF 1.1 (comparaison de caractères, sensible à la casse), deux ressources différentes. La première (minuscule) n'est typée nulle part dans les deux fichiers chargés ; elle n'a donc aucune des propriétés, restrictions ou relations que porte la véritable classe `Benchmarking_Project`.

**Ce que cela ne fait pas** : cela ne rend aucune classe insatisfaisable au sens d'un raisonneur de description logics. En RDFS/OWL, une ressource non typée peut être employée comme objet d'un triple `rdfs:subClassOf` sans qu'aucune règle de syntaxe ou de cohérence ne soit violée ; elle est simplement traitée comme une ressource anonyme sans axiome propre. Un raisonneur comme HermiT ne signale donc rien d'anormal (cohérent avec `C14_RAPPORT_ALIGNEMENT_FINAL.md`, qui rapporte 0 classe insatisfaisable) : l'anomalie est un défaut de **liaison sémantique silencieuse**, pas une inconsistance logique détectable automatiquement par les outils déjà utilisés dans ce projet.

---

## 2. Analyse sémantique

Indépendamment de la question de casse, se pose une question de modélisation : **une évaluation de performance SCOR doit-elle être, conceptuellement, une sous-classe d'un projet de benchmarking ?**

### 2.1 Ce que porte réellement `scobe:Benchmarking_Project`

D'après l'audit initial (rapport de l'agent dédié à SCOPRO/SCOME/SCOBE) et la relecture de `SCOBE.owl` : SCOBE formalise le **benchmarking comparatif** — un `Benchmarking_Project` regroupe des critères d'évaluation (`Group_Evaluation_Criterion`), des groupes de référence (`Reference_Group`), des pratiques de référence (`Reference_Practice`) et des résultats comparatifs (`Group_Evaluation_Result`). C'est un objet organisationnel : *l'exercice de comparaison lui-même*, avec son périmètre, ses participants et sa méthode.

`SCORPerformanceEvaluation`, tel que décrit par son propre `rdfs:comment` dans le Core (« Évaluation globale de performance supply chain [...] Dans le pipeline V4.3, les valeurs réelles des métriques sont d'abord converties en scores 0..10, puis en grades flous [...] puis l'évaluation globale (PI) »), est un **résultat de calcul** : l'indice de performance global (PI) d'une chaîne logistique à un instant donné, obtenu par agrégation de scores de métriques et d'attributs.

### 2.2 Le problème conceptuel, indépendant de la casse

Faire de `SCORPerformanceEvaluation` une **sous-classe** de `Benchmarking_Project` affirme que *toute instance d'évaluation de performance SCOR est un projet de benchmarking*. Or :
- Un `Benchmarking_Project` porte une méthode de comparaison entre entités (le Core lui-même, le groupe de référence, les critères). Une instance de `SCORPerformanceEvaluation` dans le pipeline du Core (Module I, Module N) est produite par agrégation interne de métriques d'une seule chaîne logistique, sans comparaison à un groupe de référence externe.
- Si l'héritage était effectivement résolu (casse correcte), une instance de `SCORPerformanceEvaluation` hériterait implicitement de toute propriété ou restriction portée par `Benchmarking_Project`, ce qui pourrait imposer une structure (rattachement à un groupe de référence, à des critères de benchmarking) non pertinente pour un simple indice de performance calculé en interne.
- L'intention de l'auteur, lisible dans le commentaire (« alignée avec le module SCOBE de benchmarking »), semble être de **situer conceptuellement** l'évaluation de performance dans la famille des mécanismes d'évaluation de SCONTO, pas nécessairement d'affirmer une relation d'héritage stricte.

### 2.3 Alternatives envisageables (à arbitrer par vous, non tranchées ici)

| Option | Description | Avantage | Limite |
|---|---|---|---|
| **A. Conservation motivée de l'héritage** | Corriger uniquement la casse (`Benchmarking_project` → `Benchmarking_Project`) et conserver `rdfs:subClassOf` | Corrige le défaut technique minimal ; cohérent avec l'intention déjà exprimée dans le commentaire | Hérite malgré tout d'une structure de benchmarking (groupes de référence, critères) potentiellement non désirée pour un simple indice calculé |
| **B. Rattachement à une classe de mesure plus pertinente** | `rdfs:subClassOf scome:Performance_Information` ou `scome:SC_Performance_Concept` (classes de mesure de SCOME, déjà utilisées ailleurs dans le Module I) à la place de SCOBE | Cohérent avec le fait que `SCORPerformanceEvaluation` est un résultat de mesure/scoring, pas un dispositif de comparaison | Change la nature de l'ontologie tierce référencée ; nécessite de vérifier l'existence et la pertinence exacte de la classe SCOME visée |
| **C. Relation associative plutôt qu'héritage** | Remplacer `rdfs:subClassOf scobe:Benchmarking_project` par une propriété objet, par exemple `usedInBenchmarkingProject` ou similaire, reliant une évaluation à un projet de benchmarking qui l'utilise | Respecte la distinction sémantique : une évaluation PEUT être utilisée dans un projet de benchmarking sans EN ÊTRE UNE par nature | Nécessite de créer une nouvelle propriété et de documenter son domaine/sa portée |
| **D. Suppression de l'alignement** | Retirer l'axiome, sans le remplacer | Simplicité ; évite d'imposer une relation non démontrée | Perd le lien déjà établi, même informel, avec le module SCOBE de SCONTO — pourrait affaiblir l'argument d'ancrage dans SCONTO existant du chapitre |

**Je ne recommande pas d'option précise** : le choix dépend d'une décision de modélisation (faut-il que l'évaluation de performance SCOR soit intrinsèquement un objet de benchmarking comparatif, ou seulement un résultat de calcul pouvant servir à un tel exercice plus tard ?), qui relève de votre jugement scientifique sur le rôle voulu de `SCORPerformanceEvaluation` dans le cadre SVU. Aucune de ces options n'a été appliquée au fichier `.ttl`.

---

## 3. Traitement dans la figure F3b

La figure F3b (voir `registre_figures.md`) représente désormais cet axiome avec une annotation explicite indiquant qu'il s'agit d'un **point de vigilance non résolu**, et non d'une relation ontologique validée : la flèche `rdfs:subClassOf` vers `scobe:Benchmarking_project` est tracée en pointillés avec un symbole d'avertissement, accompagnée du texte exact de l'axiome et un renvoi à la présente note, plutôt que représentée comme n'importe quelle autre spécialisation de la figure.
