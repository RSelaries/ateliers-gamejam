class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


static var player_reference: Player


var weapon: Weapon:
	get():
		var fst_child := weapon_hand.get_child(0) 
		return fst_child if fst_child is Weapon else null


@onready var weapon_hand: Node2D = %WeaponHand


func _enter_tree() -> void:
	Player.player_reference = self
	print(Player.player_reference)


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("combat_attack"):
		if weapon: weapon.use()
	elif event.is_action_released("combat_attack"):
		if weapon: weapon.stop_using()
