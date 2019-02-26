extends Node

signal start

func _process(delta):
	$HUD/Score.text = "%02d" % globals.score

func _on_StartTimer_timeout():
	$StageLabel.hide()
	emit_signal('start')
