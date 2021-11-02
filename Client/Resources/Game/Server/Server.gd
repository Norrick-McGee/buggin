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
	So, OverWorld acts as a window into "Server"
	Server updates itself based on "GameManager" inputs, and if in multiplayer mode
	Server will send those updates to the Remote-Server, and also sync (Host authoratative)
	with Remote-Server.
	
TL;DR:
	  Server is the world. "OverWorld" or "BattleScene" are 'windows' into the Server
	  if host: Server updates self, can get updates from others.
	  if not host: Server updates self, but also sync with remote, (remote authorative)
"""

var spawn = Vector2(0,0)
var message_queue = []

func update_player_dir(message):
	
	message_queue.append(message)

func start():
	"""
	basically the _ready function.
	Args:
		None
	Returns:
		None
	"""
	self.load_map()

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
	var demo_node = get_node("Actor")
	var player = {
		'id':demo_node.id,
		'position':demo_node.position
	}
	return [player] 

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
	pass

# ------------------
# Debugging message
# ------------------
func debug():
	print("Server status:")
	print("\tmessages in queue: {msgs}".format({"msgs":len(self.message_queue)}))
	
