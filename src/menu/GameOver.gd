extends CanvasLayer

func _unhandled_input(event):
	if event.is_action("ui_cancel"):
		get_tree().set_input_as_handled()


func _on_Retry_pressed():
	SceneManager.reload_scene()


func _on_Back_pressed():
	SceneManager.change_scene("res://src/Start.tscn")
