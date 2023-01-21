extends CanvasLayer

func _ready():
	Events.connect("player_died", self, "_on_player_died")

func _on_player_died():
	visible = true

func _unhandled_input(event):
	if visible and event.is_action("ui_cancel"):
		get_tree().set_input_as_handled()


func _on_Retry_pressed():
	SceneManager.reload_scene()


func _on_Back_pressed():
	SceneManager.change_scene("res://src/Start.tscn")
