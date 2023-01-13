extends Pistol

export var force := 300
export var bullet_gravity := 10
export var trajectory_length := 10

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
	var initial_velocity = _fire_velocity().rotated(deg2rad(-90))
	var accel = _gravity()
	var initial_pos = global_position

	for x in range(0, trajectory_length):
		var time = x
		var point = initial_pos + (initial_velocity * time + 0.5 * accel * pow(time, 2))
		points.append(to_local(point))
	
	line2d.points = points
