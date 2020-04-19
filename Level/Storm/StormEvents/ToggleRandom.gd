extends StormEvent
class_name ToggleRandom


func _run():
	get_tree().call_group("storm", "toggle_random")
