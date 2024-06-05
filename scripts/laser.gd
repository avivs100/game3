extends Area2D

@export var speed = 600
@export var damage = 1
@export var rotation_angle = 0

func _physics_process(delta):

	global_position.y += -speed * delta# * cos(rotation_degrees * PI / 180)
	global_position.x += -speed * delta# * sin(rotation_degrees * PI / 180)
	rotation_degrees = rotation_angle

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	#if area is DiverEnemy:
		#area.take_damage(damage)
		#queue_free()
		
	if area is Enemy:
		area.take_damage(damage)
		queue_free()
