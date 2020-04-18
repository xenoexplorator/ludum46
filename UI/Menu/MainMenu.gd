extends Control

const Level = preload("res://Level/Level.tscn")

func _ready():
	pass


func _on_Start_pressed():
	SceneTransitioner.transition_to_scene(Level)


func _on_Quit_pressed():
	SceneTransitioner.transition_to_quit()


func _on_HowTo_pressed():
	$HowTo.show()
