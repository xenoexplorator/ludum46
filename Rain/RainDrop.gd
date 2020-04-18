extends KinematicBody2D

export (float, -180, 180, 20) var angle := 0.0
export (int) var speed := 50
var _velocity : Vector2

func _ready() -> void:
	angle = deg2rad(angle)
	_velocity = speed * Vector2(sin(angle), cos(angle))


func _physics_process(delta: float) -> void:
	move_and_collide(delta * _velocity)


func _on_screen_exited() -> void:
	queue_free()
