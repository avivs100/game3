class_name Player extends CharacterBody2D

signal laser_shot(laser_scene, location)
signal killed

@export var speed = 300
@export var rate_of_fire := 0.25
@onready var muzzle = $Muzzle

var muzzle_rotation_degrees = 0

var laser_scene = preload("res://scenes/laser.tscn")

var shoot_cd := false

func _process(_delta):
	if Input.is_action_pressed("shoot"):
		if !shoot_cd:
			shoot_cd = true
			shoot()
			await get_tree().create_timer(rate_of_fire).timeout
			shoot_cd = false
	
func _physics_process(_delta):
	var direction = Vector2(Input.get_axis("move_left", "move_right"), 0)
	if Input.is_action_pressed('ui_left'):
		muzzle_rotation_degrees += -1
	if Input.is_action_pressed('ui_right'):
		muzzle_rotation_degrees += 1
	velocity = direction * speed
	move_and_slide()
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	Global.PxP = global_position
	
func shoot():
	#$ProgressBar.value -= 10 
	laser_shot.emit(laser_scene, muzzle.global_position, muzzle_rotation_degrees)

func die():
	killed.emit()
	queue_free()
