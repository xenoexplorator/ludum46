extends Node2D
# Gère la timeline de spawn pour la pluie
# i.e. le contenu du level

const SPAWN_THRESHOLD := 10.0
const LogPickup = preload("res://LogPickup/LogPickup.tscn")
const RainDrop = preload("res://Rain/RainDrop.tscn")
export (NodePath) var campfire
export (float) var timer := 0.0
export (float) var spawn_rate := 10.0
var spawn_randoms := true
onready var next_random = SPAWN_THRESHOLD / spawn_rate

var storm_events := [
	StormEvent.new(StormEvent.EventType.SPAWN_FRONT, 10, {origin=Vector2(50, 30), start_angle=-20, end_angle=60, num_drops=8, repeat=0.1, duration=2, speed=120}),
	StormEvent.new(StormEvent.EventType.SPAWN_CLUSTER, 15, {origin=Vector2(560, 60), angle=-10, num_drops=10, radius=50, speed=100}),
	StormEvent.new(StormEvent.EventType.SPAWN_LOG, 30, {repeat=30}),
	]


func _ready() -> void:
	randomize()
	campfire = get_node(campfire)

func _process(delta: float) -> void:
	timer += delta

	if spawn_randoms and timer > next_random:
		spawn_random()

	var drop_queue = []
	for event in storm_events:
		if timer > event.timing:
			run_event(event)
			if timer > event.timing:
				drop_queue.push_back(event)
	for done in drop_queue:
		storm_events.erase(done)


func spawn_random():
	var drop = RainDrop.instance()
	var x = rand_range(40, 1240)
	var y = rand_range(0, 20)
	drop.position = Vector2(x, y)
	drop.angle = rand_range(-10, 10) + rand_range(-10, 10)
	drop.speed = rand_range(120, 180)
	add_child(drop)
	next_random += SPAWN_THRESHOLD / spawn_rate


func run_event(event: StormEvent):
	match event.event_type:
		StormEvent.EventType.TOGGLE_RANDOM:
			spawn_randoms = not spawn_randoms
		StormEvent.EventType.SET_RATE:
			spawn_rate = event.get_param("new_rate")
		StormEvent.EventType.SPAWN_FRONT:
			var origin = event.get_param("origin")
			var start_angle = event.get_param("start_angle")
			var end_angle = event.get_param("end_angle")
			var num_drops = event.get_param("num_drops")
			var speed = event.get_param("speed")
			spawn_front(origin, start_angle, end_angle, speed, num_drops)
		StormEvent.EventType.SPAWN_CLUSTER:
			var origin = event.get_param("origin")
			var angle = event.get_param("angle")
			var speed = event.get_param("speed")
			var num_drops = event.get_param("num_drops")
			var radius = event.get_param("radius")
			spawn_cluster(origin, angle, speed, num_drops, radius)
		StormEvent.EventType.SPAWN_LOG:
			spawn_log()

	event.update_after_run()


func spawn_front(origin: Vector2, start_angle: float, end_angle: float, speed: float, num_drops: int) -> void:
	var angle_step = (end_angle - start_angle) / num_drops
	for a in range(start_angle, end_angle + angle_step/2, angle_step):
		var drop = RainDrop.instance()
		drop.position = origin
		drop.angle = a
		drop.speed = speed
		add_child(drop)


func spawn_cluster(origin: Vector2, angle: float, speed: float, num_drops: int, radius: float) -> void:
	for n in range(num_drops):
		var theta = deg2rad(n * 360 / num_drops)
		var delta = radius * Vector2(cos(theta), sin(theta))
		var drop = RainDrop.instance()
		drop.position = origin + delta
		drop.angle = angle
		drop.speed = speed
		add_child(drop)


func spawn_log() -> void:
	var pickup = LogPickup.instance()
	var x = rand_range(80, 1200)
	var y = rand_range(80, 700)
	pickup.position = Vector2(x, y)
	pickup.connect("picked_up", campfire, "add_log")
	add_child(pickup)
