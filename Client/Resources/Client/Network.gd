extends Node

onready var Client = get_node("/root/Client")

const DEFAULT_PORT = 6767

func connect_to(ip: String, port: int):
	"""
	connects to a remote eNet server
	Args:
		ip(String): ipv4 address
		port(port): ipv4 address port
	Returns:
		None
	"""
	var enet: NetworkedMultiplayerENet
	
	enet = NetworkedMultiplayerENet.new()
	enet.create_client(ip, port)
	
	get_tree().set_network_peer(enet)
