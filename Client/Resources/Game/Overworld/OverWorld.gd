extends Node2D

onready var player = get_node("Actor")

var current_nodes = {}
var actors = {} # {'1234':get_node("Player")}


func draw_nodes(nodes_to_draw):
	"""
	For each node, we put you in the "Overworld" if you're not already there
	Then we Set it's position to your proper position
	Then we adjust it's "Action" (ie, currently slashing a sword) 
	Args:
		nodes_to_draw(Array[Dictionary]): a list of Dictionaries
			{"id":String, "position":Vector2, "animation":int?, "direction": Vector2}
	Side-Effects:
		Paints Many Nodes
		Changes Many Nodes' states
	"""
	# Calculate Nodes to Add to scene
	
	# Draw each of the nodes :)
	for node in nodes_to_draw:
		actors[node['id']].position = node['position']
	
	
func _ready():
	self.actors['1234'] = player
# ------------------
# Debugging message
# ------------------
func debug():
	print("Overworld status:")
	print("\tActors in Overworld: {actor_count}".format({"actor_count":len(self.actors)}))
