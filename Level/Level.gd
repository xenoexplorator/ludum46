extends Node2D

func _ready() -> void:
	randomize()
	get_tree().call_group("hud", "start")

