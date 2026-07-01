class_name EnemyCharacter
extends CharacterBody2D


enum PathfindingTargets { PLAYER, CUSTOM }


#region Properties exportées
@export_group("Movements")
@export var movement_speed: float = 200.0

@export_group("Health")
## Si [param health_enabled] est [code]false[/code], alors l'ennemi sera [b]immortel[/b].
@export_custom(PROPERTY_HINT_GROUP_ENABLE, "") var health_enabled: bool = true
@export var max_health: int = 20
@export var hurt_box: HurtBox
@export var health_bar: Range

@export_group("Pathfinding")
@export_custom(PROPERTY_HINT_GROUP_ENABLE, "") var pathfinding_enabled: bool = true
@export var navigation_agent: NavigationAgent2D
@export var pathfinding_target := PathfindingTargets.PLAYER
@export var custom_target: Node2D
@export var pathfinding_update_time := 0.1
#endregion


var pathfinding_target_node: Node2D:
	get = _get_pathfinding_target_node


@onready var pathfinding_update_timer: Timer
@onready var current_health: int = max_health:
	set = _set_current_health


func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	if health_enabled: _on_ready_health_setup()
	#if pathfinding_enabled:
		#pathfinding_update_timer = Timer.new()
		#pathfinding_update_timer.autostart = true
		#pathfinding_update_timer.timeout.connect(_pathfinding_update)
		#add_child(pathfinding_update_timer)


func _physics_process(delta: float) -> void:
	if pathfinding_enabled:
		_pathfinding_update()
		velocity = _pathfinding(delta)
		move_and_slide()


func _pathfinding_update() -> void:
	if not navigation_agent: return
	navigation_agent.target_position = Player.player_reference.global_position


## Cette fonction est appelée au moment de recevoir des dégats.
func _damage_received(damage_amount: int) -> void:
	current_health -= damage_amount


## Cette fonction est appelée au moment où la vie de l'ennemi arrive à 0.
func _on_death() -> void:
	queue_free()


#region Setters et Getters
# Setter de current_health
func _set_current_health(new_value: int) -> void:
	current_health = new_value
	if health_bar:
		health_bar.value = new_value
	if new_value <= 0:
		_on_death()


# Getter de pathfinding_target_node
func _get_pathfinding_target_node() -> Node2D:
	if pathfinding_target == PathfindingTargets.CUSTOM:
		return custom_target
	else:
		return Player.player_reference
#endregion


func _pathfinding(delta: float) -> Vector2:
	if not navigation_agent: return Vector2.ZERO
	
	var direction: Vector2
	
	direction = navigation_agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	return velocity.lerp(direction * movement_speed, 7 * delta)


func _on_ready_health_setup() -> void:
	if health_bar:
		health_bar.max_value = 0
		health_bar.max_value = max_health
		health_bar.value = current_health
	
	if hurt_box:
		hurt_box.damage_received.connect(_damage_received)
