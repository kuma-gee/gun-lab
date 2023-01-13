extends Node2D

export var door_coor := Vector2.ZERO

onready var sprite := $Sprite

func _on_HurtBox_hit():
	print("hit")
	owner.remove_tile(door_coor)
	sprite.frame = 1
