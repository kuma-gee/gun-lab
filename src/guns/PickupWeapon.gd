extends KinematicBody2D

export var drop_force := 100
export var deaccel := 200
export var gravity := 50

export var weapon_scene: PackedScene
onready var audio := $AudioStreamPlayer

var velocity := Vector2.ZERO

func create_item(node: Node2D):
	var scene = PackedScene.new()
	scene.pack(node)
	weapon_scene = scene
	
	var start_angle = deg2rad(45)
	var end_angle = deg2rad(-45)
	velocity = Vector2.UP.rotated(rand_range(start_angle, end_angle)).normalized() * drop_force
	global_position = node.global_position

func _physics_process(delta):
	velocity.x = move_toward(velocity.x, 0, delta * deaccel)
	velocity += Vector2.DOWN * gravity
	velocity = move_and_slide(velocity)

func _on_Interactable_interacted(actor):
	hide()
	
	actor.pickup_weapon(weapon_scene)
	audio.play()

func _on_AudioStreamPlayer_finished():
	queue_free()
