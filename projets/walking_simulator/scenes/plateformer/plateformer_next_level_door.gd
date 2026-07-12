class_name PlateformerNextLevelDoor
extends Area2D


@export_file("*.tscn") var to_level: String
@export var transition: bool = true


var player_inside: bool = false


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body is PlateformerPlayer:
		player_inside = true


func _on_body_exited(body: Node2D) -> void:
	if body is PlateformerPlayer:
		player_inside = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"plateformer_up") and player_inside and to_level:
		Plateformer.change_level(to_level, transition)
