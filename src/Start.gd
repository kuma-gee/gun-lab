extends Menu

export var game_scene: PackedScene

onready var start := $Start
onready var options := $Options

func _ready():
	change_menu(start)

func _on_New_pressed():
	get_tree().change_scene_to(game_scene)
	

func _on_Options_pressed():
	change_menu(options)
