extends KinematicBody2D

export var id: String
export var dir: Vector2
export var speed: int = 20


func _physics_process(delta):
	if Input.is_action_pressed("debug_print"):
		self.position.x += 0.5
		self.position.y += 0.5
