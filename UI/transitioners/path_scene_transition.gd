extends Transition

class_name PathSceneTransition

var path : String

func _init(go_to_scene : String):
	path = go_to_scene
	

func transition():
	get_tree().change_scene(path)
