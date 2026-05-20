@tool
class_name Level
extends Node2D


const TRANSITION_DURATION = 1.0


var in_transition := false


@export var transition_rect: ColorRect:
	set(value):
		transition_rect = value
		update_configuration_warnings()


func _ready() -> void:
	if transition_rect:
		in_transition = true
		transition_rect.show()
		transition_rect.color = Color(0, 0, 0, 1)
		var tween := get_tree().create_tween()
		tween.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUART)
		tween.tween_property(transition_rect, "color", Color(0, 0, 0, 0), TRANSITION_DURATION)
		tween.tween_property(self, "in_transition", false, 0.0)


func change_to_scene(scene_file: String) -> void:
	if transition_rect:
		transition_rect.color = Color(0, 0, 0, 0)
		transition_rect.show()
		var tween := get_tree().create_tween()
		tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
		tween.tween_property(transition_rect, "color", Color(0, 0, 0, 1), TRANSITION_DURATION)
		await get_tree().create_timer(TRANSITION_DURATION).timeout
	
	get_tree().change_scene_to_file(scene_file)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []
	
	if not transition_rect:
		warnings.append("A transition rect must be provided.")
	
	return warnings
