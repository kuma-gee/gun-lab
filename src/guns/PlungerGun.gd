extends Pistol

export var force := 500
export var bullet_gravity := 8

onready var line2d := $Line2D

func _ready():
	line2d.velocity = Vector2.LEFT * force
	line2d.gravity = Vector2.DOWN * bullet_gravity

func fire(actor: Player):
	var bullet = .fire(actor)
	if bullet:
		bullet.velocity = line2d.velocity.rotated(global_rotation)
		bullet.gravity = line2d.gravity
