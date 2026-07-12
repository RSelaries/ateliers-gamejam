class_name ProgramButton
extends Button


signal double_clicked
signal opened_program(title: String, file: String)


@export var open_program: bool = true
@export_file("*.tscn") var program_to_open: String
@export var program_name: String


var double_click_timer: Timer
var double_click_first: bool = false


func _init() -> void:
	double_click_timer = Timer.new()
	double_click_timer.timeout.connect(_on_double_click_timer_timeout)
	add_child(double_click_timer)


func _pressed() -> void:
	if not double_click_first:
		double_click_first = true
		double_click_timer.start(0.3)
	else:
		_double_clicked()
		double_clicked.emit()
		if open_program: _open_program()
	grab_focus()


func _double_clicked() -> void: pass


func _open_program() -> void:
	opened_program.emit(program_name, program_to_open)


func _on_double_click_timer_timeout() -> void:
	double_click_first = false
