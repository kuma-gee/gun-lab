extends KinematicBody2D

export var dir := Vector2.LEFT
export var speed := 2000

var stop = false

func _process(_delta):
	if stop: return
	
	var d = dir.rotated(rotation)
	move_and_slide(d * speed)
	
	var last_collision = get_last_slide_collision()
	if last_collision:
		stop = true
		global_position = last_collision.position

func _on_HitBox_hit():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
