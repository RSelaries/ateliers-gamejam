extends Node3D


@onready var door_hinge: Node3D = %DoorHinge


var opened: bool = false


func open() -> void:
	# Un Tween permet d'animer une propriété
	var tween := get_tree().create_tween()
	# Ici, j'anime la rotation du node DoorHinge de sa valeur actuelle jusqu'à 92°.
	# L'animation dure 0.2 secondes.
	tween.tween_property(door_hinge, ^"rotation_degrees:y", 92.0, 0.2)
	opened = true


func close() -> void:
	var tween := get_tree().create_tween()
	tween.tween_property(door_hinge, ^"rotation_degrees:y", 0.0, 0.2)
	opened = false


func toggle() -> void:
	if opened:
		close()
	else:
		open()
