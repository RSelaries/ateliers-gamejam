extends CharacterBody3D


## Vitesse du personnage.
@export var speed := 5.0
## Force du saut.
@export var jump_velocity := 4.5
## Sensibilité de la souris.
@export var mouse_sensibility := 0.003


@onready var neck: Node3D = %Neck
@onready var camera_3d: Camera3D = %Camera3D


func _ready() -> void:
	# Attrape le curseur de la souris
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	# Si le personnage ne touche pas le sol, on ajoute de la gravité
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Sauter
	if Input.is_action_just_pressed(&"movement_jump") and is_on_floor():
		velocity.y = jump_velocity

	# Déplacements
	var input_dir := Input.get_vector(&"movement_left", &"movement_right", &"movement_up", &"movement_down")
	var direction := (neck.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	# Rotattion de la caméra
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		neck.rotate_y(-event.relative.x * mouse_sensibility)
		camera_3d.rotate_x(-event.relative.y * mouse_sensibility)
	
	# Libérer la souris
	if event.is_action_pressed(&"release_mouse"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
