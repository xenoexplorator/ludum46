extends StormEvent
class_name ChangeSpawnRate

export (float) var new_rate

func _run(storm):
	storm.set_rate(new_rate)
