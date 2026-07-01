extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var dead := false
var has_key := false


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("movement_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_released("movement_jump") and not is_on_floor():
		if velocity.y < -100:
			velocity.y = move_toward(velocity.y, -20, SPEED)
	
	var direction := Input.get_axis("movement_left", "movement_right")
	
	if dead: direction = 0
	
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
		
		# Pour gérer l'animation
		if is_on_floor():
			animated_sprite_2d.play("moving")
		else:
			animated_sprite_2d.play("idle")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		# Pour gérer l'animation
		if dead:
			animated_sprite_2d.play("dead")
		else:
			animated_sprite_2d.play("idle")
	
	move_and_slide()


func die() -> void:
	if dead: return
	dead = true
	
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()
	dead = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action_reload"):
		get_tree().reload_current_scene()
