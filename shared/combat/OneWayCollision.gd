class_name OneWayCollision extends StaticBody2D

export var duration := 1.0

onready var collision := $CollisionShape2D

const exceptions = []

func add_exception(collider: PhysicsBody2D):
	collider.add_collision_exception_with(self)
	
	var timer = Timer.new()
	timer.connect("timeout", self, "_remove_collision_exception", [collider, timer])
	add_child(timer)
	timer.start(duration)

func _remove_collision_exception(collider: PhysicsBody2D, timer):
	collider.remove_collision_exception_with(self)
	remove_child(timer)
