extends Area2D


@export_file_path("*.tscn") var to_level: String


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label


var player_inside: bool = false


func _ready() -> void:
	label.hide()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		label.show()
		player_inside = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		label.hide()
		player_inside = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"interact") and player_inside:
		animated_sprite_2d.play(&"opening")
		await animated_sprite_2d.animation_finished
		get_tree().change_scene_to_file(to_level)
