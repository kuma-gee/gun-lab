extends Node2D

export var max_weapons = 3

var active_weapon_idx = 0 setget _set_active_weapon_idx

func _set_active_weapon_idx(id: int):
	if not get_active_weapon(id): return
	
	if get_active_weapon():
		get_active_weapon().hide()

	active_weapon_idx = id
	
	if get_active_weapon():
		get_active_weapon().show()

func get_active_weapon(id = active_weapon_idx):
	if id == null or id >= get_child_count(): return null
	return get_child(id)

func add_weapon(weapon: PackedScene):
	if not weapon: return
	
	var node = weapon.instance()
	
	if get_child_count() < max_weapons:
		add_child(node)
		self.active_weapon_idx = get_child_count() - 1
	else:
		var curr = get_active_weapon()
		add_child_below_node(node, curr)
		remove_child(curr)
		
		
