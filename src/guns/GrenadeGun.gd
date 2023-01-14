extends Pistol

export var force := 300
export var bullet_gravity := 10

onready var trajectory := $Line2D

func _ready():
	trajectory.velocity = Vector2.LEFT * force
	trajectory.gravity = Vector2.DOWN * bullet_gravity

func _fire_velocity():
	return 

func _gravity():
	return Vector2.DOWN * bullet_gravity

func fire(actor: Player):
	var bullet = .fire(actor)
	if bullet:
		bullet.velocity = trajectory.velocity.rotated(global_rotation)
		bullet.gravity = trajectory.gravity
