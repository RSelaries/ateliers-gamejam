# PlayerManager
extends Node


signal diamond_count_changed
signal health_changed


# diamond
var diamond_count: int = 0

# health
var health: int = 3


func add_diamond() -> void:
	diamond_count +=1
	diamond_count_changed.emit()


func hurt(amount: int = 1) -> void:
	health -= amount
	health_changed.emit()


func heal(amount: int = 1) -> void:
	health += amount
	health_changed.emit()
