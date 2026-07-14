extends HBoxContainer


@onready var input_grabber: Control = %InputGrabber
@onready var popup: PanelContainer = %Popup
@onready var help_btn: Button = %HelpBtn
@onready var restart_button: Button = %RestartButton


func _on_help_btn_pressed() -> void:
	input_grabber.show()
	popup.show()
	help_btn.release_focus()


func _on_close_help_btn_pressed() -> void:
	input_grabber.hide()
	popup.hide()


func _on_input_grabber_gui_input(_event: InputEvent) -> void:
	input_grabber.hide()
	popup.hide()


func _on_restart_button_pressed() -> void:
	Platformer.change_level(Platformer.self_ref.start_level)
	restart_button.release_focus()
