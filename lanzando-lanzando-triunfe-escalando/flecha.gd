extends RigidBody2D

var aire :bool = false
var choca :bool = false

signal flecha_choca

func _on_area_2d_body_entered(_body: Node2D) -> void:
	aire = false
	choca = true
	flecha_choca.emit()
	set_deferred("freeze", true)

func _physics_process(_delta: float) -> void:
	if linear_velocity.length() > 5 && !freeze: # Solo rota si se mueve rápido
		rotation = linear_velocity.angle()
