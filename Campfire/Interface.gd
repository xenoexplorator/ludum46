extends Control

signal heat_updated(value)
	
func _on_Campfire_heat_changed(heat):
	emit_signal("heat_updated", heat)
