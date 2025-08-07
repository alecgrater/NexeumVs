extends Node

# Configuration file paths
const CONFIG_PATHS = {
	"combat": "res://config/game/combat_settings.json",
	"movement": "res://config/game/movement_settings.json",
	"building": "res://config/game/building_settings.json",
	"network": "res://config/network/server_config.json",
	"audio": "res://config/audio/audio_settings.json",
	"graphics": "res://config/graphics/quality_presets.json"
}

# Cached configuration data
var config_cache = {}
var user_settings = {}

func _ready():
	load_all_configs()
	load_user_settings()
	print("SettingsManager: Initialized with %d config files" % CONFIG_PATHS.size())

func load_all_configs():
	for config_name in CONFIG_PATHS:
		load_config(config_name)

func load_config(config_name: String) -> Dictionary:
	if config_name in config_cache:
		return config_cache[config_name]
	
	var file_path = CONFIG_PATHS.get(config_name, "")
	if file_path.is_empty():
		push_error("SettingsManager: Unknown config: " + config_name)
		return {}
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		push_error("SettingsManager: Failed to load config: " + file_path)
		return {}
	
	var json_text = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var parse_result = json.parse(json_text)
	
	if parse_result != OK:
		push_error("SettingsManager: Failed to parse JSON in: " + file_path)
		return {}
	
	config_cache[config_name] = json.data
	print("SettingsManager: Loaded config '%s' with %d keys" % [config_name, json.data.size()])
	return json.data

func get_config_value(config_name: String, key_path: String, default_value = null):
	var config = load_config(config_name)
	return get_nested_value(config, key_path, default_value)

func get_nested_value(dict: Dictionary, key_path: String, default_value = null):
	var keys = key_path.split(".")
	var current = dict
	
	for key in keys:
		if current.has(key):
			current = current[key]
		else:
			return default_value
	
	return current

func save_user_setting(key: String, value):
	user_settings[key] = value
	save_user_settings()
	EventBus.emit_signal("settings_changed", key, user_settings.get(key, null), value)

func get_user_setting(key: String, default_value = null):
	return user_settings.get(key, default_value)

func save_user_settings():
	var file = FileAccess.open("user://settings.save", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(user_settings))
		file.close()
		print("SettingsManager: Saved %d user settings" % user_settings.size())

func load_user_settings():
	var file = FileAccess.open("user://settings.save", FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()
		
		var json = JSON.new()
		if json.parse(json_text) == OK:
			user_settings = json.data
			print("SettingsManager: Loaded %d user settings" % user_settings.size())

# Hot reload support for development
func _input(event):
	if event.is_action_pressed("reload_configs") and OS.is_debug_build():
		reload_all_configs()

func reload_all_configs():
	config_cache.clear()
	load_all_configs()
	EventBus.emit_signal("configs_reloaded")
	print("SettingsManager: Reloaded all configurations")

# Configuration validation
func validate_config(config_name: String, config_data: Dictionary) -> bool:
	match config_name:
		"combat":
			return validate_combat_config(config_data)
		"movement":
			return validate_movement_config(config_data)
		"building":
			return validate_building_config(config_data)
		_:
			return true

func validate_combat_config(config: Dictionary) -> bool:
	var required_keys = ["base_damage", "critical_multiplier", "combo_window"]
	for key in required_keys:
		if not config.has(key):
			push_error("SettingsManager: Missing required combat config key: " + key)
			return false
	
	if config.get("base_damage", 0) <= 0:
		push_error("SettingsManager: base_damage must be positive")
		return false
	
	return true

func validate_movement_config(config: Dictionary) -> bool:
	var required_keys = ["walk_speed", "run_speed", "jump_force"]
	for key in required_keys:
		if not config.has(key):
			push_error("SettingsManager: Missing required movement config key: " + key)
			return false
	
	return true

func validate_building_config(config: Dictionary) -> bool:
	var required_keys = ["grid_size", "max_build_distance", "build_height_limit"]
	for key in required_keys:
		if not config.has(key):
			push_error("SettingsManager: Missing required building config key: " + key)
			return false
	
	return true

# Platform-specific overrides
func load_config_with_overrides(config_name: String) -> Dictionary:
	var base_config = load_config(config_name)
	var platform_override = load_platform_override(config_name)
	
	return merge_configs(base_config, platform_override)

func load_platform_override(config_name: String) -> Dictionary:
	var platform = OS.get_name().to_lower()
	var override_path = "res://config/platform_overrides/" + platform + "/" + config_name + ".json"
	
	if FileAccess.file_exists(override_path):
		return load_json_file(override_path)
	
	return {}

func load_json_file(file_path: String) -> Dictionary:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		return {}
	
	var json_text = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	if json.parse(json_text) == OK:
		return json.data
	
	return {}

func merge_configs(base: Dictionary, override: Dictionary) -> Dictionary:
	var result = base.duplicate(true)
	
	for key in override:
		if override[key] is Dictionary and result.has(key) and result[key] is Dictionary:
			result[key] = merge_configs(result[key], override[key])
		else:
			result[key] = override[key]
	
	return result

# Debug function to print all loaded configs
func debug_print_configs():
	if not OS.is_debug_build():
		return
	
	print("SettingsManager: Loaded configurations:")
	for config_name in config_cache:
		print("  %s: %s" % [config_name, str(config_cache[config_name]).substr(0, 100) + "..."])