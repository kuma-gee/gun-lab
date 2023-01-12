extends Node2D

export var dir := Vector2.LEFT
export var speed := 100

func _process(_delta):
	var d = dir.rotated(rotation)
	position += d * speed


func _on_HitBox_hit():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
