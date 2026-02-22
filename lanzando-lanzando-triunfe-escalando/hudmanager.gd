extends CanvasLayer

@onready var timer_texto = $time_label
@onready var ruta = "res://Start.tscn"

var tiempo_total: float = 0.0
var crono_activo: bool = true

func _process(delta: float) -> void:
	if (crono_activo):
		tiempo_total += delta
	if Input.is_action_just_pressed("ui_text_clear_carets_and_selection"):
		get_tree().change_scene_to_file(ruta)
	timer_texto.text = formatear_tiempo(tiempo_total)

func formatear_tiempo(tiempo:float) -> String:
	var secs:int = int(tiempo) % 60
	var mins:int = (int(tiempo) % 3600) / 60
	var horas:int = int(tiempo) / 3600	
	return "%02d:%02d:%02d" % [horas,mins,secs]


func _on_area_cámara_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
