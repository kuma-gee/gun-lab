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


func _on_PlayerInput_just_pressed(action):
	if action == "interact":
		hand.interact()
	if action == "fire":
		weapons.get_active_weapon().fire(self)
	elif action == "reload":
		weapons.get_active_weapon().reload()
	elif action == "weapon_1":
		weapons.active_weapon_idx = 0
	elif action == "weapon_2":
		weapons.active_weapon_idx = 1
	elif action == "weapon_3":
		weapons.active_weapon_idx = 2
	elif action == "move_down":
		var last_collision = get_last_slide_collision()
		if last_collision:
			print("last_collision", last_collision.collider)
			var collider = last_collision.collider
			if collider is OneWayCollision:
				collider.add_exception(self)
		
func pickup_weapon(weapon: PackedScene):
	weapons.add_weapon(weapon)

func knockback(force: Vector2):
	velocity += force
