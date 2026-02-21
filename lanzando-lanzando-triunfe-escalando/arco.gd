extends Node2D

@export var max_carga = 100
@export var arrow_scene: PackedScene

var wasclicked = false
var flecha
var carga = 0

func _physics_process(_delta):
	look_at_mouse()
	
	#Carga del arco, cuando llega al máximo se queda esperando a que se suelte
	if Input.is_action_pressed("ui_click"):
		if (carga < max_carga):
			arco_carga()
		
	#Disparo del arco
	if Input.is_action_just_released("ui_click"):
		arco_disparo(carga)
		print(str(flecha.velocity.x))
		print(str(flecha.velocity.y))

func look_at_mouse():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

func arco_carga():
	carga += 1
	print(carga)

func arco_disparo(carga_disparo):
	#Dispara la flecha con velocidad proporcional a la carga y en la dirección del ratón
	flecha = arrow_scene.instantiate()
	get_tree().current_scene.add_child(flecha)
	var direccion_x = (get_global_mouse_position() - global_position).x
	var direccion_y = (get_global_mouse_position() - global_position).y
	print(str(direccion_x))
	print(str(direccion_y))
	var fuerza_base = 50.0 
	#EL OBJETO A CREAR NO DEBE TENER LA VELOCIDAD EN X DEFINIDA EN 0 O EN OTRO VALOR ESTRICTO, LA VELOCIDAD DE LA FLECHA SE DA AQUI
	flecha.velocity.x += direccion_x * fuerza_base * carga_disparo * 0.01
	flecha.velocity.y = direccion_y * fuerza_base * carga_disparo * 0.01
	var direccion = Vector2(direccion_x, direccion_y)
	flecha.rotation = direccion.angle()
	wasclicked = false
	carga = 0
