class_name MeleeWeapon
extends Weapon


func use() -> void:
	$AnimationPlayer.play("attack")

func stop_using() -> void:
	pass
