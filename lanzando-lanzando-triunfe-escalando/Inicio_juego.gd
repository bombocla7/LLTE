extends Control

@onready var jugar = $"CanvasLayer/CenterContainer/TextureButton"
@onready var salir = $"CanvasLayer/CenterContainer2/TextureButton2"
@onready var audio_stream_player_2d = get_node("/root/MusicaFondo")

@export var ruta =  "res://nivel.tscn"

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file(ruta)
	audio_stream_player_2d.play(0.0)



func _on_salir_pressed() -> void:
	get_tree().quit()
