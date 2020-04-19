extends Node2D

const MainMenu = "res://UI/Menu/MainMenu.tscn"

func _ready() -> void:
	randomize()
	get_tree().call_group("hud", "start")


func _on_HeatMonitoring_fire_extinguished():
	SceneTransitioner.go_to(MainMenu)
