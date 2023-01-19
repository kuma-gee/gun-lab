extends Node2D

export var floor_coor := Vector2.ZERO
export var damage_threshold = 5

onready var occluder := $LightOccluder2D

func _on_HurtBox_damaged(dmg):
	if dmg >= damage_threshold:
		owner.remove_tile(floor_coor)
		occluder.hide()
