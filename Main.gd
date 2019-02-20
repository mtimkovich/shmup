extends Node

var score = 0

func _ready():
	$HUD/Score.text = "%02d" % score

func update_score():
	score += 1
	$HUD/Score.text = "%02d" % score