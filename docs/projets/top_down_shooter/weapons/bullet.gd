extends HitBox


func _ready() -> void:
	super()
	body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	global_position += Vector2.RIGHT.rotated(global_rotation) * 600.0 * delta


func _on_damage_dealt() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		queue_free()
