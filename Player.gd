extends Area2D

signal point
var screensize
export (int) var speed
const X_MARGIN = 20
var hitbox
export (PackedScene) var Missile

func _ready():
	screensize = get_viewport_rect().size
	position.x = screensize.x/2
	position.y = screensize.y-30
	hitbox = $Hitbox.get_shape().get_extents()
	
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	
	velocity = velocity.normalized()
		
	position.x += velocity.x * speed * delta
	position.x = clamp(position.x, X_MARGIN+hitbox.x, screensize.x-X_MARGIN-hitbox.x)

func shoot():
	for i in [-1, 1]:
		var missile = Missile.instance()
		missile.position = position - Vector2(i*hitbox.x, hitbox.y*2)
		get_node('../Missiles').add_child(missile)
		emit_signal('point')
		