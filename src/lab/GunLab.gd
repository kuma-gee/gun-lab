extends Node2D

onready var room := $Room
onready var enter_collision := $GameEnterCollision/CollisionShape2D
onready var game_enter := $GameEnter

func _ready():
	enter_collision.disabled = true

func _on_LabSettings_start():
	room.set_cellv(Vector2(5, -1), -1)


func _on_GameEnter_body_entered(_body):
	room.set_cellv(Vector2(9, -1), 1, false, false, false, Vector2(1, 2))
	enter_collision.set_deferred("disabled", false)
	game_enter.set_deferred("monitoring", false)
