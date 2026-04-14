class_name FirearmWeapon
extends Weapon


@export var animation_player: AnimationPlayer
@export var bullet: PackedScene = preload("uid://b50uwii3uqtos")

@export var bullet_origin_point: Node2D


func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())


func use() -> void:
	animation_player.play("shoot")

func stop_using() -> void:
	pass


func shoot() -> void:
	var new_bullet: Node2D = bullet.instantiate()
	add_child(new_bullet)
	new_bullet.global_position = bullet_origin_point.global_position
	new_bullet.global_rotation = bullet_origin_point.global_rotation
