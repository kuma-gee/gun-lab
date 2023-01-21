extends Node2D

onready var control := $Control

var player: Player

func _ready():
	control.hide()

func _on_WeaponChest_interacted(actor):
	control.visible = !control.visible
	player = actor


func _on_WeaponChest_unhightlight():
	control.hide()


func _on_WeaponItem_select_weapon(weapon):
	if player:
		player.pickup_weapon(weapon)
