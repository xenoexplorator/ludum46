extends Node2D
# Gère la timeline de spawn pour la pluie
# i.e. le contenu du level

const SPAWN_THRESHOLD := 10.0
const RainDrop = preload("res://Rain/RainDrop.tscn")
export (float) var timer := 0.0
export (float) var spawn_rate := 10.0
var next_spawn = SPAWN_THRESHOLD

func _process(delta: float) -> void:
	timer += delta * spawn_rate
	if timer > next_spawn:
		var drop = RainDrop.instance()
		var x = randf() * (get_viewport().size.x / scale.x)
		var y = randf() * 20
		drop.position = Vector2(x, y)
		drop.angle = randf() * 20 + randf() * 20 - 20
		drop.speed = randf() * 40 + 60
		add_child(drop)
		next_spawn += SPAWN_THRESHOLD
