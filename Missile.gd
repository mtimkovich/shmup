extends RigidBody2D

export (int) var velocity

func _ready():
	set_linear_velocity(Vector2(0, -velocity))

func _on_Visibility_screen_exited():
	queue_free()
