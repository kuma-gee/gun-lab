class_name ParentRoom extends TileMap

onready var room := $Room

func remove_tile(coor: Vector2):
	room.set_cellv(coor, -1)
