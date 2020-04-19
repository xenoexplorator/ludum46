extends StaticBody2D

class_name Campfire

signal heat_changed(heat)

var heat = 0
var max_heat = 100

func _ready():
	heat = max_heat
	get_tree().call_group("hud", "update_campfire_health", heat)
	emit_signal("heat_changed", heat)
	
func cool_down(rain_drop):
	heat -= 5
	heat = max(0, heat)
	get_tree().call_group("hud", "update_campfire_health", heat)
	emit_signal("heat_changed", heat)
	rain_drop.turn_to_steam()
	if heat == 0:
		SceneTransitioner.transition_with_path("res://UI/Menu/MainMenu.tscn")



