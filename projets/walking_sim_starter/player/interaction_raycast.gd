extends RayCast3D


var focused_interactable_area: InteractableArea3D


func _physics_process(_delta: float) -> void:
	var collider := get_collider() as InteractableArea3D
	
	if collider and collider != focused_interactable_area:
		focused_interactable_area = collider
		focused_interactable_area.focused = true
	elif not collider and focused_interactable_area:
		focused_interactable_area.focused = false
		focused_interactable_area = null


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if focused_interactable_area:
			focused_interactable_area.start_interacting()
	elif event.is_action_released("interact"):
		if focused_interactable_area:
			focused_interactable_area.stop_interaction()
