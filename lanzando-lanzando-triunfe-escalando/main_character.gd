extends CharacterBody2D

@export var SPEED = 220

@export var gravity = 980

@onready var animar = $Animacion

func _physics_process(delta):
	#GRAVEDAD#
	if not is_on_floor():
		velocity.y += delta*gravity

	
	if not is_climbing():
		pass
	else:
		#Aumento de las velocidades de manera normal(sin animación)
		velocidades()
		#Animaciones aplicadas después (con el flip_h o no)
		animaciones()
		#Aplicación de los movimientos (por defecto)
		move_and_slide()

func is_climbing() -> bool:
	#Comprueba si el jugador está escalando la cuerda
	#calcular el camino a seguir desde la posicion del personaje hasta la posicion 
	return true
	

func velocidades():
	var dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = dir * SPEED
	

func animaciones():
	if velocity.x > 0:
		animar.flip_h = false
			
	elif velocity.x < 0:
		animar.flip_h = true
	
	if velocity.y == 0:
		if velocity.x == 0:
			animar.play("idle")
		
		else:
			animar.play("walk")
		
	elif not is_on_floor():
		animar.play("jump")
