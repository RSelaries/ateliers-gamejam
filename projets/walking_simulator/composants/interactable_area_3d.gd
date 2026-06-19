@icon("uid://bf7ixnig6obi7")
class_name InteractableArea3D
extends Area3D

@export_group("Animation")
## Une référence vers le node [class AnimationPlayer] qui va jouer les animations.
@export var animation_player: AnimationPlayer
## Le nom de l'animation qui va être jouée au moment où le joueur intéragit avec cet [param InteractableArea3D].
@export var on_interact_animation: StringName
## Le nom de l'animation qui va être jouée au moment où le joueur vise cet [param InteractableArea3D].
@export var on_focused_animation: StringName
## Le nom de l'animation qui va être jouée au moment où le joueur ne vise plus cet [param InteractableArea3D].
@export var on_unfocused_animation: StringName


var focused: bool = false:
	set = _set_focused


func _interacted_with() -> void: pass
func _focused() -> void: pass
func _unfocused() -> void: pass


func _init() -> void:
	collision_layer = 2


func interact() -> void:
	if animation_player and on_interact_animation:
		animation_player.play(on_interact_animation)
	_interacted_with()


func _set_focused(value: bool) -> void:
	focused = value
	if value:
		if animation_player and on_focused_animation:
			animation_player.play(on_focused_animation)
		_focused()
	else:
		if animation_player and on_unfocused_animation:
			animation_player.play(on_unfocused_animation)
		_unfocused()
