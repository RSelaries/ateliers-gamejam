extends Control


@onready var pause_menu: CenterContainer = %PauseMenu
@onready var options_menu: MarginContainer = %OptionsMenu


func _ready() -> void:
	hide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_menu"):
		get_tree().paused = true
		show()
		pause_menu.show()
		options_menu.hide()


func _on_resume_btn_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_quit_btn_pressed() -> void:
	get_tree().quit()


func _on_options_btn_pressed() -> void:
	pause_menu.hide()
	options_menu.show()
