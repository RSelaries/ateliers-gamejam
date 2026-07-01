extends Node


@onready var popup: Popup = %Popup


func _ready() -> void:
	popup.visibility_changed.connect(func(): print(popup.visible))


func close() -> void:
	pass


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		await get_tree().process_frame
		popup.popup_centered(Vector2(300, 200))


func _on_no_button_pressed() -> void:
	popup.hide()


func _on_yes_button_pressed() -> void:
	JavaScriptBridge.eval("console.log(document)")
	get_tree().quit()
