#extends CharacterBody2D
class_name Bird extends  CharacterBody2D #
signal killed(points)
signal hit

@export var hp = 8
@export var points = 100
@export var GRAVITY = 2
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var hack = null

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

func die():
	#queue_free()
	hack.start()
	global_position.x = -144
	

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
