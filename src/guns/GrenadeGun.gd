extends Pistol

export var force := 300
export var bullet_gravity := 10
export var trajectory_length := 10 # adjust how smooth the line is, might have to update time divisor

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
	var initial_velocity = _fire_velocity()
	var accel = _gravity()
	var initial_pos = global_position

	for x in range(0, trajectory_length):
		var time = x / 12.0 # Adjust how much of the line is seen
		
		# no idea why, but multiply by 30 makes the trajectory perfect
		var diff = (initial_velocity * time + 30 * accel * pow(time, 2.0))
		var point = to_local(initial_pos + diff)
		points.append(point)
	
	line2d.points = points
