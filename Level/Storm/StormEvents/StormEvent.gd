extends Node
class_name StormEvent

export (float) var timing := 0.0
export (bool) var repeating := false
export (float) var repeatTimer := 0.0
export (int) var repeat_count := -1


func run(storm):
	_run(storm)
	_update_after_run()

func _run(storm):
	pass

func _update_after_run():
	if repeating and repeat_count != 0:
		timing += repeatTimer
		if repeat_count > 0:
			repeat_count -= 1
	else:
		queue_free()
