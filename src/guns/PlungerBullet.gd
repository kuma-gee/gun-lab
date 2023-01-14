extends KinematicBody2D

onready var horizontal := $HorizontalCollision/CollisionShape2D
onready var vertical := $VerticalCollision/CollisionShape2D
onready var sprite := $Sprite
onready var timer := $DespawnTimer
onready var anim := $AnimationPlayer

var velocity := Vector2.ZERO
var gravity = Vector2.DOWN
var stop = false

func _ready():
	horizontal.disabled = true
	vertical.disabled = true

func _physics_process(_delta):
	if stop: return
	
	velocity += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	var last_collision = get_last_slide_collision()
	if last_collision:
		stop = true
		global_position = last_collision.position
		global_rotation = last_collision.normal.angle()
		
		var dot = last_collision.normal.dot(Vector2.LEFT)
		var is_vertical = dot == 0
		var flip = dot > 0
		
		if not is_vertical and flip:
			sprite.scale.y = -1
			horizontal.scale.y = -1
		
		horizontal.disabled = is_vertical
		vertical.disabled = not is_vertical
		timer.start()


func _on_DespawnTimer_timeout():
	anim.play("Despawn")
