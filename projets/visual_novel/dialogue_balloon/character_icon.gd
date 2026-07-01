class_name CharacterIcon
extends TextureRect


const ICON_ATHAVAN = preload("uid://by0xanjjbjoy4")
const ICON_SMARTPHONE = preload("uid://btfddu73ttwtp")


func change_icon(new_icon: Texture2D) -> void:
	texture = new_icon
