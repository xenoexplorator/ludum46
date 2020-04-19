extends StormEvent
class_name ChangeSpawnRate

export (float) var new_rate

func _run():
	get_tree().call_group("storm", "set_rate", new_rate)
