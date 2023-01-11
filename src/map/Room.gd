extends TileMap

var door_tiles = [Vector2(8, 4), Vector2(9, 4)]

func open_right():
	for tile in door_tiles:
		set_cellv(tile, -1)
