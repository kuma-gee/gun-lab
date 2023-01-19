extends Menu

export var game_scene: PackedScene

onready var start := $Start
onready var options := $Options

func _ready():
	change_menu(start)

func _on_New_pressed():
	SceneManager.change_scene(game_scene)
	

func _on_Options_pressed():
	change_menu(options)


func _on_Exit_pressed():
	get_tree().quit()
