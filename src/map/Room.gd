class_name ParentRoom extends Node2D

onready var room := $Room
onready var bgm := $BGM

onready var end_timer := $EndTimer

const end_tile_start = Vector2(75, -7)
const end_tile_end = Vector2(78, -7)

func remove_tile(coor: Vector2):
	room.set_cellv(coor, -1)


func _on_BGM_finished():
	if not bgm.playing:
		bgm.play()


func _on_EndMessage_message_opened():
	end_timer.start()


func _on_EndTimer_timeout():
	for x in range(end_tile_start.x, end_tile_end.x + 1):
		remove_tile(Vector2(x, end_tile_start.y))
