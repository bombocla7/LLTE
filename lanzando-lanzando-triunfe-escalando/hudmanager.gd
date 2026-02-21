extends CanvasLayer

@onready var timer_texto = $time_label

var tiempo_total: float = 0.0
var crono_activo: bool = true

func _process(delta: float) -> void:
	if (crono_activo):
		tiempo_total += delta
	
	timer_texto.text = formatear_tiempo(tiempo_total)

func formatear_tiempo(tiempo:float) -> String:
	var secs:int = int(tiempo) % 60
	var mins:int = (int(tiempo) % 3600) / 60
	var horas:int = int(tiempo) / 3600	
	return "%02d:%02d:%02d" % [horas,mins,secs]
