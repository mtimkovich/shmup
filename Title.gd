extends Control

var opacity = 1

func _ready():
	$TitleTheme.play()
	$StartArea/Start/Timer.start()

func _on_StartArea_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		$StartArea/Start/Coin.play()

func _on_Coin_finished():
	get_tree().change_scene('res://Main.tscn')

func _on_Timer_timeout():
	# Blink
	opacity = 1 - opacity
	$StartArea/Start.modulate.a = opacity