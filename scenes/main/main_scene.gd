extends Node

# Simple main scene controller for testing
# This is a minimal version to verify the project setup works

@onready var main_menu = $UI/MainMenu
@onready var game_world = $GameWorld
@onready var start_button = $UI/MainMenu/VBoxContainer/StartButton
@onready var settings_button = $UI/MainMenu/VBoxContainer/SettingsButton
@onready var quit_button = $UI/MainMenu/VBoxContainer/QuitButton

func _ready():
	print("NexeumVs: Main scene loaded successfully!")
	
	# Connect button signals
	if start_button:
		start_button.pressed.connect(_on_start_pressed)
	if settings_button:
		settings_button.pressed.connect(_on_settings_pressed)
	if quit_button:
		quit_button.pressed.connect(_on_quit_pressed)
	
	# Show main menu initially
	show_main_menu()

func show_main_menu():
	main_menu.visible = true
	game_world.visible = false
	print("NexeumVs: Showing main menu")

func show_game_world():
	main_menu.visible = false
	game_world.visible = true
	print("NexeumVs: Showing game world")

func _on_start_pressed():
	print("NexeumVs: Start button pressed")
	show_game_world()

func _on_settings_pressed():
	print("NexeumVs: Settings button pressed")
	# TODO: Open settings menu

func _on_quit_pressed():
	print("NexeumVs: Quit button pressed")
	get_tree().quit()

# Debug input for testing
func _input(event):
	if event.is_action_pressed("ui_cancel"):  # ESC key
		if game_world.visible:
			show_main_menu()