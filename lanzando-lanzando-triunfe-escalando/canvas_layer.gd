extends CanvasLayer
@onready var audio_stream_player_2d = get_node("/root/MusicaFondo")


func _process(delta):
	audio_stream_player_2d.stop()
	
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Start.tscn")
