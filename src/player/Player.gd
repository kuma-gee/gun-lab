class_name Player extends KinematicBody2D

export var accel = 800
export var speed = 200
export var jump_force = 400

onready var input := $PlayerInput
onready var body := $Body
onready var arm := $Body/ArmRoot
onready var anim := $AnimationPlayer

onready var pistol := $Body/ArmRoot/Pistol

onready var gravity = ProjectSettings.get("physics/2d/default_gravity_vector") * ProjectSettings.get("physics/2d/default_gravity")

var velocity = Vector2.ZERO
var camera_point = null

func _get_motion():
	return Vector2(input.get_action_strength("move_right") - input.get_action_strength("move_left"), 0);

func _physics_process(_delta):
	velocity.x = _get_motion().x * speed
	if input.is_pressed("jump") and is_on_floor():
		velocity += Vector2.UP * jump_force
	
	velocity += gravity
	velocity = move_and_slide(velocity, Vector2.UP)

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
