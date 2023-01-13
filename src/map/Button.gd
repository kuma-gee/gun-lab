extends Node2D

signal hit()

onready var sprite := $Sprite

func _on_HurtBox_hit():
	emit_signal("hit")
	sprite.frame = 1
