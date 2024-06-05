class_name DiverEnemy extends Area2D

signal killed(points)
signal hit

@export var speed = 5.0
@export var hp = 1
@export var points = 100
@export var GRAVITY = 2
@export var SHOOT_FORCE = 1
@export var FRICTION = 0.004
@export var Hy = 0.0
var motion = Vector2.ZERO
var yLoc = global_position.y

#func _physics_process(delta):
	#global_position.y += -speed * delta * GRAVITY
	#global_position.x += -speed * delta 
	
func setSpeed(value):
	speed = value
	
func setYloc(value):
	yLoc = value

func die():
	queue_free()

func _on_body_entered(body):
	if body is Player:
		body.die()
		die()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func take_damage(amount):
	hp -= amount
	if hp <= 0:
		killed.emit(points)
		die()
	else:
		hit.emit()
		

func setHy(value):
	Hy = value
	
func _physics_process(delta):
	global_position.x += -speed
	#if yLoc > Hy:
		#global_position.y = lerp(global_position.y, 0.0,speed/300)
		#yLoc = global_position.y
	#else:
		#global_position.y = lerp(global_position.y, 0.0,-speed/300)

	# Move the rocket
	#global_position.x += SHOOT_FORCE * delta
	#global_position = move_and_slide(motion, Vector2.UP)	
