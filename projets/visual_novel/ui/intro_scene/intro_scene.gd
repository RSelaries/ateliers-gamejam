@tool
extends Control


@onready var gradient: TextureRect = %Gradient


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var _gradient := gradient.texture as GradientTexture2D	
	_gradient.fill_from.x += 0.5 * delta
	_gradient.fill_to.x += 0.5 * delta
