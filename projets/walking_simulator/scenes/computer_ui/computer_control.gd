class_name ComputerControl
extends Control


signal stop_interacting


@onready var cursor: Sprite2D = %Cursor
@onready var opened_program: OpenedProgram = %OpenedProgram
@onready var program_btn: Button = %ProgramBtn


var cursor_pos: Vector2
var in_use: bool = false


func _ready() -> void:
	cursor_pos = cursor.position


func _unhandled_input(event: InputEvent) -> void:
	if get_parent().name == "root":
		if event is InputEventMouseMotion:
			cursor_pos += event.relative
			cursor_pos = cursor_pos.clamp(Vector2.ZERO, get_viewport_rect().size - Vector2(1, 1))
			cursor.position = cursor_pos


func _on_website_btn_pressed() -> void:
	OS.shell_open("https://rselaries.github.io/ateliers-gamejam#ateliers/decouverte.md")


func _on_get_up_btn_pressed() -> void:
	stop_interacting.emit()


func _on_opened_program_program_changed(new_program_name: String) -> void:
	if program_btn:
		program_btn.text = new_program_name


func _on_opened_program_program_closed() -> void:
	opened_program.hide()
	program_btn.hide()


func _on_program_opened(title: String, file: String) -> void:
	opened_program.program_scene = file
	opened_program.program_title = title
	opened_program.update_program()
	opened_program.show()
	program_btn.show()


func _on_program_btn_pressed() -> void:
	opened_program.visible = !opened_program.visible
