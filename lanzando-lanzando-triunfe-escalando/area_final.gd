extends Area2D

signal end_game

func _on_body_entered(body: Node2D) -> void:
	end_game.emit()
	get_tree().change_scene_to_file("res://final.tscn")
