extends Node

# Save/Load system for game data persistence
# Handles player progress, settings, and game state

const SAVE_FILE = "user://savegame.save"
const SETTINGS_FILE = "user://settings.save"

var game_data: Dictionary = {}
var default_save_data: Dictionary = {
	"player_name": "Player",
	"wins": 0,
	"losses": 0,
	"rating": 1000.0,
	"matches_played": 0,
	"total_playtime": 0.0,
	"achievements": [],
	"unlocked_content": [],
	"statistics": {
		"total_damage_dealt": 0.0,
		"total_damage_taken": 0.0,
		"buildings_placed": 0,
		"buildings_destroyed": 0,
		"longest_combo": 0,
		"fastest_victory": 0.0
	},
	"preferences": {
		"auto_save": true,
		"show_damage_numbers": true,
		"camera_shake": true,
		"screen_flash": true
	}
}

func _ready():
	print("SaveSystem: Initializing save system...")
	load_game_data()
	
	# Connect to relevant events
	EventBus.game_ended.connect(_on_game_ended)
	EventBus.settings_changed.connect(_on_settings_changed)

func save_game_data():
	"""Save current game data to file"""
	var save_file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	if not save_file:
		push_error("SaveSystem: Cannot open save file for writing")
		return false
	
	# Add timestamp
	game_data["last_saved"] = Time.get_unix_time_from_system()
	game_data["version"] = GameGlobals.VERSION
	
	var json_string = JSON.stringify(game_data)
	save_file.store_string(json_string)
	save_file.close()
	
	print("SaveSystem: Game data saved successfully")
	return true

func load_game_data():
	"""Load game data from file"""
	if not FileAccess.file_exists(SAVE_FILE):
		print("SaveSystem: No save file found, using defaults")
		game_data = default_save_data.duplicate(true)
		save_game_data()  # Create initial save file
		return
	
	var save_file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if not save_file:
		push_error("SaveSystem: Cannot open save file for reading")
		game_data = default_save_data.duplicate(true)
		return
	
	var json_string = save_file.get_as_text()
	save_file.close()
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	
	if parse_result != OK:
		push_error("SaveSystem: Error parsing save file")
		game_data = default_save_data.duplicate(true)
		return
	
	game_data = json.data
	
	# Merge with defaults to ensure all keys exist
	for key in default_save_data:
		if not game_data.has(key):
			game_data[key] = default_save_data[key]
	
	print("SaveSystem: Game data loaded successfully")

func get_save_data(key: String, default_value = null):
	"""Get a value from save data"""
	return game_data.get(key, default_value)

func set_save_data(key: String, value):
	"""Set a value in save data"""
	game_data[key] = value

func increment_stat(stat_name: String, amount: float = 1.0):
	"""Increment a statistic value"""
	if not game_data.has("statistics"):
		game_data["statistics"] = {}
	
	var current_value = game_data["statistics"].get(stat_name, 0.0)
	game_data["statistics"][stat_name] = current_value + amount

func unlock_achievement(achievement_id: String):
	"""Unlock an achievement"""
	if not game_data.has("achievements"):
		game_data["achievements"] = []
	
	if achievement_id not in game_data["achievements"]:
		game_data["achievements"].append(achievement_id)
		EventBus.emit_notification("Achievement Unlocked: " + achievement_id, "achievement")
		print("SaveSystem: Achievement unlocked: ", achievement_id)

func is_achievement_unlocked(achievement_id: String) -> bool:
	"""Check if an achievement is unlocked"""
	return achievement_id in game_data.get("achievements", [])

func unlock_content(content_id: String):
	"""Unlock content (characters, arenas, etc.)"""
	if not game_data.has("unlocked_content"):
		game_data["unlocked_content"] = []
	
	if content_id not in game_data["unlocked_content"]:
		game_data["unlocked_content"].append(content_id)
		print("SaveSystem: Content unlocked: ", content_id)

func is_content_unlocked(content_id: String) -> bool:
	"""Check if content is unlocked"""
	return content_id in game_data.get("unlocked_content", [])

func reset_save_data():
	"""Reset all save data to defaults"""
	game_data = default_save_data.duplicate(true)
	save_game_data()
	print("SaveSystem: Save data reset to defaults")

func delete_save_file():
	"""Delete the save file"""
	if FileAccess.file_exists(SAVE_FILE):
		DirAccess.remove_absolute(SAVE_FILE)
		print("SaveSystem: Save file deleted")

# Event handlers
func _on_game_ended(winner_id: int):
	"""Handle game end for statistics"""
	increment_stat("matches_played")
	
	if winner_id == GameGlobals.peer_id:
		increment_stat("wins")
		set_save_data("wins", get_save_data("wins", 0) + 1)
	else:
		increment_stat("losses")
		set_save_data("losses", get_save_data("losses", 0) + 1)
	
	# Auto-save after each match
	if get_save_data("preferences", {}).get("auto_save", true):
		save_game_data()

func _on_settings_changed(setting_name: String, old_value, new_value):
	"""Handle settings changes"""
	if setting_name.begins_with("preference_"):
		var pref_name = setting_name.substr(11)  # Remove "preference_" prefix
		if not game_data.has("preferences"):
			game_data["preferences"] = {}
		game_data["preferences"][pref_name] = new_value

# Auto-save functionality
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		# Save before quitting
		save_game_data()

func get_player_stats() -> Dictionary:
	"""Get formatted player statistics"""
	return {
		"name": get_save_data("player_name", "Player"),
		"wins": get_save_data("wins", 0),
		"losses": get_save_data("losses", 0),
		"rating": get_save_data("rating", 1000.0),
		"matches_played": get_save_data("matches_played", 0),
		"win_rate": _calculate_win_rate(),
		"playtime": _format_playtime(get_save_data("total_playtime", 0.0))
	}

func _calculate_win_rate() -> float:
	var wins = get_save_data("wins", 0)
	var losses = get_save_data("losses", 0)
	var total = wins + losses
	
	if total == 0:
		return 0.0
	
	return (float(wins) / float(total)) * 100.0

func _format_playtime(seconds: float) -> String:
	var hours = int(seconds) / 3600
	var minutes = (int(seconds) % 3600) / 60
	return "%d:%02d" % [hours, minutes]