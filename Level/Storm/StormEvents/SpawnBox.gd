extends StormEvent
class_name SpawnBox
const RainDrop = preload("res://Rain/RainDrop.tscn")

export (Rect2) var spawn_box
export (float) var angle_min
export (float) var angle_max
export (float) var speed_min := 100
export (float) var speed_max := 100

func _run(storm):
	var drop = RainDrop.instance()
	var box_size = spawn_box.size
	var ox = rand_range(0, box_size.x)
	var oy = rand_range(0, box_size.y)
	drop.position = spawn_box.position + Vector2(ox, oy)
	drop.angle = rand_range(angle_min, angle_max)
	drop.speed = rand_range(speed_min, speed_max)
	storm.spawn_drop(drop)
