extends Button


@onready var start_menu: PopupMenu = $StartMenu


func _toggled(_toggled_on: bool) -> void:
	pass
	
	#if toggled_on:
		#start_menu.popup()
		#start_menu.position = Vector2i(int(global_position.x) + 1, int(global_position.y - start_menu.size.y - 1))
	#elif start_menu.visible:
		#start_menu.hide()
