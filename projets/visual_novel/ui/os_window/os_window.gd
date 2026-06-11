extends Control


# Objects images
const SMARTPHONE = preload("uid://bydyyjc5e2f0q")

# Characetrs images
const ATHAVAN_AU_LIT = preload("uid://c65r27s2n7tv5")

const IMAGE_ICON = preload("uid://d28w8rc3o7emx")


@export var start_dialogue: DialogueResource


@onready var start_game_button: TextureButton = %StartGameButton
@onready var dialogue_btn: Button = %DialogueBtn
@onready var task_bar_container: HBoxContainer = %TaskBarContainer


var images_viewers: Dictionary[StringName, ImageViewer]
var images_viewers_buttons: Dictionary[StringName, Button]


func _ready() -> void:
	dialogue_btn.hide()
	start_game_button.pressed.connect(_on_start_game_button_pressed)


func _on_start_game_button_pressed() -> void:
	DialogueManager.show_dialogue_balloon(start_dialogue, "start", [self])
	start_game_button.pressed.disconnect(_on_start_game_button_pressed)


func add_image_viewer(new_iv_key: StringName, default_img: Texture2D, iv_name: String, dither := false) -> ImageViewer:
	var new_iv := ImageViewer.create(default_img, iv_name, dither)
	var new_iv_btn := Button.new()
	new_iv_btn.text = iv_name
	new_iv_btn.icon = IMAGE_ICON
	new_iv_btn.alignment = HORIZONTAL_ALIGNMENT_LEFT
	new_iv_btn.custom_maximum_size.x = 300.0
	new_iv_btn.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	new_iv_btn.mouse_filter = Control.MOUSE_FILTER_IGNORE
	new_iv_btn.theme_type_variation = &"TaskbarButton"
	
	task_bar_container.add_child(new_iv_btn)
	images_viewers_buttons[new_iv_key] = new_iv_btn
	add_child(new_iv)
	images_viewers[new_iv_key] = new_iv
	
	var ballon_scene := get_tree().current_scene.find_child("BalloonScene", true, false) as DialogueBalloon
	if ballon_scene: ballon_scene.grab_focus()
	
	return new_iv


func move_image_viewer(iv_key: StringName, new_pos: Vector2) -> ImageViewer:
	images_viewers[iv_key].move(new_pos)
	return images_viewers[iv_key]


func change_image(iv_key: StringName, new_image: Texture2D) -> ImageViewer:
	images_viewers[iv_key].image = new_image
	return images_viewers[iv_key]


func remove_image_viewer(iv_key: StringName) -> void:
	images_viewers[iv_key].queue_free()
	images_viewers.erase(iv_key)
	images_viewers_buttons[iv_key].queue_free()
	images_viewers_buttons.erase(iv_key)


func open_dialogue_app() -> void:
	dialogue_btn.show()


func quit() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)


func _on_quit_game_btn_pressed() -> void:
	quit()
