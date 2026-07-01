class_name HurtBox
extends Area2D


@warning_ignore("unused_signal")
signal damage_received(damage_amount: int)


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D) -> void:
	if area is HitBox:
		damage_received.emit(area.damages)
		area.damage_dealt.emit()
