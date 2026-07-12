extends Area3D


@export var height_offset: float = 8.0


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	var player := body as Player
	
	if player:
		player.position.y += height_offset
