extends CanvasLayer

var transitioning : bool = false
var currentTransition : Transition

func transition_to_scene(scene : PackedScene):
	if not transitioning:
		currentTransition = Scene_Transition.new(scene)
		commit_transition()

func transition_with_path(path : String):
	if not transitioning:
		currentTransition = PathSceneTransition.new(path)
		commit_transition()

func transition_to_quit():
	if not transitioning:
		currentTransition = Exit_Transition.new()
		commit_transition()

func commit_transition():
		transitioning = true
		add_child(currentTransition)
		$AnimationPlayer.play("transition")

func change():
	currentTransition.transition()
	remove_child(currentTransition)
	transitioning = false
