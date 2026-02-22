extends CharacterBody2D

@export var SPEED = 100
@export var JUMP_FORCE = -200
@export var gravity = 980

@export var eslabonL_scene: PackedScene
@export var eslabonS_scene: PackedScene
@export var joint_scene: PackedScene

var flecha_disparada: bool = false

var eslabonL
var eslabonS



var flechaP

var ult_eslabon
var aux
@onready var animar = $Animacion

func _ready():
	get_node("./Arco").connect("arco_disparado", on_arco_disparado)
	connect("flecha_choca", on_flecha_choca)

func _process(delta: float) -> void:
	if (flecha_disparada):
		if (global_position.distance_to(ult_eslabon.global_position) > 100):
			eslabonL = eslabonL_scene.instantiate()
			get_tree().current_scene.add_child(eslabonL)
			eslabonL.set_mass(0.001)
			var joint = eslabonL.get_node("PinJoint2D")
			eslabonL.global_position = ult_eslabon.global_position - ((ult_eslabon.global_position - global_position).normalized() * 10)
			joint.set_node_a(ult_eslabon.get_path())
			joint.set_exclude_nodes_from_collision(true)
			#eslabonL.set_freeze_enabled(true)
			ult_eslabon = eslabonL
			aux = aux + 1
			

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
	if Input.is_action_just_pressed("ui_salto") && is_on_floor():
		velocity.y = JUMP_FORCE
		
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

func on_arco_disparado(flecha):
	flecha_disparada = true
	flechaP = flecha
	ult_eslabon = flecha
	get_node(flecha.get_path()).connect("flecha_choca", on_flecha_choca)
	aux = 0

func on_flecha_choca():
	flecha_disparada = false
	ult_eslabon.global_position = global_position
	ult_eslabon.set_freeze_enabled(true)
	var joint = ult_eslabon.get_node("PinJoint2D")
	joint.set_node_a(self.get_path())
	joint.set_exclude_nodes_from_collision(true)



func flecha_caida(body: RigidBody2D) -> void:
	if body.linear_velocity.x < 0:
		while is_on_floor():
			velocity.x = -SPEED
	else:
		while is_on_floor():
			velocity.x = SPEED
	pass
