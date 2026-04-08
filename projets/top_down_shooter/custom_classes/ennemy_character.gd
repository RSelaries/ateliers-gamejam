class_name EnemyCharacter
extends CharacterBody2D


@export_group("Health")
## Si [param health_enabled] est [code]false[/code], alors l'ennemi sera [b]immortel[/b].
@export_custom(PROPERTY_HINT_GROUP_ENABLE, "") var health_enabled: bool = true
@export var max_health: int = 20
@export var hurt_box: HurtBox
@export var health_bar: Range
## Si [param health_bar_on_damage] est [code]true[/code], alors la [param health_bar] est cachée. Elle devient visible au moment où l'enemi subit un dégat.\nSi [code]false[/code], la [param health_bar] est visible dès le début.
@export var health_bar_on_damage: bool = true


@onready var current_health: int = max_health:
	set = _set_current_health


func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	
	if health_bar:
		health_bar.max_value = 0
		health_bar.max_value = max_health
		health_bar.value = current_health
	
	if hurt_box:
		hurt_box.damage_received.connect(_damage_received)


## Cette fonction est appelée au moment de recevoir des dégats.
func _damage_received(damage_amount: int) -> void:
	current_health -= damage_amount


## Cette fonction est appelée au moment où la vie de l'ennemi arrive à 0.
func _on_death() -> void:
	queue_free()


# Setter de current_health
func _set_current_health(new_value: int) -> void:
	current_health = new_value
	if health_bar:
		health_bar.value = new_value
	if new_value <= 0:
		_on_death()
