# <div class="icon" style="mask-image: url(./medias/icons/visual-novel.svg)"></div> Atelier 3 - Visual Novel

Dans cet atelier, on va apprendre à utiliser le [![plugin](../../medias/godot-icons/PluginScript.svg) Plugin](#godot/plugins.md) ![dialogue manager](../../medias/dialogue-manager.svg) **Dialogue Manager** pour créer un visual novel !

<details class="learning-details">
    <summary>Concepts Abordés</summary>
    <ul>
        <li>Les <a href="#godot/plugins.md">plugins</a></li>
        <li>Le plugin Dialogue Manager</li>
    </ul>
</details>

## Jeu

<iframe-player launchFullscreen="false" title="Jeu de Plateforme" class="game" src="./game-builds/visual-novel/index.html"></iframe-player>

## Création du projet

On commence en créant notre projet, je vais l'appeler *"Atelier Visual Novel"*. À ce projet on ajoute le fichier *"/assets/"* que vous pouvez télécharger <a href="https://downgit.github.io/#/home?url=https://github.com/RSelaries/ateliers-gamejam/tree/main/projets/visual_novel/assets" class="external-link" target="_blank">ici</a>. (Vous pouvez égallement vous rendre sur <a href="https://itch.io/game-assets/genre-visual-novel/tag-no-ai" class="external-link" target="_blank">cette page</a> pour chercher d'autres images)

> Si vous avez oublié comment faire, vous pouvez relire la partie [Création du projet](#ateliers/jeu-de-plateforme.md#creation-du-projet) du deuxième atelier.

<viewable-image src="./medias/visual-novel/creation-projet-1.png"></viewable-image>

## Installation du Plugin

Parfois il est inutile de réinventer la roue. C'est pour cela qu'au lieu de coder un système de dialogue complexe et sûrement bancal, on va installer un plugin qui va tout gérer pour nous.

<br>

Les plugins sont accessibles directement dans Godot via l'onglet ![AssetLib](../../medias/godot-icons/AssetLib.svg) AssetLib.

On cherche *"Dialogue Manager"* puis on l'installe.

<viewable-image src="./medias/visual-novel/download-plugin-1.gif"></viewable-image>

Une fois le plugin installé, il faut l'activer dans les paramètres de projet: *Project > Project Settings > Plugin > Dialogue Manager*.

<viewable-image src="./medias/visual-novel/download-plugin-2.gif"></viewable-image>

## Création du premier dialogue

On peut dès à présent créer notre premier dialogue. Pour cela on se rend sur l'onglet <span style="white-space: nowrap">![dialogue manager](../../medias/icons/visual-novel.svg) Dialogue</span>, puis on sélectionne <span style="white-space: nowrap">![Newfile](../../medias/godot-icons/New.svg) New Dialogue...</span>. On peut enregistrer ce nouveau dialogue dans un dossier *"/dialogues/"*.

<viewable-image src="./medias/visual-novel/create_diag_file-1.gif"></viewable-image>

Par défaut, le fichier contient le dialogue suivant comme exemple:


<pre><code class="hljs" style="color: var(--code-color)">~ start
Nathan: [[Hi|Hello|Howdy]], this is some dialogue.
Nathan: Here are some choices.
- First one
	Nathan: You picked the first one.
- Second one
	Nathan: You picked the second one.
- Start again => start
- End the conversation => END
Nathan: For more information see the online documentation.
=> END
</code></pre>

Pour comprendre petit à petit, on peut tout supprimer et écrire une simple phrase, par exemple:

<pre><code class="hljs" style="color: var(--code-color)">~ start
Woaw ceci est une super ligne de dialogue !
</code></pre>

Maintenant on peut tester notre dialogue en utilisant le bouton ![StartDialogue](../../medias/godot-icons/DebugNext.svg):

<viewable-image src="./medias/visual-novel/write-dialogue-1.gif"></viewable-image>

Si on ajoute un nom devant la ligne de dialogue:

<pre><code class="hljs" style="color: var(--code-color)">~ start
Athavan: Woaw ceci est une super ligne de dialogue !
</code></pre>

<viewable-image src="./medias/visual-novel/write-dialogue-2.gif"></viewable-image>

On peut aussi poser des questions et proposer plusieurs réponses:

<pre><code class="hljs" style="color: var(--code-color)">~ start
Athavan: Woaw ceci est une super ligne de dialogue !
Athavan: Veux tu répondre à ma question ?
- Oui
- Non
</code></pre>

Et on peut changer le dialogue selon la réponse choisie:

<pre><code class="hljs" style="color: var(--code-color)">~ start
Athavan: Woaw ceci est une super ligne de dialogue !
Athavan: Veux tu répondre à ma question ?
- Oui
	Athavan: Super !
- Non
	Athavan: Oh mince !
</code></pre>

<viewable-image src="./medias/visual-novel/write-dialogue-3.gif"></viewable-image>

## Création de la scène

Maintenant qu'on sait créer un dialogue simple, on peut commencer à créer notre scène de jeu. Pour cela on créer une nouvelle scène de ![Control](../../medias/godot-icons/Control.svg)Control *(*![Control](../../medias/godot-icons/Control.svg)*User Interface)*.

On peut renommer la racine de la scène, par exemple je vais l'appeler *"Game"*.

<viewable-image src="./medias/visual-novel/game-scene-1.gif"></viewable-image>

> <span style="font-size: 0.8em; color: var(--body-text-color-faded);">N'oubliez pas de souvegarder la scène et de **sauvegarder souvent !**</span>

Ensuite, on va ajouter un ![TextRect](../../medias/godot-icons/TextureRect.svg)TextureRect qui va être utilisé pour le fond d'écran. Pour cela on met son *Anchor Presset* sur `Full Rect`.

Pour s'assurer que l'image de fond prenne tout l'écran on modifie ses propriétés `expend_mode` en **Ignore Size** et `stretch_mode` en **Keep Aspect Covered**.

<viewable-image src="./medias/visual-novel/game-scene-2.gif"></viewable-image>

Après cela, on ajoute un ![HBoxC](../../medias/godot-icons/HBoxContainer.svg)HBoxContainer avec un *Anchor Presset* sur `Center` auquel on ajoute trois ![TextRect](../../medias/godot-icons/TextureRect.svg)TextureRect en enfant.

<viewable-image src="./medias/visual-novel/game-scene-3.gif"></viewable-image>

On peut renommer ces trois ![TextRect](../../medias/godot-icons/TextureRect.svg)TextureRect "Srpite1", "Sprite2" et "Sprite3". On va modifier leurs propriétés `expend_mode` en **Ignore Size** et `stretch_mode` en **Keep Aspect Centered**. On peut aussi modifier leur `custom_minimum_size` en *(280, 500)*.

<viewable-image src="./medias/visual-novel/game-scene-4.png"></viewable-image>

Enfin je modifie le *theme_override* `separation` du ![HBoxC](../../medias/godot-icons/HBoxContainer.svg)HBoxContainer à 80.

<viewable-image src="./medias/visual-novel/game-scene-5.png"></viewable-image>

On peut y ajouter des textures du dossier */assets/* pour voir ce que cela donnerait:

<viewable-image src="./medias/visual-novel/game-scene-6.png"></viewable-image>

Pour finir la scène, il nous manque la bulle de dialogue. Heureusement le plugin Dialogue Manager nous permet de dupliquer la bulle de dialogue d'exemple pour la personnaliser. Pour cela on se rend dans *Project > Tools > Create copy of dialogue balloon exemple...*. On peut l'enregistrer dans un dossier */dialogue_ballon/*.

<viewable-image src="./medias/visual-novel/game-scene-7.gif"></viewable-image>

Il nous suffit maintenant de glisser la scène du *Dialogue Ballon* dans notre scène *Game*.

<viewable-image src="./medias/visual-novel/game-scene-8.png"></viewable-image>

## Programmation

Pour ce jeu, on va se contenter d'un script simple qui nous permet de **modifier l'image de fond, et les trois sprites**.

<br>

Pour commencer on va ajouter un script à notre node *Game*.

> <span style="font-size: 0.8em; color: var(--body-text-color-faded);">Entre temps j'ai retiré les textures des différents ![TextRect](../../medias/godot-icons/TextureRect.svg)TextureRect.</span>

On peut récupérer une référence aux nodes Background, *Sprite1*, *Sprite2*, *Sprite3* et *DialogueBalloon*.

<viewable-image src="./medias/visual-novel/script-1.gif"></viewable-image>

> Pour cela on peut simplement les glisser dans le script en appyant sur *ctrl*, cela va automatiquement créer les variables à l'aide de mot-clé *"@onready"*

Ensuite on veut une référence à notre fichier de dialogue, le plus simple est d'avoir accès à la variable dans l'inspecteur. Pour cela on utilise le mot clé *"@export"*. Ce qui nous donne:

```gdscript
extends Control


@export var dialogue: DialogueResource

@onready var background: TextureRect = %Background
@onready var sprite_1: TextureRect = %Sprite1
@onready var sprite_2: TextureRect = %Sprite2
@onready var sprite_3: TextureRect = %Sprite3
@onready var dialogue_balloon: CanvasLayer = %DialogueBalloon
```

On veut lancer le dialogue dès que le jeu se lance, pour cela on appelle la fonction `start()` du *dialogue_balloon* en passant la resource *dialogue* en argument dans la fonction `_ready()`:

```gdscript
func _ready() -> void:
	dialogue_balloon.start(dialogue)
```

<details>
    <summary>Pour ceux qui veulent un meilleur autocomplete</summary>
    <br>
    <p>
        Si vous aimez quand Godot vous propose les noms des propriétés et des fonctions quand vous commencez à écrire, je suis d'accord avec vous. Cependant ici Godot ne peux pas savoir que <em>dialogue_balloon</em> contient une fonction <code>start</code> étant donné que le node <em>CanvasLayer</em> ne contient pas cette fonction.
    <p>
    <br>
    </p>
        Pour avoir l'autocomplete, il faut créer une <strong>class</strong> qui détient cette fonction. Pour cela on peut ouvrir le script de <em>dialogue_balloon</em> et y ajoute tout en haut:
        <br><code>class_name DialogueBalloon</code>.
    <p>
    <br>
    </p>
        Ensuite, on peut changer la ligne:
        <br><code>@onready var dialogue_balloon: CanvasLayer = %DialogueBalloon</code> en
        <br><code>@onready var dialogue_balloon: DialogueBalloon = %DialogueBalloon</code>.
        <br>
        Maintenant Godot <strong>sait</strong> que <em>dialogue_balloon</em> contient la fonction <code>start</code>.
    </p>
</details>

Maintenant si on change la propriété `dialogue` de notre node *Game* en y mettant le dialogue que l'on avait créé plus tôt, on tester notre jeu:

<viewable-image src="./medias/visual-novel/script-2.gif"></viewable-image>

### Changer le fond et les sprites

Il serait pratique de pouvoir changer les images de fond et des personnages pour que notre jeu soit plus vivant. Pour ça on va créer deux fonctions:

```gdscript
func change_background(new_background: Texture2D) -> void:
	background.texture = new_background
```

La fonction `change_background` change la texture du ![TextRect](../../medias/godot-icons/TextureRect.svg)TextureRect qui nous sert de fond.

<pre><code class="hljs language-gdscript"><span class="hljs-keyword">func</span> <span class="hljs-title function_">change_sprite</span>(sprite_id: <span class="hljs-built_in">int</span>, new_sprite: <span class="hljs-built_in">Texture2D</span>) -> <span class="hljs-built_in">void</span>:
	<span class="hljs-keyword">if</span> sprite_id == 1:
		sprite_1.texture = new_sprite
	<span class="hljs-keyword">elif</span> sprite_id == 2:
		sprite_2.texture = new_sprite
	<span class="hljs-keyword">elif</span> sprite_id == 3:
		sprite_3.texture = new_sprite
</code></pre>

La fonction `change_sprite` permet de changer la texture d'un de nos trois sprites. Pour savoir lequel, on entre le nombre `1`, `2` ou `3`.

<details>
    <summary>Variante du <code>if</code>/<code>elif</code> avec <code>match</code></summary>
    <br>
    <p>
        Si on doit faire une série de tests qui se suivent en <code>if</code>...<code>elif</code>...<code>elif</code>... alors on peut utiliser le mot clé <code>match</code>:
<pre><code class="hljs language-gdscript"><span class="hljs-keyword">func</span> <span class="hljs-title function_">change_sprite</span>(sprite_id: <span class="hljs-built_in">int</span>, new_sprite: <span class="hljs-built_in">Texture2D</span>) -> <span class="hljs-built_in">void</span>:
	<span class="hljs-keyword">match</span> sprite_id:
		1:
			sprite_1.texture = new_sprite
		2:
			sprite_2.texture = new_sprite
		3:
			sprite_3.texture = new_sprite
</code></pre>
    </p>
</details>

Pour pouvoir utiliser ces fonctions dans notre dialogue, il faut que passer une référence au node *Game* dans la fonction `start` du *DialogueBalloon*:

```gdscript
func _ready() -> void:
	dialogue_balloon.start(dialogue, "", [self])
```

> Le mot clé `self` est une référence au node dans lequel le script est (donc ici le node *Game*).

> <span style="font-size: 0.8em; color: var(--body-text-color-faded);">Le deuxième argument: **""**, désigne le **titre** où l'on veut commencer le dialogue. Si vide *(comme ici)* on commence en haut du fichier dialogue. Mais on peut commencer à un titre précis comme *"start"*.</span>

Enfin, pour pouvoir utiliser nos assets il nous en faut une référence, pour cela on peut soit en créer une dans le script:

```gdscript
const CIEL_BLEU = preload("res://assets/background/clouds.png")
```

Sinon, pour vous simplifier la vie j'ai déjà créé un script *textures* qui contient une référence à tous les assets que je vous ai fourni, pour y accéder dans notre dialogue, on peut en faire un <a class="documentation-link" target="_blank" href="https://docs.godotengine.org/fr/4.x/tutorials/scripting/singletons_autoload.html">autoload</a>.

<details>
    <summary>Faire un autoload</summary>
    <p>
        Pour ajouter un script comme autoload, il faut aller dans *Project > Project Settings > Globals* puis sélectionner le script et l'ajouter.
    </p>
    <viewable-image src="./medias/visual-novel/create-autoload.gif"></viewable-image>
</details>

## Des dialogues plus vivants

À l'aide de ces deux simples fonctions et des fonctionnalités riches du plugin DialogueManager, on peut créer un **visual novel entier** <span style="font-size: 0.8em; color: var(--body-text-color-faded);">(bien que très simple)</span>.

### Changer les sprites

Pour appeler des fonctions dans le dialogue, il suffit d'utiliser le mot clé `do` <span style="font-size: 0.8em; color: var(--body-text-color-faded);">(ou alors "$>")</span>:

<pre><code class="hljs" style="color: var(--code-color)">~ start
</code></pre>

### Créer des embranchements

Pour créer des embranchements et des choix, on peut utiliser la technique vue plus haut:

<pre><code class="hljs" style="color: var(--code-color)">~ start
Narrateur: Voulez vous prendre la porte de droite ou de gauche ?
- Porte droite
	Narrateur: Vous prenez la porte à droite.
	Narrateur: Vous voyez devant vous une épée et un arc.
	- Prendre l'épée
		Narrateur: L'épée est le bon choix pour vous, vous en aurez besoins
		[...]
	- Prendre l'arc
		[...]
- Porte gauche
	Narrateur: Vous prenez la porte à gauche.
	Narrateur: Vous voyez devant vous un monstre.
	- Fuir
		[...]
	- Attaquer
		[...]
</code></pre>

Mais cela devient vite complexe et difficile à suivre pour écrire son histoire. Pour simplifier visuellement on peut utiliser les **titres**:

<pre><code class="hljs" style="color: var(--code-color)">~ start
Narrateur: Voulez vous prendre la porte de droite ou de gauche ?
- Porte droite => porte_droite
- Porte gauche => porte_gauche

~ porte_gauche
Narrateur: Vous prenez la porte à gauche.
Narrateur: Vous voyez devant vous un monstre.
- Fuir
	[...]
- Attaquer
	[...]

~ porte_droite
Narrateur: Vous prenez la porte à droite.
Narrateur: Vous voyez devant vous une épée et un arc.
- Prendre l'épée
	Narrateur: L'épée est le bon choix pour vous, vous en aurez besoins
	[...]
- Prendre l'arc
	[...]
</code></pre>

### Décorations

### Vitesse et pauses

### Variables

### Conditions

### Aléatoire