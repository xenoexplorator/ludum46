extends StormEvent
class_name SpawnLog

func _run():
	get_tree().call_group("storm", "spawn_log")
