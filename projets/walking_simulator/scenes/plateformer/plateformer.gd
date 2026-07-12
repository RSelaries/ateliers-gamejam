class_name Plateformer
extends Node


static var in_transition: bool = false
static var current_level: Node2D
static var self_ref: Plateformer


var stretch_shrink: int = 2


@onready var transition_rect: ColorRect = %TransitionRect


static func change_level(to_level: Variant, transition: bool = true) -> void:
	var next_level_scene: PackedScene = load(to_level)
	var next_level: Node = next_level_scene.instantiate()
	
	if transition:
		in_transition = true
		self_ref.transition_rect.show()
		self_ref.transition_rect.color = Color(0, 0, 0, 0)
		var tween = self_ref.create_tween()
		tween.set_ease(Tween.EASE_IN)
		tween.tween_property(self_ref.transition_rect, ^"color", Color(0, 0, 0, 1), 0.5)
		await tween.finished
	
	if current_level:
		current_level.queue_free()
	
	current_level = next_level
	self_ref.add_child(next_level)
	
	if transition:
		var tween = self_ref.create_tween()
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self_ref.transition_rect, ^"color", Color(0, 0, 0, 0), 0.5)
		await tween.finished
		self_ref.transition_rect.hide()
		in_transition = false


func _ready() -> void:
	current_level = get_child(0)
	self_ref = self
