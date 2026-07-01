class_name NextLevelArea
extends Area2D


@export_file_path("*.tscn") var to_level: String


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		if owner is Level:
			var _owner := owner as Level
			_owner.change_to_scene(to_level)
