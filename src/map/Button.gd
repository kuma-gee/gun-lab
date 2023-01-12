extends Node2D

signal hit()

func _on_HurtBox_hit():
	emit_signal("hit")
