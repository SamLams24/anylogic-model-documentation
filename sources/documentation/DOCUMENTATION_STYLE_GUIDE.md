# Guide éditorial de la documentation SCONTO-SVU

## Finalité

La documentation explique le fonctionnement du simulateur à quatre publics : responsables académiques, responsables de projet, personnes chargées d'une démonstration et développeurs. Le corps principal privilégie les trois premiers. Les signatures, noms de classes et détails Java sont réservés aux annexes techniques.

## Organisation d'un chapitre

Chaque chapitre répond à une question concrète. Il commence par le fonctionnement utile, puis expose les conditions, les effets et les limites. Les références normatives viennent après le cycle métier principal. Une conclusion n'est ajoutée que si elle interprète réellement ce qui précède.

Les chapitres utilisateur suivent, lorsque cela s'applique, cette progression : objectif de la vue, moment d'utilisation, zones principales, réglages, commandes, résultat attendu, précaution et exemple court.

## Vocabulaire du corps utilisateur

Employer « champ d'entrée », « bouton », « liste de sélection », « case à cocher », « fenêtre », « tableau », « zone d'information », « indicateur » et « vue ». Les termes `JTextField`, `JButton`, `JComboBox`, `JCheckBox`, `Swing`, `getter`, `setter`, `listener`, `onclick`, `binding`, `widget` et « instance Java » sont exclus des chapitres 11 à 17. Ils sont permis dans les annexes techniques lorsqu'ils sont nécessaires à la maintenance.

Les noms métier stables restent inchangés : `Source`, `Make`, `Deliver`, `Return`, `AER`, `VSM`, `SCOR`, `PI`, `CMD_*` et `REAPPRO_*`. Une commande cliente externe est toujours distinguée d'un ordre interne de reconstitution de stock.

## Style rédactionnel

Écrire en français technique naturel, avec des paragraphes de longueur variable. Commencer directement par l'information utile. Éviter les annonces de plan, les conclusions automatiques, les séries de phrases parallèles et les listes qui remplacent une explication.

Les motifs suivants sont à supprimer ou à reformuler : « cette section présente », « dans cette section, nous allons », « il convient de noter », « il est important de souligner », « on peut constater que », « cette approche permet » et toute mention du processus de rédaction.

Le caractère U+2014 et les constructions LaTeX de tiret long sont interdits. Les mots composés légitimes conservent un trait d'union simple.

## Faits, exemples et limites

Un fait implémenté se décrit au présent. Un résultat chiffré n'est donné que s'il provient d'un run identifié. Un exemple pédagogique inventé doit être signalé comme exemple et ne doit pas imiter un résultat observé. Une limite de preuve est formulée en une phrase simple.

Les tableaux comparent des éléments homogènes. La prose explique ce que la comparaison permet de comprendre, sans répéter toutes les cellules. Les listes restent courtes.

## Illustrations

Chaque concept structurant reçoit une illustration si elle réduit l'effort de compréhension. Les diagrammes d'activité expliquent les décisions et les workflows. Les diagrammes de séquence expliquent les échanges entre acteurs ou agents. Les diagrammes de classes sont réservés aux structures dont les relations sont utiles au lecteur technique.

Une figure générée est reproductible. Une capture montre l'interface réelle. Un zoom annoté utilise peu de repères et une légende précise. Une capture manquante reste un placeholder nommé, sans image reconstituée.

Chaque légende répond à deux questions : ce que montre la figure et pourquoi elle est utile. Les noms de fonctions Java sont absents des schémas destinés aux utilisateurs.

## Encadrés pédagogiques

Quatre encadrés sobres sont disponibles : `BonASavoir`, `AttentionDoc`, `ExempleDoc` et `EnPratique`. Ils ne remplacent pas le texte principal et ne sont employés que pour une précaution, une convention ou une procédure courte.

## Notes internes

Les fichiers de chapitre peuvent contenir `\DocumentationNote{...}` pendant la phase de fondation. La macro est masquée lorsque le mode brouillon est désactivé. Aucune note de pilotage, aucun `TODO` et aucun placeholder non autorisé ne doit rester dans une version déclarée finale.

