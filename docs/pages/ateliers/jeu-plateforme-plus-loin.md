# Jeu de plateforme. Aller plus loin

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