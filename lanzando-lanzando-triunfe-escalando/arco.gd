extends Node2D

var wasclicked = false

var carga = 0

func _physics_process(delta):
	look_at_mouse()
	
	#Carga del arco
	if Input.is_action_pressed("ui_click"):
		arco_carga()
	#Disparo del arco
	elif Input.is_action_just_released("ui_click"):
		arco_disparo()

func look_at_mouse():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

func arco_carga():
	if !wasclicked:
		wasclicked = true 
	else:
		carga += 1

func arco_disparo():
	#Dispara la flecha con velocidad proporcional a la carga y en la dirección del ratón
	
	#Resetea la carga y el click para el siguiente frame
	wasclicked = false
	carga = 0
