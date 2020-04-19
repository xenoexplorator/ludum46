extends StormEvent
class_name SpawnCluster
const RainDrop = preload("res://Rain/RainDrop.tscn")

export (Vector2) var origin
export (float) var angle
export (int) var num_drops
export (float) var radius
export (float) var speed

func _run(storm):
	for n in range(num_drops):
		var theta = deg2rad(n * 360 / num_drops)
		var delta = radius * Vector2(cos(theta), sin(theta))
		var drop = RainDrop.instance()
		drop.position = origin + delta
		drop.angle = angle
		drop.speed = speed
		storm.spawn_drop(drop)
