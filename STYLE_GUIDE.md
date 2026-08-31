# STYLE_GUIDE.md

## Principes généraux
La rédaction doit ressembler à celle d'un ingénieur ou chercheur qui connaît le modèle et explique ce qu'il a observé. Elle ne doit pas ressembler à un texte générique produit par remplissage de rubriques.

### 1. Précision avant sophistication
Utiliser le terme exact plutôt qu'un synonyme recherché. Une phrase simple et exacte est préférable à une phrase longue qui multiplie les abstractions.

Exemple préférable :

> À T=60 s, la réception du GPL lève la contrainte matière. AT-sP2 transmet alors `MaterialAvailable` à AT-sP3, qui autorise la planification de Make.

Éviter :

> Cette séquence particulièrement significative met ainsi en évidence la manière dont le système parvient, de façon dynamique, à assurer une coordination optimale entre les différents niveaux.

### 2. Verbes forts et sujets identifiables
Lorsque le responsable d'une action est connu, le nommer. Préférer `AT-sP3 déclenche`, `Source reçoit`, `le poste attend` à des tournures nominales telles que `le déclenchement de`, `la réalisation de`, `la mise en oeuvre de` lorsque le verbe suffit.

### 3. Variation syntaxique utile
Alterner naturellement phrases courtes et phrases développées. Une suite de phrases de longueur et de structure identiques donne un rythme mécanique. Une phrase courte peut porter un résultat important. Une phrase plus longue peut expliquer une relation causale.

### 4. Paragraphes analytiques
Un bon paragraphe technique suit généralement cette logique, sans la rendre visible comme un gabarit :

- fait ou résultat principal ;
- élément de preuve utile ;
- interprétation ;
- portée ou limite si nécessaire.

Ne pas répéter exactement cette structure dans tous les paragraphes.

### 5. Sobriété
Supprimer les expressions de remplissage :

- `il convient de noter que` ;
- `il est important de souligner que` ;
- `force est de constater que` ;
- `dans le cadre de cette section` ;
- `comme nous pouvons le voir` ;
- `de manière générale` lorsque l'expression n'ajoute rien ;
- `en effet` répété à chaque paragraphe ;
- `ainsi` utilisé comme transition automatique.

### 6. Cohérence terminologique
Ne pas varier artificiellement les noms d'objets techniques. `Agent tactique Make`, `AT-sP3`, `Make`, `Source`, `Deliver`, `AER`, `VSM`, `SCOR`, `PI` doivent conserver leur sens précis.

### 7. Tables et texte
Un tableau présente les données. Le paragraphe adjacent explique l'écart, la causalité, le point critique ou la conséquence. Il ne récite pas les cellules dans le même ordre.

### 8. Captures
Limiter les captures à celles qui apportent une preuve que le texte ou un tableau ne suffit pas à établir. Les exports Excel et ABox complets restent en annexe ou comme fichiers de preuve.

### 9. Ponctuation
Le caractère de tiret long est interdit. Les parenthèses doivent rester courtes. Éviter l'empilement de deux-points dans une même phrase. Utiliser les points et points-virgules pour séparer clairement les idées.

### 10. Ton académique
Ne pas dramatiser un résultat. Éviter `preuve définitive`, `parfaitement`, `totalement`, `remarquable`, `incontestable`, sauf si le terme est techniquement démontré et nécessaire. Préférer `le run montre`, `l'export confirme`, `la mesure indique`, `la comparaison suggère`.

## Révision finale
Pour chaque page, vérifier :

- une idée centrale identifiable ;
- aucune phrase manifestement générique ;
- aucune répétition de la phrase précédente sous une autre forme ;
- aucun tableau sans interprétation ;
- aucune interprétation sans source ;
- aucune conclusion plus forte que les données.
