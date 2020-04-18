extends Control

signal heat_updated(value)

func _ready():
	var heat_node = node.get_node("Heat")
	get_node("HeatMonitoring").initialize(heat_node.max_heat)
	
func _on_Heat_heat_changed(heat):
	emit_signal("heat_updated", heat)
