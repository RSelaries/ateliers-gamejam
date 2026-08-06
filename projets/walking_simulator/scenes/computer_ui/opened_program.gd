class_name OpenedProgram
extends PanelContainer


signal program_changed(new_program_name: String)
signal program_closed


static var self_ref: OpenedProgram
static var current_program: Node


@export var program_title: String
@export_file("*.tscn") var program_scene: String


@onready var window_title_panel: Label = %WindowTitlePanel
@onready var program_viewport: SubViewport = %ProgramViewport
@onready var window_menu: MarginContainer = %WindowMenu
@onready var window_inside_panel: PanelContainer = %WindowInsidePanel
@onready var sub_viewport_container: SubViewportContainer = %SubViewportContainer


func _ready() -> void:
	self_ref = self


func update_program() -> void:
	window_menu.hide()
	window_inside_panel.theme_type_variation = &"WindowInsidePanel"
	sub_viewport_container.stretch_shrink = 1
	
	if window_title_panel:
		window_title_panel.text = program_title
	if program_viewport:
		for child in program_viewport.get_children():
			child.queue_free()
	
	if program_scene and program_viewport:
		var program: PackedScene = load(program_scene)
		if program:
			var program_inst := program.instantiate()
			current_program = program_inst
			program_viewport.add_child(program_inst)
			
			# Program Settings
			if "window_menu" in program_inst:
				var window_menu_scene := program_inst["window_menu"] as PackedScene
				if window_menu_scene:
					var window_menu_inst := window_menu_scene.instantiate()
					for child in window_menu.get_children():
						child.queue_free()
					window_menu.add_child(window_menu_inst)
					window_menu.show()
			if "window_panel" in program_inst:
				var window_panel := program_inst["window_panel"] as bool
				if window_panel == false:
					window_inside_panel.theme_type_variation = &"EmptyPanel"
			if "stretch_shrink" in program_inst:
				var stretch_shrink := program_inst["stretch_shrink"] as int
				if stretch_shrink:
					sub_viewport_container.stretch_shrink = stretch_shrink
	
	program_changed.emit(program_title)


func _on_close_window_button_pressed() -> void:
	close_program()


static func close_program() -> void:
	if self_ref.program_viewport:
		for child in self_ref.program_viewport.get_children():
			child.queue_free()
		for child in self_ref.window_menu.get_children():
			child.queue_free()
	current_program = null
	self_ref.program_closed.emit()
