extends Area2D

const X_MARGIN = 20

onready var screensize = get_viewport_rect().size
onready var hitbox = $Hitbox.get_shape().get_extents()

var dragging = false
var Missile = preload('res://Missile.tscn')
var touch_pos = Vector2()

func _ready():
	position.x = screensize.x/2
	position.y = screensize.y-40
	set_process_input(true)
	
func _process(delta):
	# Don't care about dragging on desktop.
	if dragging or (not OS.has_touchscreen_ui_hint() and not globals.DEBUG):
		var mouse_pos = get_viewport().get_mouse_position()
		set_position(mouse_pos + touch_pos)

func set_position(pos):
	position.x = pos.x
	position.x = clamp(position.x, X_MARGIN+hitbox.x, screensize.x-X_MARGIN-hitbox.x)
	
func shoot():
	for i in [-1, 1]:
		var missile = Missile.instance()
		missile.position = position - Vector2(i*(hitbox.x+3), hitbox.y*2)
		get_parent().get_node('Missile').add_child(missile)
#		globals.score += 1
	
func _input(event):
	if event is InputEventMouseButton and not event.is_pressed():
		dragging = false

func _on_Touchbox_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		dragging = true
		touch_pos = position - event.position

func _on_Main_start():
	$DPS.start()
	$BeamSound.play()
