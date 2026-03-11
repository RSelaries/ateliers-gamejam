# Projet 1 - Devine le nombre

Dans cet atelier, on va **installer [Godot](#godot/godot.md)**, appréhender son **interface**, puis créer notre **premier projet**.<br>

<br>

Pour apprendre les bases de [Godot](#godot/godot.md) et de la programmation on va commencer par faire un jeu **type devine le nombre**.

> Le jeu génère un nombre aléatoire. Le joueur doit deviner ce nombre avec comme indice: "plus grand" ou "plus petit".

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

L'interface de l'**éditeur** de [Godot](#godot/godot.md) se compose de plusieurs fenêtres et menus.

### Le menu des onglets

<img src="./medias/devine-le-nombre/interface-godot-7.webp">

Ce menu permet de changer la **fenêtre** affichée au **centre** entre cinq onglets: [2D](#godot/interface.md#onglet-2d), [3D](#godot/interface.md#onglet-3d), [Script](#godot/interface.md#onglet-script), [Game](#godot/interface.md#onglet-game) et [AssetLib](#godot/interface.md#onglet-assetlib).

### La fenêtre principale

La fenêtre centrale qui va afficher un des cinq onglets ([2D](#godot/interface.md#onglet-2d), [3D](#godot/interface.md#onglet-3d), [Script](#godot/interface.md#onglet-script), [Game](#godot/interface.md#onglet-game) et [AssetLib](#godot/interface.md#onglet-assetlib)). Dans cet atelier, on va utiliser les onglets [2D](#godot/interface.md#onglet-2d), pour poser **nos éléments de jeux 2D** (boutons, images, textes etc...) et [Script](#godot/interface.md#onglet-script), pour **programmer la logique** de notre jeu.

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

Ce qui va nous ouvrir l'onglet [2D](#godot/interface.md#onglet-2d) et dans la fenêtre [scène](#godot/interface.md#scene-tree) on voit notre nouvelle scène que l'on a créé:

<img src="./medias/devine-le-nombre/scene-jeu-2.webp">

On va commencer par renommer le [Node](#godot/nodes.md#node) racine de la scène. Pour ma part je vais l'appeler *"Game"* étant donné que ce sera ma scène de jeu.

Puis on va enregistrer cette scène. *(ctrl-S ou Scene > Save Scene)*

<img src="./medias/devine-le-nombre/scene-jeu-3.webp">

Une fois ça fait, on va ajouter un node [Label](#godot/nodes.md#label). *(Soit avec le + au niveau de la fenêtre Scene, soit en faisant ctrl-A)* Puis un [LineEdit](#godot/nodes.md#lineedit).

<img src="./medias/devine-le-nombre/scene-jeu-4.webp">

<div class="side-by-side">
    <img src="./medias/devine-le-nombre/scene-jeu-5.webp">
    <img src="./medias/devine-le-nombre/scene-jeu-6.webp">
</div>

On va selectionner le label en cliquand dessus dans le [Scene Tree](#godot/godot.md#scene-tree) *(la hiérarchie de la scène)*, puis modifier sa propriété `text` dans l'[inspecteur](#godot/godot.md#inspecteur). Je vais y écrire *"Devine le nombre"*. 

<img src="./medias/devine-le-nombre/scene-jeu-7.webp">

On peut le déplacer vers le centre de l'écran en le glissant.

Enfin, on va placer le [LineEdit](#godot/nodes.md#lineedit) juste en dessous de notre [Label](#godot/nodes.md#label) et modifier sa propriété `placeholder_text` et y écrire: *"Votre réponse"*.

> Si vous êtes en avance n'hésitez pas à aller voir la page des [interfaces utilisateur](#godot/control.md).

<img src="./medias/devine-le-nombre/scene-jeu-8.gif">

## IV. Programmation du jeu

La partie que vous attendiez sûrement tous·tes: on va faire de la **programmation**!

Pour cela, on va commencer par ajouter un script à notre scène. On clique sur le node racine de notre scène *(dans mon cas, le node "Game")*, puis sur le bouton pour ajouter un script.

<img src="./medias/devine-le-nombre/programmation-1.png">

<img src="./medias/devine-le-nombre/programmation-2.png">

Cela va alors nous ouvrir l'onglet de [Script](#godot/interface.md#onglet-script) avec un template basique d'un script **GDScript**.

> Le **language de programmation** par défaut de [Godot](#godot/godot.md) est le **GDScript**. C'est un language avec une **syntaxe simplifiée**, **similaire à celle de Python**.

> Si vous voulez **apprendre** les bases de **GDScript** sans avoir **jamais fait de programmation**, vous pouvez essayer [GD-Quest](#ressources-suplementaires/gd-quest.md), c'est une formation express au **GDScript**, très **simple** et **rapide** !

<img src="./medias/devine-le-nombre/programmation-3.png">

Il y a par défaut deux fonctions:

### `_ready()`

Cette fonction est appellée **une seule fois**: quand elle est prète *(au tout début)* et que **tous ses enfants sont également prêts**.

### `_process(delta: float)`

Cette fonction est appellée **chaque [frame](#ressources-suplementaires/lexique-game-dev.md#frame)**, donc **continuellement**.<br>
<br>
On peut supprimer la fonction `_process`, nous n'en aurons pas besoin. Ensuite, on va **définir** une **variable** qui va détenir la **valeur du nombre mystère** que le joueur devra déviner.

Pour cela, on ajoute la ligne suivante en haut du script:
```gdscript
var nombre_mystère: int
```

Décortiquons ensemble cette ligne de code.<br>

D'abord, le **mot clé** <code class="hljs"><span class="hljs-keyword">var</span></code>: suivit d'un mot, il définit une variable. Ensuite, <code class="hljs">nombre_mystère</code>: le **nom de la variable**. <span style="font-size: 0.8em">(Un nom de variable **ne peut pas** contenir d'espaces. Par convention, on écrit le nom des variables en **snake_case**)</span> Enfin, <code class="hljs">: <span class="hljs-built_in">int</span></code>: il dit à Godot que la **variable** est du type **int** <span style="font-size: 0.8em">(c'est à dire un **nombre entier**, positif ou négatif)</span>.

> Le **snake_case** est le fait d'écrire tout en **minuscule**, sans accents, et de **remplacer les espaces par des tirets** du bas *(_)*.<br>
> <span style="font-size: 0.8em">Dans [Godot](#godot/godot.md), on utilise le **pascal_case** pour tout, sauf pour: les noms des **classes** et les noms des **nodes**. Pour ceux-là, on utilise le **PascalCase** (**pas d'espaces**, une **majuscule** au début et à **chaque** nouveau **mot**).</span>
