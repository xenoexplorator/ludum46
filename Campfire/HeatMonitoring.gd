extends HBoxContainer

signal max_changed(max_heat)

var max_heat = 100
var current_heat = 0

func initialize(max_value):
	max_heat = max_value
	emit_signal("max_changed", max_heat)
	
func _on_Interface_heat_updated(new_heat):
	$HeatBar.value = new_heat
