extends KinematicBody2D

onready var explosion_anim := $AnimatedSprite
onready var bullet := $Sprite
onready var explosion_sound := $Explosion

var velocity := Vector2.ZERO
var started_explosion = false

func _physics_process(_delta):
#	if stop_moving: return
	
	velocity += Vector2.DOWN * 10
	velocity = move_and_slide(velocity, Vector2.UP)
	
	var last_collision = get_last_slide_collision()
	if last_collision and not started_explosion:
		bullet.hide()
		explosion_anim.show()
		explosion_anim.playing = true
		
		explosion_sound.play()
		rotation_degrees = deg2rad(last_collision.normal.angle())
		started_explosion = true

func _on_Explosion_finished():
	queue_free()
