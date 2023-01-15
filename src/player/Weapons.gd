extends Node2D

export var max_weapons = 3

const PICKUP_SCENE = preload("res://src/guns/PickupWeapon.tscn")

var active_weapon_idx = 0 setget _set_active_weapon_idx

func _ready():
	GameManager.ui.update_weapon_ui(get_active_weapon())
	GameManager.ui.update_weapon_slots(get_children(), active_weapon_idx)

func _set_active_weapon_idx(id: int):
	if not get_active_weapon(id): return
	
	if get_active_weapon():
		get_active_weapon().hide()

	active_weapon_idx = id
	GameManager.ui.update_weapon_slots(get_children(), active_weapon_idx)
	
	var active = get_active_weapon()
	if active:
		active.show()
		GameManager.ui.update_weapon_ui(active)


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
		add_child_below_node(curr, node)
		
		var pickup = PICKUP_SCENE.instance()
		get_tree().current_scene.add_child(pickup)
		pickup.create_item(curr)
		
		remove_child(curr)
		self.active_weapon_idx = active_weapon_idx
		
		
