extends Node

onready var Client = get_node("/root/Client")

const DEFAULT_PORT = 6767

func connect_to(ip: String, port: int):
	var enet: NetworkedMultiplayerENet
	
	enet = NetworkedMultiplayerENet.new()
	enet.create_client(ip, port)
	
	get_tree().set_network_peer(enet)
	
	pass
