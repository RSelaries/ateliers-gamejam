extends Node3D


@onready var computer_camera: Camera3D = %ComputerCamera
@onready var computer_control: ComputerControl = %ComputerControl
@onready var computer_screen: SubViewport = %ComputerScreen
@onready var computer_screen_sprite: Sprite3D = %ComputerScreenSprite
@onready var computer_flat: CanvasLayer = %ComputerFlat


var in_use: bool = false
var in_transition: bool = false


func _ready() -> void:
	computer_control.stop_interacting.connect(_stop_using_computer)
	_use_computer(false)


func _use_computer(transition: bool = true) -> void:
	if in_transition: return
	
	Player.can_move = false
	Player.can_interact = false
	Player.can_move_camera = false
	
	computer_camera.make_current()
	
	if transition:
		in_transition = true
		var target_pos := computer_camera.global_position
		var target_rot := computer_camera.global_rotation
		var target_fov := computer_camera.fov
		
		computer_camera.global_position = Player.camera.global_position
		computer_camera.global_rotation = Player.camera.global_rotation
		computer_camera.fov = Player.camera.fov
		
		var tween := get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property(computer_camera, ^"global_position", target_pos, 0.5)
		tween.tween_property(computer_camera, ^"global_rotation", target_rot, 0.5)
		tween.tween_property(computer_camera, ^"fov", target_fov, 0.5)
		await tween.finished
		in_transition = false
	
	_billboard(true)
	in_use = true
	computer_control.in_use = true


func _stop_using_computer(transition: bool = true) -> void:
	if in_transition: return
	
	_billboard(false)
	in_use = false
	computer_control.in_use = false
	
	var default_pos := computer_camera.global_position
	var default_rot := computer_camera.global_rotation
	var default_fov := computer_camera.fov
	
	if transition:
		in_transition = true
		var tween := get_tree().create_tween()
		tween.parallel().tween_property(computer_camera, ^"global_position", Player.camera.global_position, 0.5)
		tween.parallel().tween_property(computer_camera, ^"global_rotation", Player.camera.global_rotation, 0.5)
		tween.parallel().tween_property(computer_camera, ^"fov", Player.camera.fov, 0.5)
		await tween.finished
		in_transition = false
	
	Player.camera.make_current()
	Player.can_move = true
	Player.can_interact = true
	Player.can_move_camera = true
	
	computer_camera.global_position = default_pos
	computer_camera.global_rotation = default_rot
	computer_camera.fov = default_fov


func _on_interactable_area_3d_interaction_started(_by: Node) -> void:
	_use_computer()


func _input(event: InputEvent) -> void:
	if not in_use: return
	if in_transition: return
	
	get_viewport().set_input_as_handled()
	if event is InputEventMouse:
		event.position = computer_control.cursor_pos
		event.global_position = computer_control.cursor_pos
	if event is InputEventMouseMotion:
		computer_control.cursor_pos += event.relative
		computer_control.cursor_pos = computer_control.cursor_pos.clamp(Vector2.ZERO, computer_screen.size - Vector2i(1, 1))
		computer_control.cursor.position = computer_control.cursor_pos
	computer_screen.push_input(event)


func _billboard(billboarded: bool = true) -> void:
	computer_screen_sprite.visible = not billboarded
	computer_flat.visible = billboarded
