extends Camera2D

onready var OverWorld = get_node("../")
onready var player = OverWorld.get_node("Actor")

func _process(delta):
	self.position = player.position
