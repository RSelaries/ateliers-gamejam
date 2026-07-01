extends EnemyCharacter


@onready var label: Label = $Label


func _ready() -> void:
	super()
	label.text = ""


func _damage_received(damage_amount: int) -> void:
	super(damage_amount)
	label.text = "-%d HP" % damage_amount
	await get_tree().create_timer(0.5).timeout
	label.text = ""
