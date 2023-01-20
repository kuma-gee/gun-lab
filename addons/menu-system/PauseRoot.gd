extends CanvasLayer

func _on_Control_menu_stack_change(length):
	visible = length > 0
	get_tree().paused = visible
