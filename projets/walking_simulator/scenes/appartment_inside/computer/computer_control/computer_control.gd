class_name ComputerControl
extends Control


@onready var cursor: Sprite2D = %Cursor


var cursor_pos: Vector2
var in_use: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"release_mouse"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if event is InputEventMouseMotion:
		cursor_pos += event.relative
		cursor_pos = cursor_pos.clamp(Vector2.ZERO, get_viewport_rect().size - Vector2(1, 1))
		cursor.position = cursor_pos


func _on_website_btn_pressed() -> void:
	OS.shell_open("https://rselaries.github.io/ateliers-gamejam")
