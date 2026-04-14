class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


static var player_reference: Player


var weapon: Weapon


@onready var sprite: Sprite2D = $CharacterSprite
@onready var weapon_hand_right: Node2D = %WeaponHandRight
@onready var weapon_hand_left: Node2D = %WeaponHandLeft


func _ready() -> void:
	Player.player_reference = self
	weapon = weapon_hand_right.get_child(0)


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	
	move_and_slide()
	_manage_weapon_hand()


func _manage_weapon_hand() -> void:
	var mouse_x = get_local_mouse_position().x * sprite.scale.x
	
	if mouse_x >= 0:
		weapon.reparent(weapon_hand_right, false)
		match weapon.symmetry_axis:
			weapon.SymmetryAxis.X:
				weapon.scale.y = 1
				weapon.scale.x = 1
			weapon.SymmetryAxis.Y:
				weapon.scale.y = 1
				weapon.scale.x = 1
	else:
		weapon.reparent(weapon_hand_left, false)
		match weapon.symmetry_axis:
			weapon.SymmetryAxis.X:
				weapon.scale.y = 1
				weapon.scale.x = -1
			weapon.SymmetryAxis.Y:
				weapon.scale.y = -1
				weapon.scale.x = 1


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("combat_attack"):
		if weapon: weapon.use()
	elif event.is_action_released("combat_attack"):
		if weapon: weapon.stop_using()
