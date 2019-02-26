extends Label

func _gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		$Coin.play()

func _on_Coin_finished():
	get_tree().change_scene('res://Main.tscn')