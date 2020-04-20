extends StormEvent
class_name SpawnCurtain

const RainDrop = preload("res://Rain/RainDrop.tscn")

export (Vector2) var origin
export (Vector2) var drift
export (int) var count := 1
export (float) var spawn_delay := 0.0
export (bool) var bidirectional
export (float) var angle := 0
export (float) var speed := 100

var spawn_index := 0
var base_timing

func _ready() -> void:
	base_timing = timing


func get_ray_number() -> int:
	var index = spawn_index
	if bidirectional and index > count / 2:
		index = count - index
	return index


func _run(storm):
	if spawn_delay == 0.0:
		for i in range(count):
			spawn(storm)
	else:
		spawn(storm)


func _update_after_run():
	if spawn_delay > 0.0 and spawn_index < count:
		timing += spawn_delay
	elif repeating and repeat_count != 0:
		base_timing += repeatTimer
		timing = base_timing
		spawn_index = 0
		if repeat_count > 0:
			repeat_count -= 1
	else:
		queue_free()


func spawn(storm):
	var drop = RainDrop.instance()
	drop.position = origin + get_ray_number() * drift
	drop.angle = angle
	drop.speed = speed
	storm.spawn_drop(drop)
	spawn_index += 1
