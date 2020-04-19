extends StaticBody2D

class_name Campfire

signal heat_changed(heat)

var heat = 0
var max_heat = 100

func _ready():
	heat = max_heat
	emit_signal("heat_changed", heat)
	
func cool_down(rain_drop):
	heat -= 5
	heat = max(0, heat)
	emit_signal("heat_changed", heat)
	


