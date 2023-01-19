extends Camera2D

export var player_path: NodePath
onready var player: Player = get_node(player_path)

var smooth_change_delta = 0

func _process(delta):
	if player.camera_point:
		global_position = player.camera_point.global_position
		smoothing_enabled = true
	elif smoothing_enabled:
		smooth_change_delta = delta
		
		if smooth_change_delta > 5:
			smoothing_enabled = false
