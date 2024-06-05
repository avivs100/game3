extends Control


func _on_restart_button_pressed():
	get_tree().reload_current_scene()

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_hack_timer_timeout():
	pass

func start():
	visible = true
	$Timer.start()

func _on_timer_timeout():
	visible = false
