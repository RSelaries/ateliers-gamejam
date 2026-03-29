extends Control


@onready var reference_label: Label = $CenterContainer/VBoxContainer/Label
@onready var reference_line_edit: LineEdit = $CenterContainer/VBoxContainer/LineEdit
@onready var button: Button = $CenterContainer/VBoxContainer/Button

var nombre_mystere: int


func _ready() -> void:
	nombre_mystere = randi_range(0, 100)
	button.hide()


func _on_line_edit_text_submitted(new_text: String) -> void:
	reference_line_edit.text = ""
	
	var reponse_joueur: int = int(new_text)
	
	if reponse_joueur > nombre_mystere:
		reference_label.text = "Plus petit!"
	elif reponse_joueur < nombre_mystere:
		reference_label.text = "Plus grand!"
	else:
		reference_label.text = "Trouvé!"
		button.show()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
