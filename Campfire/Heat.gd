extends Area2D


	
func _on_Heat_body_entered(body):
	if body is Player:
		body.is_in_heat = true

func _on_Heat_body_exited(body):
	if body is Player:
		body.is_in_heat = false

