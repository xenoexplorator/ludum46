extends Area2D

class_name RainDrop

export (float, -180, 180, 20) var angle := 0.0
export (int) var speed := 50
var velocity : Vector2

func _ready() -> void:
	angle = deg2rad(angle)
	velocity = speed * Vector2(sin(angle), cos(angle))


func _process(delta: float) -> void:
	position += delta * velocity


func _on_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node) -> void:
	if body is Player:
		body.hurt()
		turn_to_steam()
	else:
		queue_free()

func turn_to_steam():
	set_deferred("monitoring", false)
	$AnimationPlayer.play("steam")
