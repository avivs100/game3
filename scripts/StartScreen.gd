extends Node
@onready var timer = $StartScreen/StTimer


func die():	
	queue_free()
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	await timer.timeout
	die()


# Called every frame. 'delta' is the elapsed time since the previous frame.

	
	
