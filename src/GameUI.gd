extends CanvasLayer

onready var ammo_label := $MarginContainer/MarginContainer/HBoxContainer/Ammo
onready var weapon_container := $MarginContainer/MarginContainer/HBoxContainer/Weapons

const weapon_ui := preload("res://src/menu/Weapon.tscn")

func _ready():
	Events.connect("player_ammo_change", self, "update_ammo")
	Events.connect("player_weapon_change", self, "changed_weapon")

func changed_weapon(weapon: Pistol, weapon_slot: int):
	for child in weapon_container.get_children():
		child.unfocus()
	
	var active_weapon = weapon_container.get_child(weapon_slot)
	active_weapon.texture = weapon.sprite.texture
	active_weapon.focus()
	
	update_ammo(weapon.ammo, weapon.max_ammo)

func update_ammo(ammo: int, max_ammo: int):
	ammo_label.text = "%s / %s" % [ammo, max_ammo]
