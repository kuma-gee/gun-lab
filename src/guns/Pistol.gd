extends Node2D

export var bullet_scene: PackedScene

onready var bullet_pos := $Position2D

func fire():
	var bullet = bullet_scene.instance()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = bullet_pos.global_position
	bullet.global_rotation = bullet_pos.global_rotation
