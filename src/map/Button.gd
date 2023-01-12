extends Node2D

signal hit()

func _on_HurtBox_hit():
	print("hit")
	emit_signal("hit")
