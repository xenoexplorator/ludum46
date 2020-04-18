extends Area2D

signal heat_changed(heat)

var heat = 0
var max_heat = 100

func _ready():
	heat = max_heat
	emit_signal("heat_changed", heat)
	
func _on_Heat_body_entered(body):
	if body is Player:
		body.is_in_heat = true

func _on_Heat_body_exited(body):
	if body is Player:
		body.is_in_heat = false

func _cool_down(rain_drop):
	heat -= 5
	heat = max(0, heat)
	emit_signal("heat_changed", heat)
	