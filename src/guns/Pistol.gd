class_name Pistol extends Node2D

export var max_ammo = 10
export var bullet_scene: PackedScene

onready var bullet_pos := $Position2D
onready var fire_rate_timer := $FireRate
onready var shoot_sound := $Shoot
onready var out_of_ammo_sound := $OutOfAmmo
onready var reload_sound := $Reload

onready var ammo = max_ammo

var can_fire = true

func reload():
	if ammo == max_ammo:
		return
	
	reload_sound.play()
	ammo = max_ammo

func fire(_actor: Player):
	if not can_fire: return null
	
	can_fire = false
	fire_rate_timer.start()
	
	if ammo <= 0:
		out_of_ammo_sound.play()
		return
	
	ammo -= 1
	
	var bullet = bullet_scene.instance()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = bullet_pos.global_position
	bullet.global_rotation = bullet_pos.global_rotation
	shoot_sound.play()
	return bullet

func _on_FireRate_timeout():
	can_fire = true
