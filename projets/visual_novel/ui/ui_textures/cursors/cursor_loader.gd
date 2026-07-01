@icon("uid://dm408v6kfofup")
class_name CursorLoader
extends Node


const ARROW = preload("uid://dejcf6lu68dpf")
const I_BEAM = preload("uid://dbapuwqabt1ci")
const POINTING_HAND = preload("uid://b002uvjrajwjm")
const CROSS = preload("uid://c6puaxus8yd2l")
const WAIT = preload("uid://die5vo70kytps")
const BUSY = preload("uid://rrnn4cfh2wjy")
const DRAG = preload("uid://c1fs1tck8df0i")
const FORBIDDEN = preload("uid://co6rtmde2hcpf")
const HORIZONTAL_RESIZE = preload("uid://bxycwdcs006k7")
const VERTICAL_RESIZE = preload("uid://cbi0kgfvwdbaq")



func _ready() -> void:
	Input.set_custom_mouse_cursor(ARROW, Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(I_BEAM, Input.CURSOR_IBEAM)
	Input.set_custom_mouse_cursor(POINTING_HAND, Input.CURSOR_POINTING_HAND, Vector2(12, 2))
	Input.set_custom_mouse_cursor(CROSS, Input.CURSOR_CROSS)
	Input.set_custom_mouse_cursor(WAIT, Input.CURSOR_WAIT)
	Input.set_custom_mouse_cursor(BUSY, Input.CURSOR_BUSY)
	Input.set_custom_mouse_cursor(DRAG, Input.CURSOR_DRAG)
	Input.set_custom_mouse_cursor(FORBIDDEN, Input.CURSOR_FORBIDDEN)
	Input.set_custom_mouse_cursor(HORIZONTAL_RESIZE, Input.CURSOR_HSIZE)
	Input.set_custom_mouse_cursor(VERTICAL_RESIZE, Input.CURSOR_VSIZE)
	queue_free()
