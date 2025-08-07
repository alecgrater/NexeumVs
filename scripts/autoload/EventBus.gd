extends Node

# Global event bus for decoupled communication between systems
# This allows different parts of the game to communicate without direct references

# Game state events
signal game_state_changed(old_state, new_state)
signal game_started()
signal game_ended(winner_id: int)
signal game_paused()
signal game_resumed()

# Player events
signal player_spawned(player_id: int, position: Vector3)
signal player_died(player_id: int, killer_id: int)
signal player_respawned(player_id: int)
signal player_health_changed(player_id: int, old_health: float, new_health: float)
signal player_state_changed(player_id: int, old_state, new_state)

# Combat events
signal attack_performed(attacker_id: int, attack_type, target_position: Vector3)
signal hit_registered(attacker_id: int, victim_id: int, damage: float, attack_type)
signal combo_started(player_id: int)
signal combo_ended(player_id: int, combo_count: int)
signal critical_hit(attacker_id: int, victim_id: int, damage: float)

# Building events
signal building_piece_placed(player_id: int, piece_type, position: Vector3)
signal building_piece_destroyed(player_id: int, piece_type, position: Vector3)
signal building_piece_edited(player_id: int, piece_type, position: Vector3, edit_type)
signal build_mode_toggled(player_id: int, enabled: bool)
signal building_resources_changed(player_id: int, old_amount: int, new_amount: int)

# Movement events
signal player_jumped(player_id: int)
signal player_dashed(player_id: int, direction: Vector3)
signal player_wall_kicked(player_id: int, wall_normal: Vector3)
signal player_landed(player_id: int, fall_distance: float)

# Network events
signal player_connected(peer_id: int)
signal player_disconnected(peer_id: int)
signal connection_established()
signal connection_lost()
signal match_found(match_data: Dictionary)
signal synchronization_error(error_type: String)

# UI events
signal menu_opened(menu_name: String)
signal menu_closed(menu_name: String)
signal settings_changed(setting_name: String, old_value, new_value)
signal notification_shown(message: String, type: String)

# Audio events
signal music_track_changed(track_name: String)
signal sound_effect_played(sfx_name: String, position: Vector3)
signal audio_settings_changed()

# Debug events
signal debug_mode_toggled(enabled: bool)
signal god_mode_toggled(enabled: bool)
signal fps_display_toggled(enabled: bool)
signal debug_command_executed(command: String, result)

# Performance events
signal fps_changed(fps: float)
signal memory_usage_changed(usage_mb: float)
signal network_latency_changed(latency_ms: float)

# Configuration events
signal configs_reloaded()
signal config_validation_failed(config_name: String, error: String)

func _ready():
	print("EventBus: Initialized global event system")

# Utility functions for common event patterns
func emit_player_event(event_name: String, player_id: int, data = null):
	"""Emit a player-specific event with consistent formatting"""
	match event_name:
		"spawned":
			emit_signal("player_spawned", player_id, data)
		"died":
			emit_signal("player_died", player_id, data)
		"respawned":
			emit_signal("player_respawned", player_id)
		_:
			push_warning("EventBus: Unknown player event: " + event_name)

func emit_combat_event(event_name: String, attacker_id: int, data = null):
	"""Emit a combat-specific event with consistent formatting"""
	match event_name:
		"attack":
			emit_signal("attack_performed", attacker_id, data.type, data.position)
		"hit":
			emit_signal("hit_registered", attacker_id, data.victim_id, data.damage, data.type)
		"critical":
			emit_signal("critical_hit", attacker_id, data.victim_id, data.damage)
		_:
			push_warning("EventBus: Unknown combat event: " + event_name)

func emit_building_event(event_name: String, player_id: int, data = null):
	"""Emit a building-specific event with consistent formatting"""
	match event_name:
		"placed":
			emit_signal("building_piece_placed", player_id, data.type, data.position)
		"destroyed":
			emit_signal("building_piece_destroyed", player_id, data.type, data.position)
		"edited":
			emit_signal("building_piece_edited", player_id, data.type, data.position, data.edit_type)
		_:
			push_warning("EventBus: Unknown building event: " + event_name)

func emit_notification(message: String, type: String = "info"):
	"""Emit a notification with consistent formatting"""
	emit_signal("notification_shown", message, type)
	print("Notification [%s]: %s" % [type.to_upper(), message])

# Debug helper to log all signal connections
func debug_print_connections():
	if not OS.is_debug_build():
		return
	
	print("EventBus: Active signal connections:")
	for signal_name in get_signal_list():
		var connections = get_signal_connection_list(signal_name.name)
		if connections.size() > 0:
			print("  %s: %d connections" % [signal_name.name, connections.size()])
			for connection in connections:
				print("    -> %s.%s" % [connection.target.name, connection.method])