class_name HitBox
extends Area2D


@warning_ignore("unused_signal")
signal damage_dealt


@export var damages: int = 5


func _ready() -> void:
	damage_dealt.connect(_on_damage_dealt)


func _on_damage_dealt() -> void:
	pass
