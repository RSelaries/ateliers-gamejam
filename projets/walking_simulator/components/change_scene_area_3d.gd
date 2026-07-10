class_name ChangeSceneArea3D
extends InteractableArea3D


@export_file("*.tscn") var target_scene: String


func start_interacting() -> void:
	super()
	get_tree().change_scene_to_file(target_scene)
