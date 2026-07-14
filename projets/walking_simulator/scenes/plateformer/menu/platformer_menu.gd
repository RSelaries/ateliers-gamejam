extends Control



func _on_close_menu_btn_pressed() -> void:
	hide()
	ComputerControl.self_ref.hide_cursor()
