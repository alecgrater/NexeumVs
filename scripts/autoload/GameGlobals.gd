extends Node

# Game version and build info
const VERSION = "0.1.0"
const BUILD_DATE = "2025-08-06"

# Game states
enum GameState {
	MENU,
	LOADING,
	PLAYING,
	PAUSED,
	GAME_OVER
}

# Player states
enum PlayerState {
	IDLE,
	WALKING,
	RUNNING,
	JUMPING,
	FALLING,
	DASHING,
	WALL_KICKING,
	ATTACKING,
	BUILDING,
	DEAD
}

# Building piece types
enum BuildingPieceType {
	WALL,
	FLOOR,
	RAMP,
	ROOF,
	STAIRS,
	CUSTOM
}

# Combat types
enum AttackType {
	LIGHT,
	HEAVY,
	SPECIAL
}

# Global game variables
var current_game_state: GameState = GameState.MENU
var debug_mode: bool = false
var god_mode: bool = false
var show_fps: bool = false

# Player data
var player_name: String = "Player"
var player_wins: int = 0
var player_losses: int = 0
var player_rating: float = 1000.0

# Match data
var current_match_id: String = ""
var match_start_time: float = 0.0
var match_duration: float = 0.0

# Network data
var is_host: bool = false
var is_connected: bool = false
var peer_id: int = -1
var server_region: String = "us-west"

# Settings references
var settings_manager: Node
var config_cache: Dictionary = {}

func _ready():
	# Initialize debug mode based on build
	debug_mode = OS.is_debug_build()
	
	# Connect to settings manager when available
	call_deferred("_connect_settings_manager")

func _connect_settings_manager():
	settings_manager = get_node_or_null("/root/SettingsManager")
	if settings_manager:
		print("GameGlobals: Connected to SettingsManager")

func get_game_state_string() -> String:
	match current_game_state:
		GameState.MENU:
			return "Menu"
		GameState.LOADING:
			return "Loading"
		GameState.PLAYING:
			return "Playing"
		GameState.PAUSED:
			return "Paused"
		GameState.GAME_OVER:
			return "Game Over"
		_:
			return "Unknown"

func set_game_state(new_state: GameState):
	var old_state = current_game_state
	current_game_state = new_state
	EventBus.emit_signal("game_state_changed", old_state, new_state)
	print("GameGlobals: State changed from ", get_game_state_string(), " to ", get_game_state_string())

func is_in_game() -> bool:
	return current_game_state == GameState.PLAYING

func is_multiplayer() -> bool:
	return is_connected and peer_id != -1

func get_build_info() -> String:
	return "NexeumVs v%s (Built: %s)" % [VERSION, BUILD_DATE]

# Debug functions
func toggle_debug_mode():
	debug_mode = !debug_mode
	EventBus.emit_signal("debug_mode_toggled", debug_mode)

func toggle_god_mode():
	if debug_mode:
		god_mode = !god_mode
		EventBus.emit_signal("god_mode_toggled", god_mode)

func toggle_fps_display():
	show_fps = !show_fps
	EventBus.emit_signal("fps_display_toggled", show_fps)