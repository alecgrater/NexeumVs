extends Node

# Scene transition manager for smooth scene changes
# Handles loading screens, fade transitions, and scene management

signal transition_started(from_scene: String, to_scene: String)
signal transition_finished(scene_name: String)

var current_scene: Node = null
var is_transitioning: bool = false

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	print("SceneTransition: Initialized with scene: ", current_scene.name)

func goto_scene(path: String, transition_type: String = "fade"):
	"""Change to a new scene with optional transition effect"""
	if is_transitioning:
		print("SceneTransition: Already transitioning, ignoring request")
		return
	
	print("SceneTransition: Transitioning to scene: ", path)
	is_transitioning = true
	
	var from_scene = current_scene.name if current_scene else "unknown"
	emit_signal("transition_started", from_scene, path)
	
	match transition_type:
		"fade":
			await fade_transition(path)
		"instant":
			await instant_transition(path)
		_:
			await fade_transition(path)
	
	is_transitioning = false
	emit_signal("transition_finished", current_scene.name if current_scene else "unknown")

func fade_transition(path: String):
	"""Fade out, change scene, fade in"""
	# TODO: Implement fade effect
	await get_tree().create_timer(0.5).timeout
	call_deferred("_deferred_goto_scene", path)
	await get_tree().create_timer(0.5).timeout

func instant_transition(path: String):
	"""Immediate scene change"""
	call_deferred("_deferred_goto_scene", path)
	await get_tree().process_frame

func _deferred_goto_scene(path: String):
	"""Actually change the scene"""
	if current_scene:
		current_scene.free()
	
	var new_scene = ResourceLoader.load(path)
	if not new_scene:
		push_error("SceneTransition: Failed to load scene: " + path)
		return
	
	current_scene = new_scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func reload_current_scene():
	"""Reload the current scene"""
	if current_scene and current_scene.scene_file_path:
		goto_scene(current_scene.scene_file_path)

func get_current_scene_name() -> String:
	"""Get the name of the current scene"""
	return current_scene.name if current_scene else ""