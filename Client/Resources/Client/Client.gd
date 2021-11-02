extends Node2D

onready var startScreen = get_node("StartScreen")
onready var gameManager = get_node("GameManager")
onready var Server = get_node("GameManager/Server")

const DEFAULT_NAME = "Beelon Musk"


func connect_to(ip, port):
	"""
	Sets our Client's Network Peer as 'client' to an IP Addr
	Args:
		ip(String): Ip address to connect to
		port(String): Port number to connect to  
	Returns:
		None
	"""
	Network.connect_to(ip, int(port))

func start_local():
	"""
	Starts a local hosted session
	Args:
		None
	Returns:
		None
	"""
	# self.game_mode = 'local'
	# loadingScreen.start()
	gameManager.start() # if we need a loading screen, we can pass it in here, and have the gameManager handle shutting down the Loading Screen
	
	self.remove_child(startScreen)
	pass

func set_player_name(name):
	gameManager.player_name = name


func _ready():
	"""
	Desc of the func
	Args:
		arg1(int): desc of arg1
	Returns:
		returnValue(Array[String])
	"""


func _process(delta):
	if Input.is_action_just_pressed("debug_print"):
		print("---------------------")
		print("Debugging Diagnostics")
		print("---------------------")
		gameManager.debug()
		Server.debug()
		
