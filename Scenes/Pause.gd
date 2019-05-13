extends Sprite
var togglePause=0
var timer=null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	timer=Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(.1)
	timer.connect("timeout", self, "pausing")
	add_child(timer)


func pausing():
	if togglePause==1:
		togglePause=0
	else:
		togglePause=1
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_pressed('ui_cancel')&&togglePause==0:
		get_tree().paused = true
		self.show()
		
		
		timer.start()
	elif Input.is_action_pressed('ui_cancel')&&togglePause==1:
		get_tree().paused = false
		self.hide()
		timer.start()
		

	
