extends KinematicBody2D

export var rotation_speed := 0.1

onready var explosion_anim := $AnimatedSprite
onready var bullet := $Sprite
onready var explosion_sound := $Explosion

var velocity := Vector2.ZERO
var started_explosion = false
var stop = false
var gravity = Vector2.DOWN

func _ready():
	explosion_anim.hide()
	explosion_anim.frame = 0

func _physics_process(_delta):
	if stop: return
	
	rotation += rotation_speed 
	
	velocity += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	var last_collision = get_last_slide_collision()
	if last_collision and not started_explosion:
		stop = true
		global_position = last_collision.position

		bullet.hide()
		explosion_anim.show()
		explosion_anim.playing = true
		
		explosion_sound.play()
		var deg = rad2deg(Vector2.UP.angle_to(last_collision.normal))
		rotation_degrees = deg
		
		started_explosion = true

func _on_Explosion_finished():
	queue_free()
