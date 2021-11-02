extends Node2D

var spawn = Vector2(0,0)
var message_queue = []


func handle_message(message):
	message_queue.append(message)

func start():
	# Here is where we might load from a saved state. 
	pass

# ------------------
# Overworld Logic
# ------------------
func get_nodes_to_draw():
	
	pass



# ------------------
# Battle Scene Logic
# ------------------
