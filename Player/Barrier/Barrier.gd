extends RigidBody2D

var target : Node2D


func _physics_process(delta):
	if target:
		look_at(target.position)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
