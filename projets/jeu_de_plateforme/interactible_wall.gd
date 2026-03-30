extends StaticBody2D


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var opened := false


func toggle_open() -> void:
	if opened:
		collision_shape_2d.disabled = false
		animated_sprite_2d.play("closed")
		opened = false
	else:
		collision_shape_2d.disabled = true
		animated_sprite_2d.play("opened")
		opened = true
