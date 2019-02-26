extends Label

func _gui_input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene('res://Main.tscn')
