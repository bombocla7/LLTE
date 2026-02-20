extends Node2D

@export var max_carga = 500

var wasclicked = false

var carga = 0

func _physics_process(delta):
	look_at_mouse()
	
	#Carga del arco
	if Input.is_action_pressed("ui_click"):
		if (carga < max_carga):
			arco_carga()
		elif (carga == max_carga):
			arco_disparo()
	#Disparo del arco
	elif Input.is_action_just_released("ui_click"):
		arco_disparo()
		
	#Debug carga
	print(carga)

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
