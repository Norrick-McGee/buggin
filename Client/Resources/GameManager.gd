extends Node2D

onready var Client = get_node("/root/Client")
onready var Server = get_node("Server")

onready var battleScene = get_node("BattleScene")
onready var overWorld = get_node("OverWorld")

var player_name = Client.DEFAULT_NAME
var activeScene = "OverWorld"

func start():
	self.activeScene = "OverWorld"
	Server.start()

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
	Server.handle_message(message)
	
	if activeScene == "OverWorld":
		
		# -------------------
		# overworld mode
		# -------------------
		# window focus is exactly where in the world we are looking.
		var window_focus = Vector2(120, 120)
		var nodes_to_draw = Server.get_nodes_to_draw(window_focus)
		
		overWorld.draw_nodes(nodes_to_draw)
		
	if activeScene == 'BattleScene':
		# -------------------
		# BattleScene mode
		# -------------------
		pass
