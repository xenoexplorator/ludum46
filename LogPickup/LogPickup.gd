extends Area2D

signal picked_up(value)
export (int) var value := 25


func _on_area_entered(area: Area2D) -> void:
	if area is RainDrop:
		value -= 3
		if value <= 0:
			queue_free()


func _on_body_entered(body: Node) -> void:
	if body is Player:
		if not body.needs_heat:
			emit_signal("picked_up", value)
			queue_free()
