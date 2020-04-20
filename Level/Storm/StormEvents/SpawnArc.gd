extends StormEvent
class_name SpawnArc
const RainDrop = preload("res://Rain/RainDrop.tscn")

export (Vector2) var origin
export (float) var start_angle
export (float) var end_angle
export (int) var num_drops
export (int) var num_waves
export (float) var spawn_delay := 0.0
export (float) var speed

var wave_counter := 0
var base_timing

func _ready() -> void:
	base_timing = timing


func _run(storm):
	var angle_step = (end_angle - start_angle) / num_drops
	for a in range(start_angle, end_angle + angle_step/2, angle_step):
		var drop = RainDrop.instance()
		drop.position = origin
		drop.angle = a
		drop.speed = speed
		storm.spawn_drop(drop)
	wave_counter += 1


func _update_after_run():
	if spawn_delay > 0.0 and wave_counter < num_waves:
		timing += spawn_delay
	elif repeating and repeat_count != 0:
		base_timing += repeatTimer
		timing = base_timing
		wave_counter = 0
		if repeat_count > 0:
			repeat_count -= 1
	else:
		queue_free()
