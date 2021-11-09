extends Node2D
"""
Server.gd: 
	The biggus-Brainus of the game
	This server node is in charge of keeping track of all the "Actors"'s position 
	in the Overworld, all active battles, and player stats etc.
	
	The purpose of keeping this logic seperate from the GameManager is completely
	due to the fact that we want to add Multiplayer
	I don't want the "OverWorld" node and "BattleScenes" behaving differently 
	between Multiplayer-host, Multiplayer-client and localplay.
	So, OverWorld acts as a window into "Server" (same of Battle Scene)
	Server updates itself based on "GameManager" inputs, and if in multiplayer mode
	Server will send those updates to the Remote-Server, and also sync (Host authoratative)
	with Remote-Server.
	
TL;DR:
	  Server is the world. "OverWorld" or "BattleScene" are 'windows' into the Server
	  if host: Server updates self, can get updates from others.
	  if not host: Server updates self, but also sync with remote, (remote authorative)
"""

var spawn = Vector2(0,0)
onready var actors = {}
var message_queue = []

func update_player_dir(message):
	"""
	update's a given player's directional input
	Args:
		message(Dictionary['id'(str), 'direction'(Vec2)])
	Returns:
		None
	"""
	var player_id = message['id']
	# Left = x(negative), Right = x(positive), Up = y(Negative!!!), Down = y(positive)
	var dir = Vector2(int(message['right']) - int(message['left']), int(message['down']) - int(message['up']))
	if player_id in actors: 
		actors[player_id].dir = dir
	

func initialize():
	"""
	basically the _ready function.
	Args:
		None
	Returns:
		None
	"""
	self.load_map()
	
func initialize_player(clientID):
	var player_actor = get_node("Actor")
	self.actors[clientID] = player_actor
	pass

# ------------------
# Overworld Logic
# ------------------
func get_nodes_to_draw(focus_position):
	"""
	Collects a list of Nodes (actors, obstacles etc.) for the OverWorld to draw
	Args:
		focus_position(Vector2): Focus of area we will be scouting for nodes to draw
	Return:
		list_of_nodes(Array[Dictionary])
	"""
	
	var l = []
	for a in actors:
		l.append({'id':a, 'position':actors[a].position})
	
	return l

func load_map():
	"""
	Loads whatever map we are wanting to use
	Side-Effects:
		Spawns many nodes as children of self
	"""
	# ---------
	# load non-players (map/trees/treasure chests)
	# ---------
	
	# ---------
	# add player
	# ---------
	# load(/path/to/Player.tscn)
	# Place player at self.spawn
	
	# ---------
	# add other actors (players/npcs)
	# ---------

# ------------------
# Battle Scene Logic
# ------------------


# ------------------
# Main
# ------------------
func _physics_process(delta):
	# Todo:
	# Move the player and other Actors based on their dir+speed. 
	# Moving the player based on the messages which send us the input 
	
	# for node in battles: node.update(import_info_dictionary)
	# for node in overworlds: node.update(import_info_dictionary)	
	for actor in actors.values():
		if actor.dir != Vector2(0,0):
			actor.move_and_slide(actor.dir*actor.speed*100*delta)
	pass

# ------------------
# Debugging message
# ------------------
func debug():
	print("Server status:")
	print("\tmessages in queue: {msgs}".format({"msgs":len(self.message_queue)}))
