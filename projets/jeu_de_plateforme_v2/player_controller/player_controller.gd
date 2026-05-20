extends CharacterBody2D


@export var move_speed: float = 120.0
@export var jump_velocity: float = -300.0
@export var acceleration: float = 50.0

var alive: bool = true

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	PlayerManager.health_changed.connect(_on_health_changed)


func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		if not animated_sprite_2d.animation == &"jump":
			animated_sprite_2d.play(&"jump")
			animated_sprite_2d.frame = randi_range(0, 3)
	
	# Handle jump
	if Input.is_action_just_pressed(&"movement_jump") and is_on_floor() and alive:
		velocity.y = jump_velocity
	
	# Handle left-right movements
	var direction: float
	if _can_move():
		direction = Input.get_axis(&"movement_left", &"movement_right")
	if direction and alive:
		animated_sprite_2d.flip_h = direction < 0.0
		velocity.x = move_toward(velocity.x, direction * move_speed, acceleration)
		if is_on_floor():
			animated_sprite_2d.play(&"run")
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		if is_on_floor():
			animated_sprite_2d.play(&"idle")
	
	move_and_slide()


func _on_health_changed() -> void:
	if PlayerManager.health <= 0:
		PlayerManager.health = 0
		alive = false
		animated_sprite_2d.play(&"dead")
		await animated_sprite_2d.animation_finished
		get_tree().reload_current_scene()
		PlayerManager.heal(3)


func _can_move() -> bool:
	if owner is Level:
		var level = owner as Level
		return not level.in_transition
	else:
		return true
