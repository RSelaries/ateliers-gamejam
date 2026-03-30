extends Area2D


@onready var label_interaction: Label = $LabelInteraction


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
	if event.is_action_pressed("ui_up") and player_inside:
		get_tree().call_group("interaction_wall", "toggle_open")
