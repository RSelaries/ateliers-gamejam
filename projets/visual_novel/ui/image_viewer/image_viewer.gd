@tool
class_name ImageViewer
extends Window


const IMAGE_VIEWER_SCENE = preload("res://ui/image_viewer/image_viewer.tscn")


@export var img_name: String = ""
@export var image: Texture2D:
	set(value):
		image = value
		if image_texture_rect:
			image_texture_rect.texture = value
@export var img_pos: Vector2
@export var img_size := Vector2i(-1, -1)
@export var dither_active: bool = false:
	set(value):
		dither_active = value
		if dither_rect:
			dither_rect.visible = value
@export var debug_pos := Vector2(0.5, 0.5):
	set(value):
		debug_pos = value
		move(value)


@onready var dither_rect: ColorRect = %Dither
@onready var image_texture_rect: TextureRect = %ImageTextureRect


static func create(p_image: Texture2D, p_img_name: String, p_dither: bool = false, p_img_pos := Vector2(0.5, 0.5), p_img_size := Vector2i(-1, -1)) -> ImageViewer:
	var image_viewer_instance: ImageViewer = IMAGE_VIEWER_SCENE.instantiate()
	image_viewer_instance.image = p_image
	image_viewer_instance.img_pos = p_img_pos
	image_viewer_instance.img_size = p_img_size
	image_viewer_instance.dither_active = p_dither
	image_viewer_instance.img_name = p_img_name
	image_viewer_instance.title = p_img_name
	return image_viewer_instance


func _ready() -> void:
	dither_rect.visible = dither_active
	image_texture_rect.texture = image
	move(img_pos)


func dither(active := true) -> void:
	dither_active = active


func move(to: Vector2, from_center := true) -> void:
	var window_size := get_tree().root.size
	var pos := Vector2(window_size) * to
	if from_center:
		pos -= size/2.0
	position = pos
