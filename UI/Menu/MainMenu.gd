extends Control

const Level = preload("res://Level/Level.tscn")

func _ready():
	pass


func _on_Start_pressed():
	SceneTransitioner.go_to(Level)


func _on_Quit_pressed():
	SceneTransitioner.go_to(null)


func _on_HowTo_pressed():
	$HowTo.show()


func _on_Credits_pressed():
	$Credits.show()
