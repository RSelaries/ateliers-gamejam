extends HBoxContainer


@onready var input_grabber: Control = %InputGrabber
@onready var popup: PanelContainer = %Popup


func _on_help_btn_pressed() -> void:
	input_grabber.show()
	popup.show()


func _on_close_help_btn_pressed() -> void:
	input_grabber.hide()
	popup.hide()


func _on_input_grabber_gui_input(_event: InputEvent) -> void:
	input_grabber.hide()
	popup.hide()
