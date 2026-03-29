# <div class="icon" style="mask-image: url(./medias/icons/devine-nombre-icon.svg)"></div> Projet 1 - Devine le nombre

Dans cet atelier, on va **installer [Godot](#godot/godot.md)**, appréhender son **interface**, puis créer notre **premier projet**.<br>

<br>

Pour apprendre les bases de [Godot](#godot/godot.md) et de la programmation on va commencer par faire un jeu **type devine le nombre**.

> Le jeu génère un nombre aléatoire. Le joueur doit deviner ce nombre avec comme indice: "plus grand" ou "plus petit".

## Jeu

<iframe-player title="Devine le nombre" style="display: block; width: auto; height: 250px" class="game" src="./game-builds/devine-le-nombre/index.html"></iframe-player>

## I. Télécharger Godot

Rendez vous sur ce lien: <a href="https://godotengine.org/download/windows/" class="external-link">godotengine.org/download/windows</a>, puis téléchargez la version ***Godot Engine*** et non *Godot Engine - .NET*.

> <span style="font-size: 0.8em">Il est techniquement tout à fait possible d'utiliser la version .NET pour tout le reste. Cette version est **la même** mais avec le support du language **C# en plus**, nous n'en avons **pas besoin**.</span>

Une fois téléchargé, vous vous retrouvez avec un fichier **.zip** qui contient deux fichiers: **Godot_v4.6.1-stable_win64.exe** et **Godot_v4.6.1-stable_win64_console.exe**.

> Le **premier** est le **moteur de jeu**. <span style="font-size: 0.8em">(oui, oui, le **moteur de jeu Godot entier** ne fait que **165 Mo**, contre plus de 10 Go pour Unity)</span><br>
> Le second *(celui en '_console')* va lancer le moteur de jeu avec une deuxième fenêtre: **une console**. On en aura pas besoin.

Vous pouvez ranger ces fichiers où vous voulez. On va maintenant lancer le premier fichier: **Godot_v4.6.1-stable_win64.exe**. <span style="font-size: 0.8em">(Il est possible que le nom soit différent si vous êtes sur linux ou mac, ou encore si la version de Godot est différente.)</span>

## II. Créer un projet

Une fois [Godot](#godot/godot.md) ouvert, on tombe sur le [Project Manager](#godot/interface.md#project-manager):

<img src="./medias/devine-le-nombre/interface-godot-1.webp">

On va alors créer un nouveau projet en cliquant sur **+ Create**.

<img width="200px" src="./medias/devine-le-nombre/interface-godot-2.webp">

Puis renseigner le **nom du projet** et son **chemin** (là où il est enregistré).

<div class="side-by-side">
    <img src="./medias/devine-le-nombre/interface-godot-3.webp">
    <img src="./medias/devine-le-nombre/interface-godot-4.webp">
</div>

Et enfin le [renderer](#godot/godot.md#renderer) que l'on va mettre sur **Compatibility**.<br>

<img width="100px" src="./medias/devine-le-nombre/interface-godot-5.webp">

Enfin, on clique sur **Create** ce qui nous ouvre la fenêtre de l'**éditeur** de [Godot](#godot/godot.md).

<img src="./medias/devine-le-nombre/interface-godot-6.webp">

## L'interface de Godot

L'[interface](#godot/interface.md) de l'**éditeur** de [Godot](#godot/godot.md) se compose de plusieurs fenêtres et menus.

### Le menu des onglets

<img src="./medias/devine-le-nombre/interface-godot-7.webp">

Ce menu permet de changer la **fenêtre** affichée au **centre** entre cinq onglets: [![Godot - 2D](../../medias/godot-icons/2D.svg) 2D](#godot/interface.md#onglet-2d), [![Godot - 3D](../../medias/godot-icons/3D.svg) 3D](#godot/interface.md#onglet-3d), [![Godot - Script](../../medias/godot-icons/Script.svg) Script](#godot/interface.md#onglet-script), [![Godot - Game](../../medias/godot-icons/Game.svg) Game](#godot/interface.md#onglet-game) et [![Godot - AssetLib](../../medias/godot-icons/AssetLib.svg) AssetLib](#godot/interface.md#onglet-assetlib).

### La fenêtre principale

La fenêtre centrale qui va afficher un des cinq onglets ([![Godot - 2D](../../medias/godot-icons/2D.svg) 2D](#godot/interface.md#onglet-2d), [![Godot - 3D](../../medias/godot-icons/3D.svg) 3D](#godot/interface.md#onglet-3d), [![Godot - Script](../../medias/godot-icons/Script.svg) Script](#godot/interface.md#onglet-script), [![Godot - Game](../../medias/godot-icons/Game.svg) Game](#godot/interface.md#onglet-game) et [![Godot - AssetLib](../../medias/godot-icons/AssetLib.svg) AssetLib](#godot/interface.md#onglet-assetlib)). Dans cet atelier, on va utiliser les onglets [![Godot - 2D](../../medias/godot-icons/2D.svg) 2D](#godot/interface.md#onglet-2d), pour poser **nos éléments de jeux 2D** (boutons, images, textes etc...) et [![Godot - Script](../../medias/godot-icons/Script.svg) Script](#godot/interface.md#onglet-script), pour **programmer la logique** de notre jeu.

<img src="./medias/devine-le-nombre/interface-godot-8.webp">

### La fenêtre Scene

La fenêtre scene représente notre [Scene Tree](#godot/interface.md#scene-tree) *(l'arborescance de notre scène)*. Et juste à coté, la fenêtre d'[import](#godot/godot.md#import).

<img src="./medias/devine-le-nombre/interface-godot-9.webp">

###  Le FileSystem

La fenêtre du [file system](#godot/interface.md#file-system) permet de voir et d'accéder à tous nos fichiers.

<img src="./medias/devine-le-nombre/interface-godot-10.webp">

### L'Inspecteur

L'[inspecteur](#godot/interface.md#inspecteur) permet de modifier les propriétés de nos objets.<br>
Sur cette fenêtre, on a également accès à l'[historique](#godot/interface.md#historique), les [signaux](#godot/godot.md#signaux), et les [groupes](#godot/godot.md#groupes).

<img src="./medias/devine-le-nombre/interface-godot-11.webp">

## III. Créer la scène de jeu

Au niveau de la fenêtre de la [scène](#godot/interface.md#scene-tree), on va appuyer sur **User Interface**.

<img width="300px" src="./medias/devine-le-nombre/scene-jeu-1.webp">

Ce qui va nous ouvrir l'onglet [![Godot - 2D](../../medias/godot-icons/2D.svg) 2D](#godot/interface.md#onglet-2d) et dans la fenêtre [scène](#godot/interface.md#scene-tree) on voit notre nouvelle scène que l'on a créé:

<img src="./medias/devine-le-nombre/scene-jeu-2.webp">

On va commencer par renommer le [![Godot - Node](../../medias/godot-icons/node.svg) Node](#godot/nodes.md#node) racine de la scène. Pour ma part je vais l'appeler *"Game"* étant donné que ce sera ma scène de jeu.

Puis on va enregistrer cette scène. *(ctrl-S ou Scene > Save Scene)*

<img src="./medias/devine-le-nombre/scene-jeu-3.webp">

Une fois ça fait, on va ajouter un node [![Godot - Label](../../medias/godot-icons/Label.svg) Label](#godot/nodes.md#label). *(Soit avec le + au niveau de la fenêtre Scene, soit en faisant ctrl-A)* Puis un [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit).

<img src="./medias/devine-le-nombre/scene-jeu-4.webp">

<div class="side-by-side">
    <img src="./medias/devine-le-nombre/scene-jeu-5.webp">
    <img src="./medias/devine-le-nombre/scene-jeu-6.webp">
</div>

On va selectionner le label en cliquand dessus dans le [Scene Tree](#godot/godot.md#scene-tree) *(la hiérarchie de la scène)*, puis modifier sa propriété `text` dans l'[inspecteur](#godot/godot.md#inspecteur). Je vais y écrire *"Devine le nombre"*. 

<img src="./medias/devine-le-nombre/scene-jeu-7.webp">

On peut le déplacer vers le centre de l'écran en le glissant.

Enfin, on va placer le [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit) juste en dessous de notre [![Godot - Label](../../medias/godot-icons/Label.svg) Label](#godot/nodes.md#label) et modifier sa propriété `placeholder_text` et y écrire: *"Votre réponse"*.

> Si vous êtes en avance n'hésitez pas à aller voir la page des [interfaces utilisateur](#godot/control.md).

<img src="./medias/devine-le-nombre/scene-jeu-8.gif">

## IV. Programmation du jeu

La partie que vous attendiez sûrement tous·tes: on va faire de la **programmation**!

Pour cela, on va commencer par ajouter un script à notre scène. On clique sur le node racine de notre scène *(dans mon cas, le node "Game")*, puis sur le bouton pour ajouter un script.

<img src="./medias/devine-le-nombre/programmation-1.png">

<img src="./medias/devine-le-nombre/programmation-2.png">

Cela va alors nous ouvrir l'onglet de [![Godot - Script](../../medias/godot-icons/Script.svg) Script](#godot/interface.md#onglet-script) avec un template basique d'un script **GDScript**.

> Le **language de programmation** par défaut de [Godot](#godot/godot.md) est le **GDScript**. C'est un language avec une **syntaxe simplifiée**, **similaire à celle de Python**.

> Si vous voulez **apprendre** les bases de **GDScript** sans avoir **jamais fait de programmation**, vous pouvez essayer [GD-Quest](#ressources-suplementaires/gd-quest.md), c'est une formation express au **GDScript**, très **simple** et **rapide** !

<img src="./medias/devine-le-nombre/programmation-3.png">

Il y a par défaut deux fonctions:

### <code class="hljs">_ready()</code>

Cette fonction est appellée **une seule fois**: quand elle est prète *(au tout début)* et que **tous ses enfants sont également prêts**.

### <code class="hljs">_process(delta: float)</code>

Cette fonction est appellée **chaque [frame](#ressources-suplementaires/lexique-game-dev.md#frame)**, donc **continuellement**.<br>
<br>
On peut supprimer la fonction `_process`, nous n'en aurons pas besoin. Ensuite, on va **définir** une **variable** qui va détenir la **valeur du nombre mystère** que le joueur devra déviner.

Pour cela, on ajoute la ligne suivante en haut du script:
```gdscript
var nombre_mystere: int
```

Décortiquons ensemble cette ligne de code.<br>

D'abord, le **mot clé** <code class="hljs"><span class="hljs-keyword">var</span></code>: suivit d'un mot, il définit une variable. Ensuite, <code class="hljs">nombre_mystere</code>: le **nom de la variable**. <span style="font-size: 0.8em">(Un nom de variable **ne peut pas** contenir d'espaces. Par convention, on écrit le nom des variables en **snake_case**)</span> Enfin, <code class="hljs">: <span class="hljs-built_in">int</span></code>: il dit à Godot que la **variable** est du type **int** <span style="font-size: 0.8em">(c'est à dire un **nombre entier**)</span>.

> Le **snake_case** est le fait d'écrire tout en **minuscule**, sans accents, et de **remplacer les espaces par des tirets** du bas *(_)*.<br>
> <span style="font-size: 0.8em">Dans [Godot](#godot/godot.md), on utilise le **pascal_case** pour tout, sauf pour: les noms des **classes** et les noms des **nodes**. Pour ceux-là, on utilise le **PascalCase** (**pas d'espaces**, une **majuscule** au début et à **chaque** nouveau **mot**).</span>

<img src="./medias/devine-le-nombre/programmation-4.png">
<span style="font-size: 0.8em; color: var(--body-text-color-faded)"><strong>/!\</strong> Dans les quelques prochains screenshots j'ai écrit <em>nombre_mystère</em> au lieu de <strong>nombre_mystere</strong>. Ce n'est pas une erreur très grave mais en programmation il est important de ne pas mettre d'accents sur les noms de variables. <strong>/!\</strong></span>

<br>Maintenant que notre variable <code class="hljs">nombre_mystere</code> a été définie, on va lui donner une valeur. On va lors ajouter cette ligne dans la fonction <code class="hljs">_ready</code>:
```gdscript
func _ready() -> void:
    nombre_mystere = 158
```

Pour que le joueur puisse **entrer sa réponse**, on utilise le node [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit). On va alors le sélectionner, puis dans la fenêtre de l'[inspecteur](#godot/interface.md#inspecteur), on va choisir l'onglet des [signaux](#godot/godot.md#signaux) et sélectionner le signal <code class="hljs">text_submitted</code>.

<img src="./medias/devine-le-nombre/programmation-5.png">

<img src="./medias/devine-le-nombre/programmation-6.png">

Cela ajoute la ligne suivante à notre script:
```gdscript
func _on_line_edit_text_submitted(new_text: String) -> void:
    pass
```

L'idée de ce **signal** est que, quand le joueur **appuye sur la touche 'Entrée'** dans le node [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit), le signal <code class="hljs">text_submitted</code> est émit. Et dès que ce signal est émit, notre fonction <code class="hljs">_on_line_edit_text_submitted</code> sera appellée. La variable <code class="hljs">new_text</code> contient le **texte entré par le joueur**.

Pour tester si cela fonctionne, on va utiliser la fonction <code class="hljs">print</code>, qui permet d'afficher une valeur dans l'[Output](#godot/interface.md#output).

```gdscript
func _on_line_edit_text_submitted(new_text: String) -> void:
    print(new_text)
```

<img src="./medias/devine-le-nombre/programmation-7.png">

### Test du jeu

On peut maintenant tester le jeu. Pour cela, il suffit de cliquer sur l'icône pour lancer le jeu à la scène actuelle ![Icône lancer la scène active - Godot](../../medias/godot-icons/godot-play-scene-icon.svg).

<img src="./medias/devine-le-nombre/test-du-jeu-1.gif">

On voit effectivement que quand on écrit quelque chose dans le [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit) puis qu'on appuie sur la touche **'Entrée'**, notre mot est <code class="hljs">print</code> dans l'[Output](#godot/interface.md#output).

Cependant, nous ne voulons pas que le joueur puisse **écrire n'importe quoi**, mais **seulement** qu'il puisse entrer **un nombre**. Pour changer ça, on a deux solutions:

- **Solution 1**: On change le node [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit) par un [![Godot - SpinBox](../../medias/godot-icons/SpinBox.svg) SpinBox](#godot/nodes.md#spinbox) qui n'accepte que des nombres.

- **Solution 2**: On accepte n'importe quel entrée, mais on ne s'intéresse qu'aux nombres.

Pour ma part, je vais partir sur la **solution 2**, un [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit) étant plus pratique à mon goût.

<br>*Retournons sur notre code.* Quand le joueur entre une valeur, on veut la **comparer au <code class="hljs">nombre_mystere</code>**, puis dire si le nombre donné par le joueur doit être **plus grand**, **plus petit**, ou si il a trouvé **le bon**.

```gdscript
func _on_line_edit_text_submitted(new_text: String) -> void:
    var reponse_joueur: int = int(new_text)

    if reponse_joueur > nombre_mystere:
        print("Plus petit!")
    elif reponse_joueur < nombre_mystere:
        print("Plus grand!")
    else:
        print("Trouvé!")
```

Analysons ce code ligne par ligne:

- <code class="hljs"><span class="hljs-keyword">var</span> reponse_joueur: <span class="hljs-built_in">int</span> = <span class="hljs-built_in">int</span>(new_text)</code>: Ici on définie une nouvelle **variable** du nom de <code>reponse_joueur</code>, on lui attribue le type <code><span class="hljs-built_in">int</span></code> puis on lui donne la valeur de <code><span class="hljs-built_in">int</span>(new_text)</code></code>. <code><span class="hljs-built_in">int</span>()</code> est une fonction qui prend en entrée une variable, et en sort un <code><span class="hljs-built_in">int</span></code>. <em>(Donc ici on transforme un <code><span class="hljs-built_in">String</span></code>, du texte, en un <code><span class="hljs-built_in">int</span></code>, un nombre entier.)</em>

    >  La ligne <code class="hljs"><span class="hljs-built_in">int</span>("Texte test 123")</code> retournerais le nombre <code class="hljs-number">123</code>.

- <code class="hljs"><span class="hljs-keyword">if</span> reponse_joueur > nombre_mystere:</code>: Le mot clé <code><span class="hljs-keyword">if</span></code> permet de **tester une condition**. Si la **condition est remplie**, les lignes en dessous sont **exécutées**, **sinon** elles sont **ignorées**. Notre condition est `reponse_joueur > nombre_mystere`. Ici, le signe `>` test si la valeur à **gauche** est **plus grande** que la valeur à **droite**.

- <code class="hljs"><span class="hljs-built_in">print</span>(<span class="hljs-string">"Plus petit!"</span>)</code>: Si la condition définie au dessus est remplie on exécute cette ligne. Ici on appelle la fonction <code><span class="hljs-built_in">print</span></code> pour afficher le message <code><span class="hljs-string">"Plus petit!"</span></code>.

- <code class="hljs"><span class="hljs-keyword">elif</span> reponse_joueur < nombre_mystere:</code> et <code class="hljs"><span class="hljs-built_in">print</span>(<span class="hljs-string">"Plus petit!"</span>)</code> sont **similaires aux deux lignes au dessus**, mais pour tester si la réponse du joueur est plus petite que la réponse attendue.

    > Le mot clé <code><span class="hljs-keyword">else</span></code> **exécute le code en dessous** si la condition <code><span class="hljs-keyword">if</span></code> précédente était **fausse**.<br>
    > Le mot clé <code><span class="hljs-keyword">elif</span></code> est la **contraction** de <code><span class="hljs-keyword">else if</span></code>.

- <code class="hljs"><span class="hljs-keyword">else</span>:</code> et <code class="hljs"><span class="hljs-built_in">print</span>(<span class="hljs-string">"Trouvé!"</span>)</code>: Si **aucune des deux conditons précédentes** ne sont **vraies** *(la réponse du joueur n'est ni plus grande, ni plus petite que la réponse attendue)* alors c'est forcément la **bonne réponse**.

### On test encore notre jeu !

Il est important de **régulièrement tester** son jeu pour s'assurer qu'il n'y a **pas de problème**.

> Je vous conseille aussi de d'**enregistrer souvent** votre travail *(ctrl-S)*.

<img src="./medias/devine-le-nombre/test-du-jeu-2.gif">

## Amméliorations

**Tout fonctionne !** On pourrais alors *s'arrêter là et se dire qu'on a un super jeu*.

Mais on peut aussi **rêgler quelques problèmes** avec notre jeu:

- On préfèrerais que les indices "plus grand", "plus petit" et "trouvé" soient **visibles par le joueur** directement dans le jeu **sans avoir à passer par l'[Output](#godot/interface.md#output)**.

- On pourrais aussi **effacer le nombre entré** par le joueur pour qu'il n'ai pas à le **supprimer manuellement** à chaque fois.

- **Mais surtout**, on peut rendre le numéro de départ **aléatoire**!

### Indices visibles et références
Pour faire tout cela, il nous faut dans notre code une **référence** à nos nodes pour pouvoir les modifer.

On va commencer avec la manière la **plus simple**, mais **pas la meilleure**. **Puis** on va voir **les méthodes que je recommande**.

#### Méthode '<code>$</code>'

Pour modifier le texte affiché sur notre [![Godot - Label](../../medias/godot-icons/Label.svg) Label](#godot/nodes.md#label), il nous suffit d'avoir accès à sa **référence**, puis de modifier sa **propriété** <code>text</code>.

```gdscript
func _on_line_edit_text_submitted(new_text: String) -> void:
    var reponse_joueur: int = int(new_text)

    if reponse_joueur > nombre_mystere:
        $Label.text = "Plus petit!"
    elif reponse_joueur < nombre_mystere:
        $Label.text = "Plus grand!"
    else:
        $Label.text = "Trouvé!"
```

<code class="hljs"><span class="hljs-variable">\$</span></code> nous permet de **chercher l'enfant** du node auquel est rattaché ce script *(ici 'Game', un node [![Godot - Control](../../medias/godot-icons/Control.svg) Control](#godot/nodes.md#control))*. Donc <code class="hljs"><span class="hljs-variable">\$Label</span></code> va rechercher un **enfant direct** qui s'appelle *'Label'*.

> Si on avait renommé ce node 'Message', alors on aurait utilisé <code class="hljs"><span class="hljs-variable">\$Message</span></code>.

Une fois sa référence récupéré, on peut **accéder à ses propriété** en utilisant un **point**, puis le **nom de la propriété**. Ce qui nous donne: <code class="hljs"><span class="hljs-variable">\$Label</span>.text</code>.

> <span style="font-size: 0.8em">On peut aussi utiliser la notation suivante: <code class="hljs"><span class="hljs-variable">\$Label</span>["text"]</code> mais c'est moins pratique, et moins sécurisé donc à éviter.</span>

Pour éviter de chercher le node **à chaque fois**, on peut créer une **variable**:

```gdscript
func _on_line_edit_text_submitted(new_text: String) -> void:
    var reponse_joueur: int = int(new_text)
    var reference_label: Label = $Label

    if reponse_joueur > nombre_mystere:
        reference_label.text = "Plus petit!"
    elif reponse_joueur < nombre_mystere:
        reference_label.text = "Plus grand!"
    else:
        reference_label.text = "Trouvé!"
```

<img src="./medias/devine-le-nombre/ammelioration-1.gif">

#### Variable globale

On peut encore **améliorer** cela en définissant la variable **en haut du script** pour qu'elle soit **disponible partout**. Puis récupérer la référence au [![Godot - Label](../../medias/godot-icons/Label.svg) Label](#godot/nodes.md#label) une seule fois, dans la fonction <code class="hljs">_ready()</code>.

```gdscript
extends Control


var reference_label: Label
var nombre_mystere: int


func _ready() -> void:
    reference_label = $Label
    nombre_mystere = 158


func _on_line_edit_text_submitted(new_text: String) -> void:
    var reponse_joueur: int = int(new_text)
    
    if reponse_joueur > nombre_mystere:
        reference_label.text = "Plus petit!"
    elif reponse_joueur < nombre_mystere:
        reference_label.text = "Plus grand!"
    else:
        reference_label.text = "Trouvé!"
```

#### @onready

Le mot clé <code class="hljs">@onready</code> permet de **définir une variable** et de définir sa valeur **au moment de la fonction <code class="hljs">_ready()</code>**. Cela nous donne alors:

```gdscript
extends Control


@onready var reference_label: Label = $Label

var nombre_mystere: int


func _ready() -> void:
    nombre_mystere = 158


func _on_line_edit_text_submitted(new_text: String) -> void:
    var reponse_joueur: int = int(new_text)
    
    if reponse_joueur > nombre_mystere:
        reference_label.text = "Plus petit!"
    elif reponse_joueur < nombre_mystere:
        reference_label.text = "Plus grand!"
    else:
        reference_label.text = "Trouvé!"
```

### Réinitialiser le LineEdit

Pour **supprimer** le nombre que le joueur à rentré dans le [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit), il faut ici aussi avoir sa référence. On rajoute alors la ligne suivante:

```gdscript
@onready var reference_line_edit: LineEdit = $LineEdit
```

Ensuite, quand le joueur rentre un nombre, on le supprime du [![Godot - LineEdit](../../medias/godot-icons/LineEdit.svg) LineEdit](#godot/nodes.md#lineedit):

```gdscript
func _on_line_edit_text_submitted(new_text: String) -> void:
    reference_line_edit.text = ""

    var reponse_joueur: int = int(new_text)
    
    if reponse_joueur > nombre_mystere:
        reference_label.text = "Plus petit!"
    elif reponse_joueur < nombre_mystere:
        reference_label.text = "Plus grand!"
    else:
        reference_label.text = "Trouvé!"
```

<img src="./medias/devine-le-nombre/ammelioration-2.gif">

### Nombre aléatoire

**Pour conclure** *(enfin)* on va rendre le nombre de départ **aléatoire** !

Pour ça, on va faire appel à la fonction <code class="hljs">randi_range</code> qui permet de **générer un nombre aléatoire** entre deux valeurs:

```gdscript
func _ready() -> void:
    nombre_mystere = randi_range(0, 100)
```

Maintenant, à chaque fois qu'on va lancer le jeu, le nombre à deviner sera aléatoire.

## Jeu fini !

Voici le code final.

```gdscript
extends Control


@onready var reference_label: Label = $Label
@onready var reference_line_edit: LineEdit = $LineEdit

var nombre_mystere: int


func _ready() -> void:
    nombre_mystere = randi_range(0, 100)


func _on_line_edit_text_submitted(new_text: String) -> void:
    reference_line_edit.text = ""
    
    var reponse_joueur: int = int(new_text)
    
    if reponse_joueur > nombre_mystere:
        reference_label.text = "Plus petit!"
    elif reponse_joueur < nombre_mystere:
        reference_label.text = "Plus grand!"
    else:
        reference_label.text = "Trouvé!"

```

> Vous pouvez **retrouver l'intégraliter du projet** dans le <a class="external-link" href="https://github.com/RSelaries/ateliers-gamejam">repo</a> de ces ateliers au lien suivant: <a class="external-link" href="https://github.com/RSelaries/ateliers-gamejam/tree/main/projets/devine_le_nombre">https://github.com/RSelaries/ateliers-gamejam/tree/main/projets/devine_le_nombre</a>.

> Vous pouvez aussi directement **télécharger le projet** <a class="external-link" target="_blank" href="https://downgit.github.io/#/home?url=https://github.com/RSelaries/ateliers-gamejam/tree/main/projets/devine_le_nombre">ici</a>.

<img src="./medias/devine-le-nombre/jeu-fini.png">
