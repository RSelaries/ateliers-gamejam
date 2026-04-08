extends CharacterBody2D


@onready var hurt_box: HurtBox = $HurtBox
@onready var label: Label = $Label


func _ready() -> void:
	label.hide()
	
	hurt_box.damage_received.connect(take_damage)


func take_damage(damage_amount: float) -> void:
	label.text = "-%d HP" % damage_amount
	label.show()
	await get_tree().create_timer(.5).timeout
	label.hide()
