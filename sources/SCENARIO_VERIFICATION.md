# Vérification du scénario fournisseur

## Identification

| Champ | Valeur vérifiée |
|:--|:--|
| Fichier | `sources/model/scenario_ZENER_RETARD_FOURNISSEUR.json` |
| Nature | Configuration JSON, schéma 2.1 |
| SHA-256 | `777BEF3257331C710929F9FE4F5A10D09EA1D872695B46E88B1C660C13828402` |
| Entreprise focale | ZENER SA Togo |
| runId | ABSENT DU JSON |
| Profil annoncé | `RETARD_FOURNISSEUR_RUN_A_B_V2` |
| Finalité annoncée | `RUN_A_B_RETARD_FOURNISSEUR_FINAL` |
| Chapitres autorisés | 2, 3, 4, 5, 7, 8 et annexes, pour les paramètres effectivement présents |

## Paramètres lus

| Groupe | Chemin JSON | Valeur vérifiée | Interprétation autorisée |
|:--|:--|:--|:--|
| Structure | `meta.nbActeurs`, `meta.nbPostes`, `meta.nbScenarios` | 5 acteurs, 71 postes, 5 scénarios | Dimension de la configuration, pas participation à un run |
| ISA-95 | `meta.nbISA95Nodes`, `meta.nbISA95Assignments` | 190 noeuds, 71 affectations | Baseline déclarée dans la configuration |
| Entreprise focale | `acteurs[3]` | `ACT_4`, ZENER SA Togo, `ENTREPRISE_FOCALE` | Périmètre focal |
| Fournisseurs | `acteurs[0..2]` | `ACT_1` GPL, `ACT_2` bouteilles vides, `ACT_3` accessoires | Acteurs configurés |
| Client | `acteurs[4]` | `ACT_5`, CLIENT GENERIQUE | Client configuré |
| Scénarios | `scenarios[*].typeProduit` | `SCENARIO DISTRIBUTION`; `SCENARIO DELIVER RETURN CLIENT`; trois cas ZENER | Capacités configurées, une seule est exécutée dans le Run B |
| Produit du test | `meta.nominalScenarioForced` | `SCENARIO DISTRIBUTION` | Référence nominale forcée après chargement |
| Nomenclature | `scenarios[0].nomenclature` | GPL vrac 12,5; bouteille vide 12 kg 1; accessoires 1 par unité | Besoins unitaires du produit nominal |
| Stock produit fini initial | `parametresGlobaux.champStockInitialProduitFini` | 0 unité | Condition initiale configurée |
| Stock matière global initial | `parametresGlobaux.champStockInitialMatiereGlobal` | 0 unité | Valeur globale, remplacée par les fiches détaillées lorsque celles-ci sont chargées |
| GPL vrac | `fichesMatiere[0]` | stock 0, sécurité 0, délai 6 h, fournisseur `ACT_1` | Paramètres matière du GPL |
| Bouteilles vides | `fichesMatiere[1]` | stock 250, sécurité 0, délai 10 h, fournisseur `ACT_2` | Paramètres matière des bouteilles |
| Accessoires | `fichesMatiere[2]` | stock 300, sécurité 0, délai 5 h, fournisseur `ACT_3` | Paramètres matière des accessoires |
| Politique fournisseurs | `acteurs[0..2]` | `PERIODIQUE`, intervalle 3 600, quantité 200, MRP actif | Paramètres généraux des acteurs fournisseurs |
| Commande de validation | `meta.validationNotes` | une commande fixe de 20 annoncée | Note de profil, pas champ runtime autonome |
| Retard de validation | `meta.validationNotes` | Run A sans retard; Run B GPL multiplié par 2 pour une réception | Note de profil, pas paramètre runtime structuré |
| Echelle temporelle | Aucun champ correspondant | ABSENTE DU JSON | La valeur 600 s réelles pour 1 s de simulation est implémentée dans l'ALP, pas prouvée par ce JSON |
| Paramètres runtime du retard | Aucun champ `retardFournisseurTestActif`, facteur ou réception unique | ABSENTS DU JSON | Le Run B prouve leur activation par ses exports, mais le JSON seul ne permet pas de rejouer exactement le test |

## Portée

Le fichier est une preuve primaire de configuration pour les acteurs, scénarios, nomenclatures, stocks et délais nominaux. Il reçoit le statut `IMPLEMENTE` pour ces éléments. Il ne contient ni `runId` ni paramètres runtime structurés du retard et ne suffit donc pas à identifier une exécution.
