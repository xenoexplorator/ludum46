extends Area2D

signal picked_up(value)
export (int) var value := 10


func _on_area_entered(area: Area2D) -> void:
	# Collision avec une goutte d'eau, perte de valeur pour la bûche
	value -= 1
	if value <= 0:
		queue_free()


func _on_body_entered(body: Node) -> void:
	if body is Player:
		emit_signal("picked_up", value)
		queue_free()
