extends StaticBody2D

class_name Campfire

var heat = 0
var max_heat = 100


func _ready():
	update_heat(max_heat) # assumes heat is initialized to 0


func cool_down(rain_drop):
	update_heat(-5)
	rain_drop.turn_to_steam()
	if heat == 0:
		SceneTransitioner.transition_with_path("res://UI/Menu/MainMenu.tscn")


func add_log(amount: int) -> void:
	update_heat(amount)


func update_heat(delta: int) -> void:
	heat = max(0, min(heat + delta, max_heat))
	get_tree().call_group("hud", "update_campfire_health", heat)
