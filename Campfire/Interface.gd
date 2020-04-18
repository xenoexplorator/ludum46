extends Control

signal heat_updated(value)

func _ready():
#	var heat_node = get_node("Heat")
#
#	for node in get_tree().get_nodes_in_group("Campfire"):
#		if node.name == "Campfire":
#			heat_node = node.get_node("Heat")
#			break
#		get_node("HeatMonitoring").initialize(heat_node.max_heat)

	$HeatMonitoring/HeatBar.value = 100
	
func _on_Heat_heat_changed(heat):
	emit_signal("heat_updated", heat)
