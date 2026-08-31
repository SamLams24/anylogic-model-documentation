# PROJECT_BRIEF.md

## Objet
Finaliser sous LaTeX un document professionnel consacré à la traçabilité décisionnelle et à la performance du modèle SCONTO-SVU appliqué à ZENER SA Togo.

Le rapport doit relier, de manière vérifiable :

- les conditions initiales de la simulation ;
- les flux physiques et informationnels ;
- les agents et niveaux hiérarchiques ;
- la chronologie Source, Make et Deliver ;
- les communications AER et la boucle d'adaptation ;
- les observations VSM ;
- les métriques SCOR ;
- les attributs RL, RS, AG, CO et AM ;
- le Performance Index ;
- les scénarios de validation expérimentale.

## État de la base documentaire
Le document source est riche mais trop long et parfois répétitif. Il contient dix-huit chapitres et plusieurs annexes. La trace détaillée agent par agent occupe une part importante du corps principal alors qu'elle relève davantage d'une preuve technique détaillée.

Le document final doit conserver la matière utile tout en réduisant les répétitions entre chronologie, discussion académique, synthèse et fiches agents.

## Orientation éditoriale
Le corps principal doit privilégier l'argumentation et la lecture causale. Les preuves exhaustives sont déplacées en annexe.

Le lecteur doit pouvoir répondre rapidement aux questions suivantes :

1. Quelle situation est simulée ?
2. Quels acteurs et agents interviennent réellement ?
3. Comment la décision descend-elle vers l'exécution et comment la preuve remonte-t-elle ?
4. Comment Source, Make et Deliver s'enchaînent-ils ?
5. Comment le système réagit-il aux écarts ou perturbations ?
6. Quels résultats VSM sont observés et où se trouvent les contraintes ?
7. Comment ces observations deviennent-elles des métriques SCOR puis un PI ?
8. Qu'est-ce que les scénarios de validation démontrent réellement ?
9. Quelles limites empêchent une généralisation abusive ?

## Résultat attendu
Un document final propre, cohérent, de longueur maîtrisée, avec une hiérarchie claire, des tableaux lisibles, peu de captures mais des captures probantes, et des annexes techniques suffisamment complètes pour assurer l'auditabilité.


## Couverture fonctionnelle du modèle consolidé
Le document final doit également refléter les enrichissements fonctionnels du modèle consolidé. Ils sont recensés dans `MODEL_EVOLUTION.md`. Cela inclut notamment la politique autonome de stock, les ordres internes de reconstitution, le pilotage matière, les perturbations fournisseur et de demande, les mesures VSM complémentaires, les corrections de comptage client, les mécanismes qualité, la gestion des pannes et goulots, la boucle holonique AER et les exports synchronisés.

Ces éléments ne doivent pas être ajoutés sous forme de catalogue. Ils doivent enrichir les chapitres où ils expliquent un mécanisme, un scénario ou une mesure. Toute capacité non démontrée par un run final doit être présentée comme fonctionnalité disponible et non comme résultat validé.
