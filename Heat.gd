extends Node

signal heat_changed(heat)

var heat = 0
var max_heat = 100

func _ready():
	heat = max_heat
	emit_signal("heat_changed", heat)
	
func _cool_down(nb_rain_drop):
	heat -= nb_rain_drop*5
	heat = max(0, heat)
	emit_signal("heat_changed", heat)
	



