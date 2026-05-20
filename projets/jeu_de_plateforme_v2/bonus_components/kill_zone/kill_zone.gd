class_name KillZone
extends Area2D


func _ready() -> void:
	body_entered.connect(func(body: Node2D):
		if body.is_in_group(&"player"):
			PlayerManager.hurt(1000)
	)
