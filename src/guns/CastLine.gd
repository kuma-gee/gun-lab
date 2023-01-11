extends Line2D

onready var ray_cast = get_parent()

func _process(_delta):
	points = [to_local(ray_cast.global_position), to_local(ray_cast.get_collision_point())]
