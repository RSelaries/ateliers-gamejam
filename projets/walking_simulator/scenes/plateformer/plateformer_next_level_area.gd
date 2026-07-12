class_name PlateformerNextLevelArea
extends Area2D


@export_file("*.tscn") var to_level: String
@export var transition: bool = true


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body is PlateformerPlayer and to_level:
		Plateformer.change_level(to_level, transition)
