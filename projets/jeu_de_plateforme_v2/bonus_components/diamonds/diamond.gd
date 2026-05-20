extends Area2D


@onready var coin_sound: AudioStreamPlayer = %CoinSound


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		PlayerManager.add_diamond()
		coin_sound.play()
		hide()
		await coin_sound.finished
		queue_free()
