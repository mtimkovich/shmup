extends Label

var opacity = 1

func _ready():
	# This timer is so the click works even if sound does not play.
	$Coin/Timer.wait_time = $Coin.stream.get_length()

func _on_StartArea_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		$Coin.play()
		$Coin/Timer.start()

func _on_Coin_timeout():
	get_tree().change_scene('res://Main.tscn')

func _on_Blink_timeout():
	opacity = 1 - opacity
	modulate.a = opacity