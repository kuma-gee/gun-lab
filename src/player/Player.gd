class_name Player extends KinematicBody2D

export var accel = 1000
export var speed = 200
export var jump_force = 400

onready var input := $PlayerInput
onready var body := $Body
onready var arm := $Body/ArmRoot
onready var anim := $AnimationPlayer
onready var hand := $Hand

onready var weapons := $Body/ArmRoot/Weapons

onready var gravity = ProjectSettings.get("physics/2d/default_gravity_vector") * ProjectSettings.get("physics/2d/default_gravity")

var velocity = Vector2.ZERO
var camera_point = null
var died = false

func _get_motion():
	return Vector2(input.get_action_strength("move_right") - input.get_action_strength("move_left"), 0);

func _physics_process(delta):
	velocity.x = move_toward(velocity.x, _get_motion().x * speed, accel * delta)
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

func _get_index_for_keycode(code):
	match code:
		KEY_1: return 0
		KEY_2: return 1
		KEY_3: return 2
		KEY_4: return 3
		_: return null

func _on_PlayerInput_just_pressed(ev: InputEvent):
	if ev.is_action_pressed("interact"):
		hand.interact()
	elif ev.is_action_pressed("fire"):
		weapons.get_active_weapon().fire(self)
	elif ev.is_action_pressed("reload"):
		weapons.get_active_weapon().reload()
	elif ev.is_action_pressed("move_down"):
		var last_collision = get_last_slide_collision()
		if last_collision:
			var collider = last_collision.collider
			if collider is OneWayCollision:
				collider.add_exception(self)
	elif ev is InputEventKey:
		var idx = _get_index_for_keycode(ev.scancode)
		if idx != null:
			weapons.active_weapon_idx = idx
		
func pickup_weapon(weapon: PackedScene):
	weapons.add_weapon(weapon)

func knockback(force: Vector2):
	velocity += force


func _on_HurtBox_hit():
	died = true
	input.disable()
	hide()
