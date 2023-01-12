class_name Player extends KinematicBody2D

export var speed = 200

onready var input := $PlayerInput
onready var body := $Body
onready var arm := $Body/ArmRoot
onready var anim := $AnimationPlayer

onready var pistol := $Body/ArmRoot/Pistol

var gravity = Vector2.DOWN * 300
var velocity = Vector2.ZERO
var camera_point = null

func _get_motion():
	return Vector2(input.get_action_strength("move_right") - input.get_action_strength("move_left"), 0);

func _physics_process(_delta):
	velocity = _get_motion() * speed
	velocity += gravity
	velocity = move_and_slide(velocity)

	if velocity.length() > 0:
		anim.play("Run")
	else:
		anim.play("Idle")

	var aim = _get_aim_dir()
	var dot = aim.dot(Vector2.LEFT)
	var flip = sign(dot)
	body.scale.x = flip

	var face_dir = Vector2.LEFT * flip
	var angle = rad2deg(face_dir.angle_to(aim))
	arm.rotation_degrees = angle * flip

func _get_aim_dir():
	return global_position.direction_to(get_global_mouse_position()).normalized()



func _on_PlayerInput_just_pressed(action):
	if action == "fire":
		pistol.fire()
