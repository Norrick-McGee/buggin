extends Node2D

onready var Client = get_node("/root/Client")
onready var Server = get_node("Server")

onready var battleScene = get_node("BattleScene")
onready var overWorld = get_node("OverWorld")

onready var player_name = Client.DEFAULT_NAME
var clientID: String
var activeScene = "OverWorld"


func start():
	"""
	basically the _ready function.
	Args:
		None
	Returns:
		None
	"""
	self.activeScene = "OverWorld"
	# TODO: 
	#   We need to get a "Client ID", let's just use 1234 as the place holder for now
	self.clientID = '1234'
	
	Server.initialize()
	Server.initialize_player(clientID)
	
	# Set current camera to Overworld's player camera (this camera follows the player)
	get_node("OverWorld/Camera2D").current = true

func _process(delta):
	# ------------------
	# Capture user input and send to interested parties. 
	# ------------------
	var message = {
		'left': Input.is_action_pressed('left'),
		'right': Input.is_action_pressed('right'),
		'up': Input.is_action_pressed('up'),
		'down': Input.is_action_pressed('down'),
	}
	
	# We include active scene for lag reasons during multiplayer
	message['activeScene'] = activeScene
	message['id'] = self.clientID
	Server.update_player_dir(message)
	
	if activeScene == "OverWorld":
		
		# -------------------
		# overworld mode
		# -------------------
		# window focus is exactly where in the world we are looking.
		# This is used so that "GameManager"/"Overworld" only render nearby nodes
		var window_center = Vector2(120, 120)
		var nodes_to_draw = Server.get_nodes_to_draw(window_center)
		
		overWorld.draw_nodes(nodes_to_draw)
		
	if activeScene == 'BattleScene':
		# -------------------
		# BattleScene mode
		# -------------------
		pass
		
# ------------------
# Debugging message
# ------------------
func debug():
	print("Game Manager status:")
	print("\tActive Scene: {scene}".format({"scene":self.activeScene}))
	overWorld.debug()
	# battleScene.debug()

