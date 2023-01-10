extends Camera2D

export var player_path: NodePath
onready var player: Player = get_node(player_path)

func _process(delta):
	if player.camera_point:
		global_position = player.camera_point.global_position
	else:
		global_position = player.global_position
