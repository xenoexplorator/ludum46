extends Transition

class_name Scene_Transition

var scene : PackedScene

func _init(go_to_scene : PackedScene):
	scene = go_to_scene
	

func transition():
	get_tree().change_scene_to(scene)
