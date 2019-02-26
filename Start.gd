extends Label

var opacity = 1

func _gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		$Coin.play()

func _on_Coin_finished():
	get_tree().change_scene('res://Main.tscn')

func _on_Timer_timeout():
	opacity = 1 - opacity
	modulate.a = opacity