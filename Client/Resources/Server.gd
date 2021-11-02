extends Node2D

var spawn = Vector2(0,0)
var message_queue = []
var rng = RandomNumberGenerator.new()

func handle_message(message):
	message_queue.append(message)

func start():
	"""
	basically the _ready function.
	Args:
		None
	Returns:
		None
	"""
	# Here is where we might load from a saved state. 
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
	var player = {
		'id':'1234',
		'position':Vector2(rng.randi_range(0,200),rng.randi_range(0,200))
	}
	return [player] 


# ------------------
# Battle Scene Logic
# ------------------


# ------------------
# Debugging message
# ------------------
func debug():
	print("Server status: OK")
	
