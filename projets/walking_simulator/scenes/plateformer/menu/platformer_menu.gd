extends Control


func _on_close_menu_btn_pressed() -> void:
	hide()
	ComputerControl.self_ref.hide_cursor()


func _on_quit_btn_pressed() -> void:
	if OpenedProgram.current_program is Platformer:
		OpenedProgram.close_program()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"platformer_menu"):
		show()
		ComputerControl.self_ref.show_cursor()
