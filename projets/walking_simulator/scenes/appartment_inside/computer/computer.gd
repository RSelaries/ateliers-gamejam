extends Node3D


@onready var computer_camera: Camera3D = %ComputerCamera
@onready var computer_control: ComputerControl = %ComputerControl
@onready var computer_screen: SubViewport = %ComputerScreen


var in_use: bool = false


func _use_computer() -> void:
	in_use = true
	computer_control.in_use = true
	Player.can_move = false
	Player.can_interact = false
	Player.can_move_camera = false
	
	var target_pos := computer_camera.global_position
	var target_rot := computer_camera.global_rotation
	var target_fov := computer_camera.fov
	
	computer_camera.global_position = Player.camera.global_position
	computer_camera.global_rotation = Player.camera.global_rotation
	computer_camera.fov = Player.camera.fov
	
	computer_camera.make_current()
	
	var tween := get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(computer_camera, ^"global_position", target_pos, 0.5)
	tween.tween_property(computer_camera, ^"global_rotation", target_rot, 0.5)
	tween.tween_property(computer_camera, ^"fov", target_fov, 0.5)


func _stop_using_computer() -> void:
	in_use = false
	computer_control.in_use = false
	Player.can_move = true
	Player.can_interact = true
	Player.can_move_camera = true
	Player.camera.make_current()


func _on_interactable_area_3d_interaction_started() -> void:
	_use_computer()


func _input(event: InputEvent) -> void:
	if not in_use: return
	
	if event.is_action_pressed(&"ui_cancel"):
		_stop_using_computer()
	
	get_viewport().set_input_as_handled()
	if event is InputEventMouse:
		event.position = computer_control.cursor_pos
		event.global_position = computer_control.cursor_pos
	computer_screen.push_input(event)
