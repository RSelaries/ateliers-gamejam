@tool
extends PanelContainer


@export var close_button := true
@export var can_drag: bool = true
@export var icon: Texture2D


var held: bool = false
var hold_offset: Vector2i

var popup_window: Popup:
	get():
		var parent := get_parent()
		while parent is not Window:
			parent = parent.get_parent()
		return parent as Popup


func _ready() -> void:
	var hbox := find_child("HBoxContainer") as HBoxContainer
	var window_name: RichTextLabel
	var window_icon: TextureRect
	var close_btn: TextureButton
	
	if hbox:
		window_name = hbox.find_child("WindowName") as RichTextLabel
		window_icon = hbox.find_child("MarginContainer").find_child("WindowIcon") as TextureRect
		close_btn = hbox.find_child("MarginContainer2").find_child("CloseButton")
	
	if window_icon:
		if icon:
			window_icon.texture = icon 
		else:
			window_icon.hide()
	if window_name:
		if popup_window:
			popup_window.visibility_changed.connect(func(): window_name.text = get_window().title)
		else:
			window_name.text = get_window().title
	if close_btn:
		if not close_button:
			close_btn.hide()
	


func _gui_input(event: InputEvent) -> void:
	if Engine.is_editor_hint(): return
	if not can_drag: return
	
	var mouse_btn := event as InputEventMouseButton
	if mouse_btn and mouse_btn.button_index == MOUSE_BUTTON_LEFT:
		held = mouse_btn.pressed
		hold_offset = get_global_mouse_position()


func _process(_delta: float) -> void:
	if Engine.is_editor_hint(): return
	
	if held:
		var mouse_pos := Vector2i(get_global_mouse_position())
		get_window().position += mouse_pos - hold_offset
	
	if get_window().has_focus():
		theme_type_variation = &"WindowTopPanelSelected"
	else:
		theme_type_variation = &"WindowTopPanel"
