extends Button

signal select_weapon(weapon)

export var weapon: PackedScene


func _on_WeaponItem_pressed():
	emit_signal("select_weapon", weapon)
