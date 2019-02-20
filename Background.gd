extends Sprite

var score = 0

func _on_Timer_timeout():
	# TODO: https://github.com/godotengine/godot/issues/16007
	frame = (frame + 1) % (vframes * hframes)
