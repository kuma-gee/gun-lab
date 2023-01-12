extends Node2D

export var max_ammo = 10
export var bullet_scene: PackedScene

onready var bullet_pos := $Position2D
onready var fire_rate_timer := $FireRate

onready var ammo = max_ammo

var can_fire = true

func reload():
	ammo = max_ammo

func fire():
	if not can_fire: return
	
	if ammo <= 0: return
	
	ammo -= 1
	
	var bullet = bullet_scene.instance()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = bullet_pos.global_position
	bullet.global_rotation = bullet_pos.global_rotation
	can_fire = false
	fire_rate_timer.start()

func _on_FireRate_timeout():
	can_fire = true
