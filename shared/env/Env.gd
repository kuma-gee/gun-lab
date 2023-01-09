extends Node

const DEV_VERSION = "DEV"

enum Level {
	ERROR,
	INFO,
	WARN,
	DEBUG,
	TRACE,
}

const DEBUG_SCENE = preload("res://shared/env/Debug.tscn")

var version = DEV_VERSION setget _set_version
var log_level = Level.DEBUG

func _set_version(v: String) -> void:
	if v == "": return
	version = v

func _unhandled_input(event):
	if event.is_action_pressed("dev"):
		if get_child_count() == 0:
			add_child(DEBUG_SCENE.instance())
		else:
			remove_child(get_child(0))

func is_prod() -> bool:
	return version != DEV_VERSION

func is_web() -> bool:
	return OS.get_name() == "HTML5"

