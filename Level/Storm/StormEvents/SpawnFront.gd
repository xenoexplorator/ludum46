extends StormEvent
class_name SpawnFront
const RainDrop = preload("res://Rain/RainDrop.tscn")

export (Vector2) var origin
export (float) var start_angle
export (float) var end_angle
export (int) var num_drops
export (float) var speed
export (float) var duration
export (float) var repeat_cooldown

var running = false

func _run():
	if not running:
		running = true
		create_timers()


func create_timers():
	var timer = Timer.new()
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
	timer.name = "DurationTimer"
	timer.one_shot = true
	timer.wait_time = duration
	timer.connect("timeout", self, "duration_over")
	add_child(timer)
	timer.start()
	
	var timerShoot = Timer.new()
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
	timerShoot.name = "ShootTimer"
	timerShoot.one_shot = false
	timerShoot.wait_time = repeat_cooldown
	timerShoot.connect("timeout", self, "shoot")
	add_child(timerShoot)
	timerShoot.start()


func duration_over():
	for child in get_children():
		child.queue_free()
	emit_signal("run_complete")


func shoot():
	var angle_step = (end_angle - start_angle) / num_drops
	for a in range(start_angle, end_angle + angle_step/2, angle_step):
		var drop = RainDrop.instance()
		drop.position = origin
		drop.angle = a
		drop.speed = speed
		get_tree().call_group("storm", "spawn_drop", drop)
