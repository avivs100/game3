class_name DiverEnemy extends Area2D

signal killed(points)
signal hit

@export var points = 100
@onready var sprite = $Sprite2D/Node2D;
@onready var collision = $CollisionShape2D
@export var hp = 1
@export var speed = 1200
@export var damage = 1
@export var Hy = 0.0
@export var rotation_angle = 0
var yLoc = global_position.y



func setHy(value):
	Hy = value
	
func setSpeed(value):
	speed = value
	
func setYloc(value):
	yLoc = value

func die():
	queue_free()
	
func take_damage(amount):
	hp -= amount
	if hp <= 0:
		killed.emit(points)
		die()
	else:
		hit.emit()

func _physics_process(delta):
	if global_position.x >= Global.PxP.x:
		global_position.x += -speed
	if global_position.x < Global.PxP.x:
		global_position.y += speed
	

func _on_body_entered(body):
	if body is Player:
		body.die()
		die()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area is Enemy:
		area.take_damage(damage)
		queue_free()
