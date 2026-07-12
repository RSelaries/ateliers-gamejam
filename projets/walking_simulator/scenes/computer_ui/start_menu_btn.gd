extends TaskBarButton


@onready var start_menu: PanelContainer = %StartMenu
@onready var start_menu_input_grabber: Control = %StartMenuInputGrabber


func _ready() -> void:
	start_menu.visible = button_pressed
	start_menu_input_grabber.visible = button_pressed
	start_menu_input_grabber.gui_input.connect(_on_grabber_gui_input)


func _toggled(toggled_on: bool) -> void:
	super(toggled_on)
	start_menu.visible = toggled_on
	start_menu_input_grabber.visible = toggled_on



func _on_grabber_gui_input(_event: InputEvent) -> void:
	button_pressed = false
