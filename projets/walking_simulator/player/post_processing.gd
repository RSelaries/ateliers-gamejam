@tool
extends Node


@export var disable_in_editor: bool = true:
	set(value):
		disable_in_editor = value
		_update_child_visible()


func _ready() -> void:
	_update_child_visible()


func _update_child_visible() -> void:
	if Engine.is_editor_hint() and disable_in_editor:
		_child_visible(false)
	else:
		_child_visible(true)


func _child_visible(visible: bool) -> void:
	for child in get_children():
		if "visible" in child:
			child.visible = visible
