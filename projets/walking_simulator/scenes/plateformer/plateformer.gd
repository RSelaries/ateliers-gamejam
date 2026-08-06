class_name Platformer
extends Node


static var in_transition: bool = false
static var current_level: Node2D
static var current_level_path: String
static var self_ref: Platformer


@export_file("*.tscn") var start_level: String
@export var window_menu: PackedScene


var stretch_shrink: int = 2


@onready var transition_rect: ColorRect = %TransitionRect
@onready var background: ColorRect = $Background
@onready var platformer_menu: Control = %PlatformerMenu


static func change_level(to_level: String, transition: bool = true) -> void:
	current_level_path = to_level
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


static func reload_level() -> void:
	change_level(current_level_path)


func _ready() -> void:
	self_ref = self
	platformer_menu.hide()
	change_level(start_level)
	ComputerControl.self_ref.hide_cursor()


func _exit_tree() -> void:
	ComputerControl.self_ref.show_cursor()


func _process(_delta: float) -> void:
	if current_level:
		if ComputerControl.cursor_visible:
			current_level.process_mode = Node.PROCESS_MODE_DISABLED
		else:
			current_level.process_mode = Node.PROCESS_MODE_INHERIT
