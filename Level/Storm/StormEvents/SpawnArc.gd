extends StormEvent
class_name SpawnArc
const RainDrop = preload("res://Rain/RainDrop.tscn")

export (Vector2) var origin
export (float) var start_angle
export (float) var end_angle
export (int) var num_drops
export (float) var speed

var running = false

func _run(storm):
	var angle_step = (end_angle - start_angle) / num_drops
	for a in range(start_angle, end_angle + angle_step/2, angle_step):
		var drop = RainDrop.instance()
		drop.position = origin
		drop.angle = a
		drop.speed = speed
		storm.spawn_drop(drop)
