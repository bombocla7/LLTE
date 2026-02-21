extends Area2D

@onready var camara = $"../Camera2D"

func _on_body_entered(body: Node2D) -> void:
	print("jugador ha entrado en ")
	print(self)
	camara.position = position
