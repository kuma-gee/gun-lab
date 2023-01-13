extends Pistol

export var force := 300
export var bullet_gravity := 10
export var trajectory_length := 5.0

onready var line2d := $Line2D

func _fire_velocity():
	return Vector2.LEFT.rotated(global_rotation) * force

func _gravity():
	return Vector2.DOWN * bullet_gravity

func fire(actor: Player):
	var bullet = .fire(actor)
	if bullet:
		bullet.velocity = _fire_velocity()
		bullet.gravity = _gravity()

func _process(_delta):
	_calc_trajectory()

func _calc_trajectory():
	var points = []
	var time = 0.0
	var step = 0.5
	while time <= trajectory_length:
		var initial_velocity = _fire_velocity()
		var accel = _gravity()

		points.append((initial_velocity * time + 0.5 * accel * pow(time, 2)))
		time += step
	
	line2d.points = points
