extends Node2D

# Client is basically a singleton
onready var Client = get_node("/root/Client")

onready var ipTextObj = get_node("CanvasLayer/IpTextBox")
onready var portTextObj = get_node("CanvasLayer/PortTextBox")
onready var nameTextObj = get_node("CanvasLayer/NameTextBox")

func cleaned(s: String):
	return s.strip_escapes()
	
func _on_LocalPlay_pressed():
	"""
	Button press start Game in Local Play mode
	Args:
		None
	Returns:
		None
	"""
	Client.set_player_name( cleaned(nameTextObj.text) )
	Client.start_local()
