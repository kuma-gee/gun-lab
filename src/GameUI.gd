extends CanvasLayer

onready var ammo := $MarginContainer/MarginContainer/HBoxContainer/Ammo
onready var weapon_container := $MarginContainer/MarginContainer/HBoxContainer/Weapons

const weapon_ui := preload("res://src/menu/Weapon.tscn")

func update_weapon_slots(weapons: Array, active_idx: int):
	for i in range(0, weapon_container.get_child_count()):
		var child = weapon_container.get_child(i)
		if i == active_idx:
			child.focus()
		else:
			child.unfocus()
		if i < weapons.size():
			child.texture = weapons[i].sprite.texture

func update_weapon_ui(weapon: Pistol):
	ammo.text = "%s / %s" %[weapon.ammo, weapon.max_ammo]


