extends CharacterBody3D


@export var speed := 5.0
@export var jump_velocity := 4.5
@export var mouse_sensibility := 0.003


@onready var neck: Node3D = %Neck
@onready var camera_3d: Camera3D = %Camera3D


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(&"movement_jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector(&"movement_left", &"movement_right", &"movement_page_down", &"movement_down")
	var direction := (neck.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		neck.rotate_y(-event.relative.x * mouse_sensibility)
		camera_3d.rotate_x(-event.relative.y * mouse_sensibility)
	
	if event.is_action_pressed(&"release_mouse"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
