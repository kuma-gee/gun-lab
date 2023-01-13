class_name ParentRoom extends TileMap

onready var room := $Room
onready var bgm := $BGM

func remove_tile(coor: Vector2):
	room.set_cellv(coor, -1)


func _on_BGM_finished():
	if not bgm.playing:
		bgm.play()
