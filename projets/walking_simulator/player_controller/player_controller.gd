extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


@onready var camera_y_rotation: Node3D = %CameraYRotation
@onready var camera_3d: Camera3D = %Camera3D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed(&"movement_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector(&"movement_left", &"movement_right", &"movement_up", &"movement_down")
	var direction := (camera_y_rotation.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		camera_y_rotation.rotate_y(-event.relative.x * 0.003)
		camera_3d.rotate_x(-event.relative.y * 0.003)
		camera_3d.rotation_degrees.x = clampf(camera_3d.rotation_degrees.x, -90, 90)
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.is_pressed():
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
