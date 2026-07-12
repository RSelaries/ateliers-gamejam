extends MarginContainer


@export var window_menu: PackedScene

var hidden_number: int
var window_panel: bool = false
var response_id: int = 0

@onready var responses: Label = %Responses
@onready var responses_level: Label = %ResponsesLevel
@onready var hint_label: Label = %HintLabel
@onready var line_edit: LineEdit = %LineEdit
@onready var responses_id: Label = %ResponsesId
@onready var restart_button: Button = %RestartButton


func _ready() -> void:
	_reload_game()


func _on_line_edit_text_submitted(new_text: String) -> void:
	var response := int(new_text)
	line_edit.text = ""
	_add_response(response)


func _reload_game() -> void:
	restart_button.hide()
	line_edit.editable = true
	hidden_number = randi_range(0, 100)
	hint_label.text = "Devine le nombre"
	responses.text = ""
	responses_level.text = ""
	responses_id.text = ""
	response_id = 0
	print("Hidden number = %s" % hidden_number)


func win_game() -> void:
	line_edit.editable = false
	restart_button.show()


func _add_response(response: int) -> void:
	response_id += 1
	
	var response_level: String
	if response > hidden_number:
		response_level = "↓"
	elif response < hidden_number:
		response_level = "↑"
	else:
		response_level = "🗸"
		win_game()
	
	var new_line := "" if response_id == 1 else "\n"
	responses_id.text = "%s." % response_id + new_line + responses_id.text
	responses.text = "%s" % response + new_line + responses.text
	responses_level.text = response_level + new_line + responses_level.text


func _on_restart_button_pressed() -> void:
	_reload_game()
