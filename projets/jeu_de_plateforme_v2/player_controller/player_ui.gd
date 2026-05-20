extends CanvasLayer


@onready var heart_1: TextureRect = %Heart1
@onready var heart_2: TextureRect = %Heart2
@onready var heart_3: TextureRect = %Heart3
@onready var diamond_counter: Label = %DiamondCounter


func _ready() -> void:
	PlayerManager.diamond_count_changed.connect(_on_diamond_count_changed)
	PlayerManager.health_changed.connect(_on_health_changed)
	show()


func _on_diamond_count_changed() -> void:
	diamond_counter.text = "%03d" % PlayerManager.diamond_count


func _on_health_changed() -> void:
	var health := PlayerManager.health
	
	heart_3.visible = health == 3
	heart_2.visible = health >= 2
	heart_1.visible = health >= 1
