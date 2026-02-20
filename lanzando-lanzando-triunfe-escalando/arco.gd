extends Node2D

func _process(delta):
	look_at_mouse()
	
	
func look_at_mouse():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
