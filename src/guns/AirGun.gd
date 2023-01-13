extends Pistol

export var knockback_force := 400

func fire(actor: Player):
	if .fire(actor):
		var dir = -Vector2.LEFT.rotated(global_rotation) * knockback_force
		actor.knockback(dir)
