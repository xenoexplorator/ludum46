extends Control


func _ready():
	$MarginContainer/RichTextLabel.bbcode_text = $MarginContainer/RichTextLabel.bbcode_text.replace("{0}", str(Score.elapsed_time))


func _on_Timer_timeout():
	SceneTransitioner.go_to("res://UI/Menu/MainMenu.tscn")
