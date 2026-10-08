# Table de contrôle exhaustive des imports représentés dans F1

Chaque ligne correspond à une déclaration `owl:imports` réelle, lue directement dans le fichier source (`grep` des lignes `owl:imports <...>` sous l'axiome `owl:Ontology` de chaque fichier). La colonne « direction dessinée » décrit le sens effectif de la flèche dans `F1_organisation_generale.svg` (vérifié ligne par ligne dans le SVG, pas seulement par la présence du libellé `owl:imports`). La colonne « conformité » compare les deux.

| # | IRI importeur | IRI importée | Fichier source | Ligne | Direction dessinée dans F1 | Conformité |
|---|---|---|---|---|---|---|
| 1 | `http://www.sconto-vsm.org/core` (v4.3.0) | `http://www.semanticweb.org/indonto/ontologies/2014/0/SCOPRO` | `SCONTO_SVU_Core_v4.3.0.ttl` | 58 | Core → groupe tierce (flèche du bas vers le haut, pointe dans le groupe) | ✅ Conforme |
| 2 | `http://www.sconto-vsm.org/core` (v4.3.0) | `http://www.semanticweb.org/indonto/ontologies/2014/0/SCOME` | `SCONTO_SVU_Core_v4.3.0.ttl` | 59 | Core → groupe tierce (même flèche, libellée « SCOPRO, SCOME, SCOBE ») | ✅ Conforme |
| 3 | `http://www.sconto-vsm.org/core` (v4.3.0) | `http://www.semanticweb.org/indonto/ontologies/2014/0/SCOBE` | `SCONTO_SVU_Core_v4.3.0.ttl` | 60 | Core → groupe tierce (même flèche) | ✅ Conforme |
| 4 | `http://www.sconto-vsm.org/agent-extension` (v1.1.2) | `http://www.sconto-vsm.org/core/4.3.0` | `SCONTO_VSM_Agent_Extension_v1.1.2.ttl` | 16 | Agent Extension → Core (flèche partant d'Agent, pointe vers Core) | ✅ Conforme |
| 5 | `http://www.sconto-vsm.org/aer-extension` (v1.1.2) | `http://www.sconto-vsm.org/core/4.3.0` | `SCONTO_VSM_AER_Extension_v1.1.2.ttl` | 17 | AER Extension → Core (flèche partant d'AER, pointe vers Core) | ✅ Conforme |
| 6 | `http://www.sconto-vsm.org/aer-extension` (v1.1.2) | `http://www.sconto-vsm.org/agent-extension/1.1.2` | `SCONTO_VSM_AER_Extension_v1.1.2.ttl` | 18 | AER Extension → Agent Extension (flèche partant d'AER, pointe vers Agent) | ✅ Conforme |
| 7 | `http://www.sconto-vsm.org/forecast-mts-extension` (v1.0.0) | `http://www.sconto-vsm.org/core/4.1.0` | `sconto-vsm-forecast-mts-extension_1.ttl` | 18 | Forecast/MTS → boîte « Core v4.1.0 » (génération antérieure) | ✅ Conforme |
| 8 | `http://www.sconto-vsm.org/forecast-mts-extension` (v1.0.0) | `http://www.sconto-vsm.org/agent-extension/1.0.0` | `sconto-vsm-forecast-mts-extension_1.ttl` | 19 | Forecast/MTS → boîte « Agent v1.0.0 » (génération antérieure) | ✅ Conforme |
| 9 | `http://www.sconto-vsm.org/forecast-mts-extension` (v1.0.0) | `http://www.sconto-vsm.org/aer-extension/1.0.0` | `sconto-vsm-forecast-mts-extension_1.ttl` | 20 | Forecast/MTS → boîte « AER v1.0.0 » (génération antérieure) | ✅ Conforme |
| 10 | `http://www.sconto-vsm.org/isa95-extension` (v1.0.0) | `http://www.sconto-vsm.org/core/4.1.0` | `sconto-vsm-isa95-extension-v1.0.ttl` | 33 | ISA-95 → boîte « Core v4.1.0 » **uniquement** (aucune flèche vers Agent v1.0.0 ni AER v1.0.0) | ✅ Conforme |
| 11 | `http://www.semanticweb.org/indonto/ontologies/2014/0/SCOME` | `http://www.semanticweb.org/indonto/ontologies/2014/0/SCOPRO` | `SCOME.owl` | 15 | SCOME → SCOPRO (flèche interne au groupe tierce) | ✅ Conforme |
| 12 | `http://www.semanticweb.org/indonto/ontologies/2014/0/SCOBE` | `http://www.semanticweb.org/indonto/ontologies/2014/0/SCOME` | `SCOBE.owl` | 16 | SCOBE → SCOME (flèche interne au groupe tierce) | ✅ Conforme |

**SCOPRO** : aucune ligne `owl:imports` dans `SCOPRO.owl` — c'est la racine de la chaîne tierce, confirmé (`grep "imports" SCOPRO.owl` : aucun résultat). Aucune flèche sortante dessinée depuis SCOPRO dans F1, conforme.

## Erreurs de la version précédente (commit `d76d77413a6cf816e5249eb9e62022e3ab6d83d0`), corrigées ici

| Relation | Direction précédente (erronée) | Direction corrigée |
|---|---|---|
| Core ↔ groupe tierce | Groupe tierce → Core | **Core → groupe tierce** |
| Agent ↔ Core | Core → Agent | **Agent → Core** |
| AER ↔ Core | Core → AER | **AER → Core** |
| AER ↔ Agent | Agent → AER | **AER → Agent** |
| Forecast/MTS, ISA-95 ↔ génération antérieure | Une seule boîte fusionnée « Core v4.1.0 + Agent v1.0.0 + AER v1.0.0 », avec une flèche unique par extension — ISA-95 pointait vers la boîte fusionnée, suggérant visuellement un import des trois alors qu'elle n'importe que Core 4.1.0 | **Trois boîtes séparées** (Core v4.1.0, Agent v1.0.0, AER v1.0.0) ; Forecast/MTS porte trois flèches distinctes (une par cible réelle) ; ISA-95 porte une seule flèche, vers Core v4.1.0 uniquement |

Les flèches SCOBE→SCOME→SCOPRO et Forecast/MTS→(3 cibles)/ISA-95→(1 cible) étaient déjà correctement orientées dans la version précédente et n'ont pas été modifiées dans leur sens, seulement reformatées (séparation des boîtes).

## Méthode de vérification

Chaque IRI de cette table a été relue directement dans les fichiers sources (commande `grep -n` ciblée sur chaque fichier, résultats reproduits ci-dessus avec numéro de ligne). La colonne « direction dessinée » a été établie en relisant chaque élément `<line>`/`<polyline>` du SVG final et en identifiant son point de départ (sans marqueur) et son point d'arrivée (`marker-end`), pas en supposant la direction à partir du sens de lecture du libellé « owl:imports » apposé à côté.
