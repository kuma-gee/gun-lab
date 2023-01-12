extends Node2D

onready var gun_line := $GunLine

func fire():
	var collider = gun_line.get_collider()
	if collider is HurtBox:
		collider.damage(1)
