extends ProgressBar
var maxValue: float = 100
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():	
	value = 100
	max_value = maxValue # Replace with function body.
	
func canShot():
	return value>=10
	
func set_full():
	value = maxValue

func dec():
	value -=10;
	if(value <= 0):
		timer.start()
		await timer.timeout
		value = 50
	

func inc():
	value +=10;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
