class_name FirearmWeapon
extends Weapon


@export var animation_player: AnimationPlayer
@export var bullet: PackedScene = preload("uid://b50uwii3uqtos")

@export var bullet_origin_point: Node2D


func use() -> void:
	pass

func stop_using() -> void:
	pass
