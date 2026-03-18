extends Control


@onready var reference_label: Label = $Label
@onready var reference_line_edit: LineEdit = $LineEdit

var nombre_mystere: int


func _ready() -> void:
	nombre_mystere = randi_range(0, 100)


func _on_line_edit_text_submitted(new_text: String) -> void:
	reference_line_edit.text = ""
	
	var reponse_joueur: int = int(new_text)
	
	if reponse_joueur > nombre_mystere:
		reference_label.text = "Plus petit!"
	elif reponse_joueur < nombre_mystere:
		reference_label.text = "Plus grand!"
	else:
		reference_label.text = "Trouvé!"
