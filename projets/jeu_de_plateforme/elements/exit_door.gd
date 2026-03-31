extends Area2D


@export_file_path("*.tscn") var next_level: String

var player_inside := false

@onready var label_interaction: Label = $LabelInteraction
#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


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
			get_tree().change_scene_to_file(next_level)
		else:
			print("Le joueur n'a pas la clé")
