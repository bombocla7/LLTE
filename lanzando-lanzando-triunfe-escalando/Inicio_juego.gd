extends Control

@onready var jugar = $Start/CanvasLayer/CenterContainer/TextureButton
@onready var salir = $Start/CanvasLayer/CenterContainer2/TextureButton2

@export var ruta =  "res://nivel.tscn"

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file(ruta)



func _on_salir_pressed() -> void:
	get_tree().quit()
