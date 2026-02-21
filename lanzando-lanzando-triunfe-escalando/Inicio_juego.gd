extends Control

@onready var jugar = $CanvasLayer/TextureButton
@onready var salir = $CanvasLayer/TextureButton2

@export var ruta =  "res://nivel.tscn"

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file(ruta)



func _on_salir_pressed() -> void:
	get_tree().quit()
