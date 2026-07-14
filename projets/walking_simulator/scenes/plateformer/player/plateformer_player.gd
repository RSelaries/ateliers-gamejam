class_name PlatformerPlayer
extends CharacterBody2D


static var diamond_count: int = 0:
	set = _set_diamond_count
static var alive: bool = true

@export var acceleration: float = 50.0
@export var move_speed: float = 120.0
@export var jump_velocity: float = -300.0

@onready var diamond_counter: Label = %DiamondCounter
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer = %JumpSound
@onready var die_sound: AudioStreamPlayer = %DieSound


func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		if not animated_sprite_2d.animation == &"jump" and alive:
			animated_sprite_2d.play(&"jump")
			animated_sprite_2d.frame = randi_range(0, 3)
	
	# Handle jump
	if Input.is_action_just_pressed(&"movement_jump") and is_on_floor() and alive:
		velocity.y = jump_velocity
		jump_sound.pitch_scale = randf_range(0.7, 1.3)
		jump_sound.play()
	
	# Handle left-right movements
	var direction: float
	if _can_move():
		direction = Input.get_axis(&"platformer_left", &"platformer_right")
	if direction and alive:
		animated_sprite_2d.flip_h = direction < 0.0
		velocity.x = move_toward(velocity.x, direction * move_speed, acceleration)
		if is_on_floor():
			animated_sprite_2d.play(&"run")
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		if is_on_floor() and alive:
			animated_sprite_2d.play(&"idle")
	
	move_and_slide()


func _can_move() -> bool:
	return not Platformer.in_transition


func _set_diamond_count(new_value: int) -> void:
	diamond_count = new_value
	diamond_counter.text = "%03d" % new_value
