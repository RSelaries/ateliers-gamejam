extends Area2D


@onready var label_interaction: Label = %LabelInteraction
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var player_inside := false


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
		animated_sprite_2d.hide()
		label_interaction.text = "Vous avez trouvé le secret !"
		await get_tree().create_timer(4.0).timeout
