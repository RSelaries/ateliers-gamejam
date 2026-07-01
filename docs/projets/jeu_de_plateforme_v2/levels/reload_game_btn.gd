extends Button


@export_file_path("*.tscn") var scene: String


func _pressed() -> void:
	get_tree().change_scene_to_file(scene)
