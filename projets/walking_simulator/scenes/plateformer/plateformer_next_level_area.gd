class_name PlatformerNextLevelArea
extends Area2D


@export_file("*.tscn") var to_level: String
@export var transition: bool = true


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body is PlatformerPlayer and to_level:
		Platformer.change_level(to_level, transition)
