extends Line2D

export var length := 10 # adjust how smooth the line is, might have to update divisor
export var divisor := 12.0 # Adjust how much of the line is seen

var velocity := Vector2.ZERO
var gravity := Vector2.DOWN

func _process(_delta):
	points = _calc_trajectory()

func _calc_trajectory():
	var points = []
	var initial_velocity = velocity.rotated(global_rotation)
	var accel = gravity
	var initial_pos = global_position

	for x in range(0, length):
		var time = x / divisor
		
		# no idea why, but multiply by 30 makes the trajectory perfect
		var diff = (initial_velocity * time + 30 * accel * pow(time, 2.0))
		var point = to_local(initial_pos + diff)
		points.append(point)
	
	return points
