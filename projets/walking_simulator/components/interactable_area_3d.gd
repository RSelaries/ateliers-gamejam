@icon("res://assets/icons/InteractableArea3D.svg")
class_name InteractableArea3D
extends Area3D


## Signal émit au moment où le joueur intéragit avec ce composant.
signal interaction_started(by: Node3D)
## Signal émit au moment où le joueur arrête d'intéragir avec ce composant.
signal interaction_ended(by: Node3D)
## Signal émit au moment où le joueur regarde ce composant.
signal focus_gained
## Signal émit au moment où le joueur arrête de regarder ce composant.
signal focus_lost


@export var interaction_name: String = "Intéragir"


## Si [code]true[/code]: le joueur regarde ce composant.
var focused: bool = false:
	set = _set_focused


## Appeler cette fonction pour intéragir avec ce composant.
func start_interacting(by: Node3D) -> void:
	interaction_started.emit(by)


## Appeler cettte fonction pour arrêter d'intéragir avec ce composant.
func stop_interaction(by: Node3D) -> void:
	interaction_ended.emit(by)


# Setter de focused
func _set_focused(new_value: bool) -> void:
	focused = new_value
	if new_value:
		focus_gained.emit()
		Player.interaction_label.text = interaction_name
	else:
		focus_lost.emit()
