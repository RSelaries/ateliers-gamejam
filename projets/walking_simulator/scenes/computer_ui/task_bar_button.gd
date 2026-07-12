class_name TaskBarButton
extends Button


func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		grab_focus()
	else:
		release_focus()
