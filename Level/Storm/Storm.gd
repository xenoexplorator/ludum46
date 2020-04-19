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


func _ready() -> void:
	randomize()
	campfire = get_node(campfire)


func _process(delta: float) -> void:
	timer += delta

	if spawn_randoms and timer > next_random:
		spawn_random()

	for event in $EventsContainer.get_children():
		if timer > event.timing:
			event.run(self)


func spawn_random():
	var drop = RainDrop.instance()
	var x = rand_range(40, 1240)
	var y = rand_range(0, 20)
	drop.position = Vector2(x, y)
	drop.angle = rand_range(-10, 10) + rand_range(-10, 10)
	drop.speed = rand_range(120, 180)
	spawn_drop(drop)
	next_random += SPAWN_THRESHOLD / spawn_rate


func spawn_log() -> void:
	var pickup = LogPickup.instance()
	var x = rand_range(80, 1200)
	var y = rand_range(80, 700)
	if y > 512:
		x = rand_range(300, 980)
	pickup.position = Vector2(x, y)
	pickup.connect("picked_up", campfire, "add_log")
	add_child(pickup)


# SECTION REFACTORING
func toggle_random():
	spawn_randoms = not spawn_randoms

func spawn_drop(drop):
	$DropsContainer.add_child(drop)

func set_rate(rate):
	spawn_rate = rate
