extends Label


func _physics_process(_delta: float) -> void:
	var time := Time.get_time_dict_from_system()
	text = "%02d : %02d" % [time.hour, time.minute]
