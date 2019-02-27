extends TileMap

var ID = 0
var SIZE = Vector2(320, 256)
var pos = Vector2()
var frame = 0
var frame_rect = Rect2(pos, SIZE)

const VFRAMES = 5
const HFRAMES = 3

func _ready():
	tile_set.tile_set_region(ID, frame_rect)

func _on_Timer_timeout():
	frame = (frame + 1) % (VFRAMES * HFRAMES)

	if frame == 0:
		pos = Vector2()
	elif frame % VFRAMES == 0:
		pos = Vector2(0, pos.y+SIZE.y)
	else:
		pos.x += SIZE.x
		
	frame_rect.position = pos
	tile_set.tile_set_region(ID, frame_rect)