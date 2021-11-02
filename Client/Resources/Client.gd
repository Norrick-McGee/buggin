extends Node2D

onready var startScreen = get_node("StartScreen")
onready var gameManager = get_node("GameManager")
onready var Server = get_node("Server")

const DEFAULT_NAME = "Beelon Musk"


func connect_to(ip, port):
	Network.connect_to(ip, int(port))

func start_local():
	# self.game_mode = 'local'
	# loadingScreen.start()
	gameManager.start() # if we need a loading screen, we can pass it in here, and have the gameManager handle shutting down the Loading Screen
	
	self.remove_child(startScreen)
	pass

