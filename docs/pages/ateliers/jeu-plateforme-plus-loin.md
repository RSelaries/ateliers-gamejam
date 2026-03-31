# Jeu de plateforme - suite

**Si vous êtes là c'est que vous voulez finir votre jeu et j'en suis ravi !**

<br>

Pour reprendre sur de **bonnes bases**, je vais **ranger** les fichiers avec cette organisation:

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-1.png">

<span style="color: var(--body-text-color-faded); font-size: .8em">(J'ai rennomé la scène <em>"OrdinateurBouton"</em> en <em>"InteractibleComputer"</em> pour plus cohérence avec le reste de la nomenclature.)</span>

## I. Le joueur

On va commencer par amméliorer notre `player`.

### A. Les contrôles

Replongeons nous dans son code:

```gdscrit
extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity += get_gravity() * delta

    if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    var direction := Input.get_axis("ui_left", "ui_right")
    if direction:
        velocity.x = direction * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

    move_and_slide()

```

Il est souvent **recommandé** de **modifier les actions** de nos jeux et de ne pas simplement utiliser les actions par défauts <span style="color: var(--body-text-color-faded); font-size: .8em">(celles en "ui_*")</span>.

<br>

On se rend alors dans *Project -> Project Settings*. Puis on sélectionne l'onglet *Input Map*. Ensuite on viens renseigner le **nom** de notre **action** dans le champ *Add New Action* et on y paramètre les **touches associées**.

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-2.gif">

> <span style="color: var(--body-text-color-faded); font-size: .8em">Pour ajouter une touche, il suffit de cliquer sur ![Godot - Add](../../medias/godot-icons/Add.svg) puis d'appuyer sur la touche voulue.</span>

Voici la liste des actions et leurs touches que j'ai choisi d'utiliser:

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-3.png">

> <span style="color: var(--body-text-color-faded); font-size: .8em">Ici les touches **WAD** sont affichées au lieu de **ZQD** que j'ai utilisé parce que les touches sont enregistrées pour leur **position** sur le clavier et non leur valeur. Ça permet de jouer avec autant un clavier **AZERTY** que **QWERTY** sans avoir à modifier les touches.</span>

Il ne reste plus qu'à modifier le **nom des actions** dans notre code:

```gdscript
if Input.is_action_just_pressed("movement_jump") and is_on_floor():
    velocity.y = JUMP_VELOCITY
```

```gdscript
var direction := Input.get_axis("movement_left", "movement_right")
```

**Attention à ne pas oublier cette ligne de la scène** *interactable_computer*:

```gdscript
if event.is_action_pressed("action_interact") and player_inside:
    get_tree().call_group("interaction_wall", "toggle_open")
```

### B. Les animations

Maintenant qu'on peut contrôler notre personnage avec les touches ZQD et ESPACE, on vas mettre à jours ses **animations** en **raccord avec ses mouvements**.

<br>

On va retourner sur la ressource ![Godot - SpriteFrames](../../medias/godot-icons/SpriteFrames.svg) **SpriteFrames** de notre [![Godot - AnimatedSprite2D](../../medias/godot-icons/AnimatedSprite2D.svg) AnimatedSprite2D](#godot/nodes.md#animatedsprite2d) pour y créer les animations *"idle"* <span style="color: var(--body-text-color-faded); font-size: .8em">(immobile)</span> *"moving"* <span style="color: var(--body-text-color-faded); font-size: .8em">(en mouvement)</span> et *"dead"* <span style="color: var(--body-text-color-faded); font-size: .8em">(mort)</span>. Puis ont vas activé l'annimation idle en ![Godot - AutoPlay](../../medias/godot-icons/AutoPlay.svg) **autoplay**.

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-4.gif">

> <span style="color: var(--body-text-color-faded); font-size: .8em">J'avais oublié de le faire avant d'enregistrer le gif, mais pour une **meilleure animation** vous pouvez changer la **vitesse d'animation** à **10.0 FPS** au lieu de **5**.</span>



Ensuite on modifie le code de notre joueur pour **changer l'animation selon les conditions**.

```gdscript
extends CharacterBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity += get_gravity() * delta
    
    if Input.is_action_just_pressed("movement_jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY
    
    var direction := Input.get_axis("movement_left", "movement_right")
    if direction:
        velocity.x = direction * SPEED
        
        #Pour gérer l'animation
        if is_on_floor():
            animated_sprite_2d.play("moving")
        else:
            animated_sprite_2d.play("idle")
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)
        animated_sprite_2d.play("idle")
    
    move_and_slide()
```

Enfin on inverse le sens du sprite si le joueur vas vers la gauche.

```gdscript
var direction := Input.get_axis("movement_left", "movement_right")

if direction < 0:
    animated_sprite_2d.flip_h = true
elif direction > 0:
    animated_sprite_2d.flip_h = false
```

### C. Le saut

Il peut être très compliqué de créer un personnage joueur qui soit très agréable à contrôler. Mais pour tenter de rendre le saut un peu plus [juicy] on peut ajouter cette ligne de code:

```gdscript
elif Input.is_action_just_released("movement_jump") and not is_on_floor():
    if velocity.y < -100:
        velocity.y = move_toward(velocity.y, -20, SPEED)
```

Donc:

```gdscript
if Input.is_action_just_pressed("movement_jump") and is_on_floor():
    velocity.y = JUMP_VELOCITY
elif Input.is_action_just_released("movement_jump") and not is_on_floor():
    if velocity.y < -100:
        velocity.y = move_toward(velocity.y, -20, SPEED)
```

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-5.gif">

### D. La mort

Il n'est pas possible de **mourir**. Même si certains rêvent de l'immortalité, dans un jeu vidéo ce n'est **pas très fun**, surtout quand on tombe dans un **trou sans fond**.

<br>    

On va alors permettre à notre joueur de mourir ! <span style="color: var(--body-text-color-faded); font-size: .8em">(Trop bien)</span>

<br>

D'abord on déclare une nouvelle variable: <span style="color: var(--body-text-color-faded); font-size: .8em">(Pensez à le déclarer en haut du script)</span>

```gdscript
var dead := false
```

Puis on rajoute la fonction `die`:

```gdscript
func die() -> void:
    if dead: return
    dead = true
    
    await get_tree().create_timer(1).timeout
    get_tree().reload_current_scene()
    dead = false
```

Et enfin on empèche le joueur de bouger le personnage pendant qu'il est mort:

```gdscript
var direction := Input.get_axis("movement_left", "movement_right")

if dead: direction = 0

[...]

if direction:
    [code]
else:
    velocity.x = move_toward(velocity.x, 0, SPEED)
    
    # Pour gérer l'animation
    if dead:
        animated_sprite_2d.play("dead")
    else:
        animated_sprite_2d.play("idle")
```

<!-- #### Une tombe

Le [![Godot - TileSet](../../medias/godot-icons/TileSet.svg) TileSet](#ressources-suplementaires/lexique-game-dev.md#tileset) que nous utilisons est fourni avec une tombe, on va l'utiliser -->

## II. Les dangers

Maintenant il nous faut quelque chose qui va tuer le joueur. Pour cela on va utiliser une [![Godot - Area2D](../../medias/godot-icons/Area2D.svg) Area2D](#ressources-suplementaires/lexique-game-dev.md#area2d) qui nous permettra de **détecter le joueur** puis de le tuer.

<br>

On ne vas pas lui ajouter de [![Godot - CollisionShape2D](../../medias/godot-icons/CollisionShape2D.svg) CollisionShape2D](#godot/nodes.md#collisionshape2d), le but: pouvoir **changer la forme** de de la `KillZone` selon le besoin.

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-6.png">

Ensuite on lui ajoute un script ![Godot - ScriptCreate](../../medias/godot-icons/ScriptCreate.svg). 
<span style="color: var(--body-text-color-faded); font-size: .8em">(J'ai rangé la scène et le script dans le dossier */elements/*)

On connecte à notre script le ![Godot - Signal](../../medias/godot-icons/Signals.svg) **signal** `body_entered`, puis on modifie sa fonction.

```gdscript
func _on_body_entered(body: Node2D) -> void:
    if body.is_in_group("player"):
        body.die()
```

On teste si c'est bien le **joueur** qui a été **détecté**. Puis on le ***tue***.

### A. Le vide

Pour que le joueur ne se retrouve pas en train de **tomber indéfiniment** dans le vide, on va y mettre une `KillZone`.

Je rajoute à notre *killzone* une [![Godot - CollisionShape2D](../../medias/godot-icons/CollisionShape2D.svg) CollisionShape2D](#godot/nodes.md#collisionshape2d) qui a pour forme un ![Godot - WorldBoundaryShape2D](../../medias/godot-icons/WorldBoundaryShape2D.svg) **WorldBoundaryShape2D**.

> La forme ![Godot - WorldBoundaryShape2D](../../medias/godot-icons/WorldBoundaryShape2D.svg) **WorldBoundaryShape2D** permet de détecter tout ce qui dépasse une certaine coordonnée, c'est donc une sorte de trait infini.

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-7.gif">

### B. Le feu

Une autre solution aurait été de créer une **tuile de scène** que l'on ajoute à notre [![Godot - TileSet](../../medias/godot-icons/TileSet.svg) TileSet](#ressources-suplementaires/lexique-game-dev.md#tileset) comme ce que l'on a fait pour nos *InteractibleWall* et *InteractibleComputer*.

<br>

Donc on créé une nouvelle scène *Fire* avec pour racine un [![Godot - AnimatedSprite2D](../../medias/godot-icons/AnimatedSprite2D.svg) AnimatedSprite2D](#godot/nodes.md#animatedsprite2d).

<span style="color: var(--body-text-color-faded); font-size: .8em">Pour l'instant un AnimatedSprite est inutile et un Sprite serait suffisant, mais ça nous permettra plus tard d'animer le feu.

J'y ajoute égallement la *KillZone* pour que le feu puisse **tuer le joueur**.

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-8.png">

Maintenant on rajoute la scène *Fire* à notre [![Godot - TileSet](../../medias/godot-icons/TileSet.svg) TileSet](#ressources-suplementaires/lexique-game-dev.md#tileset) puis on remplace les anciennes tuiles de feu par nos scène.

<div class="side-by-side content">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-9.png">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-10.png">
</div>

Et si on **teste le jeu**:

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-11.gif">

## III. Plusieurs niveaux

Notre jeu commence à ressembler à quelque chose. Cependant, on aimerais pouvoir **passer de niveau en niveau**, pour cela, va faire appel aux portes.

### A. Les portes

Encore une fois, on va créer une nouvelle scène, vous connaissez la chanson: une scène [![Godot - Area2D](../../medias/godot-icons/Area2D.svg) Area2D](#ressources-suplementaires/lexique-game-dev.md#area2d) avec une [![Godot - CollisionShape2D](../../medias/godot-icons/CollisionShape2D.svg) CollisionShape2D](#godot/nodes.md#collisionshape2d), un [![Godot - AnimatedSprite2D](../../medias/godot-icons/AnimatedSprite2D.svg) AnimatedSprite2D](#godot/nodes.md#animatedsprite2d)un [![Godot - Label](../../medias/godot-icons/Label.svg) Label](#godot/nodes.md#label) et un script.

<div class="side-by-side">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-12.png">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-12-2.png">
</div>

On connecte les ![Godot - Signal](../../medias/godot-icons/Signals.svg) **signaux** `body_entered` et `body_exited`. Puis on y ajoute le code suivant:

```gdscript
extends Area2D


var player_inside := false

@onready var label_interaction: Label = $LabelInteraction


func _ready() -> void:
    label_interaction.hide()


func _on_body_entered(body: Node2D) -> void:
    if body.is_in_group("player"):
        label_interaction.show()
        player_inside = true


func _on_body_exited(body: Node2D) -> void:
    if body.is_in_group("player"):
        label_interaction.hide()
        player_inside = false


func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("action_interact") and player_inside:
        if get_tree().get_nodes_in_group("player")[0].has_key:
            print("Le joueur a la clé")
        else:
            print("Le joueur n'a pas la clé")

```

`get_tree().get_nodes_in_group("player")` retourne tous les nodes du groupe. Dans le groupe `player` on sait qu'il n'y a que notre joueur, donc on sélectionne le premier élément de la liste `[0]`.

> <span style="color: var(--body-text-color-faded); font-size: .8em">En programmation, une liste d'élément commence à `0`. Donc l'élément `2` de la liste `["banane", "pomme", "fraise", "kiwi"]` sera `"fraise"`. (On compte *[0, 1, 2, 3, ...]*)</span>

Et on va tester si la propriété `has_key` du joueur est `true`. On peut donc **ajouter cette variable à notre joueur**.

```gdscript
var dead := false
var has_key := false
```

On finira le code de la porte une fois qu'on aura un deuxième niveau et une clé.

### B. La clé

Pour ouvrir notre porte il nous faut une clé. Pour cela, on va encore utiliser une [![Godot - Area2D](../../medias/godot-icons/Area2D.svg) Area2D](#ressources-suplementaires/lexique-game-dev.md#area2d) en racine avec une [![Godot - CollisionShape2D](../../medias/godot-icons/CollisionShape2D.svg) CollisionShape2D](#godot/nodes.md#collisionshape2d) et un [![Godot - AnimatedSprite2D](../../medias/godot-icons/AnimatedSprite2D.svg) AnimatedSprite2D](#godot/nodes.md#animatedsprite2d) et un script.

<br>

Cette fois ci on a seulement besoin de son ![Godot - Signal](../../medias/godot-icons/Signals.svg) **signal** `body_entered`.

<div class="side-by-side content">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-13.png">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-14.png">
</div>

On y ajoute le **code** suivant:

```gdscript
func _on_body_entered(body: Node2D) -> void:
    if body.is_in_group("player"):
        body.has_key = true
        queue_free()
```

> La fonction `queue_free()` **supprime** le node: une fois que la clé est récupérée, on ne veut plus qu'elle soit visible.

On peut maintenant **remplacer** la porte de sortie par notre scène, et **ajouter la clé au niveau**. Ce qui devrais nous donner:

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-15.gif">

### C. Niveaux 1 et 2

On a maintenant **tout ce qu'il nous faut** pour faire un jeu à **multiples niveaux**.

<br>

On va renommer notre scène *Game* <span style="color: var(--body-text-color-faded); font-size: .8em">(le fichier *game.tscn*)</span> en *TestLevel* <span style="color: var(--body-text-color-faded); font-size: .8em">(*test_level.tscn*)</span>. Puis le ranger dans un dossier */levels/*.

<br>

Puis on va créer deux premiers niveaux qui vont chaqu'un contenir: un <span style="color: var(--body-text-color-faded); font-size: .8em">(ou plusieurs)</span> [![Godot - TileMapLayer](../../medias/godot-icons/TileMapLayer.svg) TileMapLayer](#godot/nodes.md#tilemaplayer), une scène ![Godot - CharacterBody2D](../../medias/godot-icons/CharacterBody2D.svg) *Player*, une [![Godot - Camera2D](../../medias/godot-icons/Camera2D.svg) Camera2D](#godot/nodes.md#camera2d) et une scène ![Godot - Area2D](../../medias/godot-icons/Area2D.svg) *ExitDoor*.

<div class="side-by-side one-to-two" style="grid-template-columns: 4fr 5fr;">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-16.png">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-17.png">
<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-18.png">
</div>

### D. Relier les niveaux

Retournons dans le code de la porte. On vas y ajouter une propriété exporté :

```gdscript
@export_file_path("*.tscn") var next_level: String
```

Ensuite, au moment où le joueur **intéragit avec la porte**, et si il a la clé, on va passer au **prochain niveau**:

```gdscript
func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("action_interact") and player_inside:
        if get_tree().get_nodes_in_group("player")[0].has_key:
            get_tree().change_scene_to_file(next_level)
        else:
            print("Le joueur n'a pas la clé")
```

Et maintenant on n'as plus qu'à mettre à jour la propriété *next_level* de nos portes.

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-19.gif">

**Testons ça !**

<img src="./medias/jeu-de-plateforme/plateformer-plus-loin-20.gif">


