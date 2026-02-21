extends RigidBody2D

var aire :bool = false
var choca :bool = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	aire = false
	choca = true
	set_deferred("freeze", true)
