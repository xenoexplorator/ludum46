extends ColorRect

var invisible_black : Color = Color(0,0,0,0)
var transitioning : bool = false
var currentTransition : Transition

func _ready():
	$Tween.interpolate_property(self, "color", invisible_black, Color.black, 1)
	$TweenShow.interpolate_property(self, "color", Color.black, invisible_black, 1)
	pass

func transition_to_scene(scene : PackedScene):
	if not transitioning:
		currentTransition = Scene_Transition.new(scene)
		commit_transition()

func transition_to_quit():
	if not transitioning:
		currentTransition = Exit_Transition.new()
		commit_transition()

func commit_transition():
		transitioning = true
		add_child(currentTransition)
		$Tween.start()

func _on_Tween_tween_all_completed():
	currentTransition.transition()
	remove_child(currentTransition)
	transitioning = false
	$TweenShow.start()
