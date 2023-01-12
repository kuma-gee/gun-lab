extends Interactable

export var weapon_scene: PackedScene

func interact(actor: Player):
	actor.pickup_weapon(weapon_scene)
	queue_free()
