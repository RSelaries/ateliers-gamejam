extends Node3D


@export var can_be_opened: bool = true
@export var bilateral: bool = true

var _opened: bool = false
var in_transition: bool = false:
	set(value):
		in_transition = value
		collision_shape_3d.disabled = value

@onready var door: MeshInstance3D = $AppartmentDoor/AppartmentDoorFrame/AppartmentDoor_001
@onready var collision_shape_3d: CollisionShape3D = %CollisionShape3D


func open() -> void:
	if in_transition: return
	
	_opened = true
	
	var player_z_pos := to_local(Player.current_player.global_position).z
	var in_front: bool = player_z_pos >= 0.0
	var rot_amount := 98 if not in_front and bilateral else -98
	
	in_transition = true
	var tween = create_tween()
	tween.tween_property(door, ^"rotation_degrees:y", rot_amount, 0.5)
	await tween.finished
	in_transition = false


func close() -> void:
	if in_transition: return
	
	_opened = false
	in_transition = true
	var tween = create_tween()
	tween.tween_property(door, ^"rotation_degrees:y", 0, 0.5)
	await tween.finished
	in_transition = false


func toggle() -> void:
	if _opened: close()
	else: open()


func is_opened() -> bool: return _opened


func _on_interaction_started(_by: Node3D) -> void:
	toggle()
