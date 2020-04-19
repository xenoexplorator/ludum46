extends Node
class_name StormEvent

export (float) var timing
export (bool) var repeating = false
export (float) var repeatTimer = 0

signal run_complete

func _ready():
	connect("run_complete", self, "_update_after_run")

func _run():
	pass

func _update_after_run():
	if repeating:
		timing += repeatTimer
	else:
		queue_free()
