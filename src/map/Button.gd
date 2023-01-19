extends Node2D

export var door_coor := Vector2.ZERO
export var occluder_path: NodePath
onready var occluder := get_node(occluder_path) if occluder_path else get_child(0)

onready var sprite := $Sprite

func _on_HurtBox_hit():
	owner.remove_tile(door_coor)
	occluder.hide()
	sprite.frame = 1
