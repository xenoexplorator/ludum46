extends Node2D

const RainDrop = preload("res://Rain/RainDrop.tscn")

export (float) var spawn_delay := 1.0

var _timer := 0.0
onready var _next_spawn := spawn_delay

func _ready() -> void:
	randomize()
	get_tree().call_group("hud", "start")


func _process(delta: float) -> void:
	_timer += delta
	if _timer > _next_spawn:
		var drop = RainDrop.instance()
		var x = randf() * (get_viewport().size.x / $RainContainer.scale.x)
		var y = randf() * 20
		drop.position = Vector2(x, y)
		drop.angle = randf() * 20 + randf() * 20 - 20
		drop.speed = randf() * 40 + 60
		$RainContainer.add_child(drop)
		_next_spawn += spawn_delay
