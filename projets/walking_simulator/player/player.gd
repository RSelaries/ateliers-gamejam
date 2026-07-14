class_name Player
extends CharacterBody3D


# Static refs
static var current_player: Player
static var camera: Camera3D
static var interaction_label: Label

# Static settings
static var can_interact: bool = true
static var can_move: bool = true
static var can_move_camera: bool = true


## Vitesse du personnage.
@export var speed := 5.0
## Force du saut.
@export var jump_velocity := 4.5
## Sensibilité de la souris.
@export var mouse_sensibility := 0.003


@onready var neck: Node3D = %Neck


func _ready() -> void:
	interaction_label = %InteractionLabel
	interaction_label.hide()
	current_player = self
	camera = %Camera3D


func _physics_process(delta: float) -> void:
	# Si le personnage ne touche pas le sol, on ajoute de la gravité
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if can_move and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		_move()
	else:
		velocity = velocity.move_toward(Vector3(0, velocity.y, 0), speed * 0.5)
	
	move_and_slide()


func _move() -> void:
	# Sauter
	#if Input.is_action_just_pressed(&"movement_jump") and is_on_floor() and can_move:
		#velocity.y = jump_velocity
	
	# Déplacements
	var input_dir := Input.get_vector(&"movement_left", &"movement_right", &"movement_up", &"movement_down")
	var direction := (neck.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * speed, speed * 0.5)
		velocity.z = move_toward(velocity.z, direction.z * speed, speed * 0.5)
	else:
		velocity.x = move_toward(velocity.x, 0, speed * 0.5)
		velocity.z = move_toward(velocity.z, 0, speed * 0.5)


func _unhandled_input(event: InputEvent) -> void:
	# Rotattion de la caméra
	if (event is InputEventMouseMotion and can_move_camera and
	Input.mouse_mode == Input.MOUSE_MODE_CAPTURED):
		neck.rotate_y(-event.relative.x * mouse_sensibility)
		camera.rotate_x(-event.relative.y * mouse_sensibility)
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90, 90)
