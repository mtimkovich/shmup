extends Node

func _process(delta):
	$HUD/Score.text = "%02d" % globals.score