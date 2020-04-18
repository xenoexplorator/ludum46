extends Node2D

enum Pattern { RANDOM, WAVE }
const SPAWN_THRESHOLD := 10.0
const RainDrop = preload("res://Rain/RainDrop.tscn")
export (Pattern) var pattern := Pattern.RANDOM
export (float) var spawn_rate := 10.0
var timer := 0.0
var pattern_counter := 0

func _ready() -> void:
	randomize()


func _process(delta: float) -> void:
	timer += delta * spawn_rate
	if timer > SPAWN_THRESHOLD:
		timer -= SPAWN_THRESHOLD
		match pattern:
			Pattern.RANDOM:
				spawn_random()
			Pattern.WAVE:
				spawn_wave()

func spawn_random() -> void:
	var drop = RainDrop.instance()
	var x = rand_range(0, get_viewport().size.x / $Container.scale.x)
	var y = rand_range(0, 20)
	drop.position = Vector2(x, y)
	drop.angle = rand_range(-10, 10) + rand_range(-10, 10)
	drop.speed = rand_range(70, 120)
	$Container.add_child(drop)


func spawn_wave() -> void:
	var drop = RainDrop.instance()
	var x = 2530 - 100 * abs(pattern_counter - 25)
	pattern_counter = (pattern_counter + 1) % 50
	drop.position = Vector2(x, 10)
	$Container.add_child(drop)


func change_pattern(pat: int) -> void:
	for drop in $Container.get_children():
		drop.queue_free()
	pattern = pat
	pattern_counter = 0
	timer = 0


func change_spawn_rate(value: float) -> void:
	spawn_rate = value
