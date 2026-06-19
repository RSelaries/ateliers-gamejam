extends InteractableArea3D


@onready var bouton: MeshInstance3D = %Bouton
@onready var gpu_particles_3d: GPUParticles3D = %GPUParticles3D
@onready var bouton_outline: MeshInstance3D = %BoutonOutline


func _ready() -> void:
	bouton_outline.hide()


func _interacted_with() -> void:
	var tween := get_tree().create_tween()
	tween.tween_property(bouton, ^"position:y", bouton.position.y - 0.04, 0.05)
	gpu_particles_3d.restart()
	collision_layer = 0
	await gpu_particles_3d.finished
	collision_layer = 2
	tween = get_tree().create_tween()
	tween.tween_property(bouton, ^"position:y", bouton.position.y + 0.04, 0.2)


func _focused() -> void:
	bouton_outline.show()


func _unfocused() -> void:
	bouton_outline.hide()
