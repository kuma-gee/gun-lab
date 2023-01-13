extends Pistol

export var force := 300
export var bullet_gravity := 10

onready var line2d := $Line2D

func fire(actor: Player):
	var bullet = .fire(actor)
	if bullet:
		bullet.velocity = Vector2.LEFT.rotated(global_rotation) * force
		bullet.gravity = bullet_gravity

func _process(delta):
	pass
