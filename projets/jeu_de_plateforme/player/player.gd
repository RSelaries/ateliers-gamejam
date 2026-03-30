extends CharacterBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("movement_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_released("movement_jump") and not is_on_floor():
		if velocity.y < -100:
			velocity.y = move_toward(velocity.y, -20, SPEED)
	
	var direction := Input.get_axis("movement_left", "movement_right")
	
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
		
		#Pour gérer l'animation
		if is_on_floor():
			animated_sprite_2d.play("moving")
		else:
			animated_sprite_2d.play("idle")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.play("idle")
	
	move_and_slide()
