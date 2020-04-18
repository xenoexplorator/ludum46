extends Node2D

const BarrierScene = preload("res://Player/Barrier/Barrier.tscn")

func _ready():
	pass

func spawn(position, target):
	var spawn = BarrierScene.instance()
	spawn.position = position
	spawn.target = target
	add_child(spawn)
