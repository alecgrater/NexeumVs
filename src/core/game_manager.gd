extends Node

# Main game manager that coordinates all game systems
# This is the entry point and orchestrator for the entire game

@onready var ui_layer = $UI
@onready var main_menu = $UI/MainMenu
@onready var game_world = $GameWorld

var settings_manager: Node
var current_scene_state: String = "menu"
var players: Array = []
var match_data: Dictionary = {}

func _ready():
	print("GameManager: Initializing...")
	
	# Connect to autoload systems
	setup_connections()
	
	# Initialize game systems
	initialize_systems()
	
	# Setup UI connections
	setup_ui_connections()
	
	# Set initial game state
	GameGlobals.set_game_state(GameGlobals.GameState.MENU)
	
	print("GameManager: Initialization complete")

func setup_connections():
	# Connect to EventBus signals
	EventBus.game_state_changed.connect(_on_game_state_changed)
	EventBus.player_connected.connect(_on_player_connected)
	EventBus.player_disconnected.connect(_on_player_disconnected)
	EventBus.match_found.connect(_on_match_found)
	
	# Get reference to settings manager
	settings_manager = get_node("/root/SettingsManager")
	if not settings_manager:
		# Create settings manager if it doesn't exist
		settings_manager = preload("res://src/core/settings_manager.gd").new()
		settings_manager.name = "SettingsManager"
		get_tree().root.add_child(settings_manager)

func initialize_systems():
	# Initialize core game systems
	print("GameManager: Initializing game systems...")
	
	# TODO: Initialize player system
	# TODO: Initialize combat system
	# TODO: Initialize building system
	# TODO: Initialize network system
	# TODO: Initialize audio system
	
	print("GameManager: Game systems initialized")

func setup_ui_connections():
	# Connect main menu buttons
	var start_button = main_menu.get_node("VBoxContainer/StartButton")
	var settings_button = main_menu.get_node("VBoxContainer/SettingsButton")
	var quit_button = main_menu.get_node("VBoxContainer/QuitButton")
	
	if start_button:
		start_button.pressed.connect(_on_start_game_pressed)
	if settings_button:
		settings_button.pressed.connect(_on_settings_pressed)
	if quit_button:
		quit_button.pressed.connect(_on_quit_pressed)

func _on_game_state_changed(old_state, new_state):
	print("GameManager: Game state changed from %s to %s" % [old_state, new_state])
	
	match new_state:
		GameGlobals.GameState.MENU:
			show_main_menu()
		GameGlobals.GameState.LOADING:
			show_loading_screen()
		GameGlobals.GameState.PLAYING:
			start_gameplay()
		GameGlobals.GameState.PAUSED:
			pause_game()
		GameGlobals.GameState.GAME_OVER:
			end_game()

func show_main_menu():
	main_menu.visible = true
	game_world.visible = false
	current_scene_state = "menu"

func show_loading_screen():
	main_menu.visible = false
	game_world.visible = false
	current_scene_state = "loading"
	# TODO: Show loading screen UI

func start_gameplay():
	main_menu.visible = false
	game_world.visible = true
	current_scene_state = "game"
	
	# Initialize game world
	setup_arena()
	spawn_players()

func pause_game():
	get_tree().paused = true
	# TODO: Show pause menu

func end_game():
	get_tree().paused = false
	# TODO: Show game over screen
	# TODO: Display match results

func setup_arena():
	print("GameManager: Setting up arena...")
	# TODO: Load arena scene
	# TODO: Initialize arena lighting
	# TODO: Setup arena boundaries

func spawn_players():
	print("GameManager: Spawning players...")
	# TODO: Create player instances
	# TODO: Position players at spawn points
	# TODO: Initialize player controllers

# UI Event Handlers
func _on_start_game_pressed():
	print("GameManager: Start game pressed")
	GameGlobals.set_game_state(GameGlobals.GameState.LOADING)
	
	# Simulate loading delay
	await get_tree().create_timer(1.0).timeout
	GameGlobals.set_game_state(GameGlobals.GameState.PLAYING)

func _on_settings_pressed():
	print("GameManager: Settings pressed")
	EventBus.emit_signal("menu_opened", "settings")
	# TODO: Open settings menu

func _on_quit_pressed():
	print("GameManager: Quit pressed")
	get_tree().quit()

# Network Event Handlers
func _on_player_connected(peer_id: int):
	print("GameManager: Player connected with ID: %d" % peer_id)
	# TODO: Handle player connection

func _on_player_disconnected(peer_id: int):
	print("GameManager: Player disconnected with ID: %d" % peer_id)
	# TODO: Handle player disconnection

func _on_match_found(match_info: Dictionary):
	print("GameManager: Match found: %s" % str(match_info))
	match_data = match_info
	GameGlobals.set_game_state(GameGlobals.GameState.LOADING)

# Debug functions
func _input(event):
	if not OS.is_debug_build():
		return
	
	if event.is_action_pressed("ui_accept") and Input.is_action_pressed("ui_select"):
		# Debug: Toggle game state
		if GameGlobals.current_game_state == GameGlobals.GameState.MENU:
			GameGlobals.set_game_state(GameGlobals.GameState.PLAYING)
		else:
			GameGlobals.set_game_state(GameGlobals.GameState.MENU)

func get_game_info() -> Dictionary:
	return {
		"version": GameGlobals.VERSION,
		"build_date": GameGlobals.BUILD_DATE,
		"current_state": GameGlobals.get_game_state_string(),
		"scene_state": current_scene_state,
		"player_count": players.size(),
		"is_multiplayer": GameGlobals.is_multiplayer()
	}