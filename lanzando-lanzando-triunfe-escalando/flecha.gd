extends RigidBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("clavada")
	set_deferred("freeze", true)
