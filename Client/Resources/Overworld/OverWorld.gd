extends Node2D

var current_nodes = {}

func draw_nodes(nodes_to_draw):
	"""
	Desc of the func
	Args:
		arg1(int): desc of arg1
	Returns:
		None
	"""
	# Calculate Nodes to Add
	
	var node = nodes_to_draw[0]
	get_node("Actor").position = node['position']
	
	pass
# ------------------
# Debugging message
# ------------------
func debug():
	print("Overworld status: OK")
