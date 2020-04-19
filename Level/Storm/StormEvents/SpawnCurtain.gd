extends StormEvent
class_name SpawnCurtain

const RainDrop = preload("res://Rain/RainDrop.tscn")

export (Vector2) var origin
export (Vector2) var drift
export (int) var count := 1
export (bool) var bidirectional
export (float) var angle := 0
export (float) var speed := 100

var spawn_index := 0

func get_ray_number() -> int:
	var index = spawn_index % count
	if bidirectional and index > count / 2:
		index = count - index
	return index

func _run(storm):
	var drop = RainDrop.instance()
	drop.position = origin + get_ray_number() * drift
	drop.angle = angle
	drop.speed = speed
	storm.spawn_drop(drop)
	spawn_index += 1
