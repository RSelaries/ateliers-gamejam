@tool
extends Label


func _process(_delta: float) -> void:
	var time := Time.get_time_dict_from_system()
	var hour: float = time.hour
	var munutes: float = time.minute
	text = "%d:%d" % [hour, munutes]
