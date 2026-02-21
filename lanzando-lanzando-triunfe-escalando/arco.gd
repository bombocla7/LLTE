extends Node2D

@export var max_carga = 150 # 150 = 3 segundos
@export var arrow_scene: PackedScene

var wasclicked = false
var flecha
var carga = 0

func _physics_process(delta):
	look_at_mouse()
	
	#Carga del arco, cuando llega al máximo se queda esperando a que se suelte
	if Input.is_action_pressed("ui_click"):
		if (carga < max_carga):
			arco_carga()
		
	#Disparo del arco
	if Input.is_action_just_released("ui_click"):
		arco_disparo(carga)


func look_at_mouse():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

func arco_carga():
	carga += 1
	print(carga)

func arco_disparo(carga_disparo):
	#Dispara la flecha con velocidad proporcional a la carga y en la dirección del ratón
	if flecha != null:
		flecha.queue_free()
	
	flecha = arrow_scene.instantiate()
	get_tree().current_scene.add_child(flecha)
	flecha.global_position = global_position
	if get_parent().has_method("conectar_extremo"):
		get_parent().conectar_extremo(flecha)
	var direccion_x = (get_global_mouse_position() - global_position).normalized()
	print(str(direccion_x))
	var fuerza_base = 5
	flecha.rotation = direccion_x.angle()
	#EL OBJETO A CREAR NO DEBE TENER LA VELOCIDAD EN X DEFINIDA EN 0 O EN OTRO VALOR ESTRICTO, LA VELOCIDAD DE LA FLECHA SE DA AQUI
	flecha.linear_velocity = direccion_x * fuerza_base * carga_disparo
	carga = 0
