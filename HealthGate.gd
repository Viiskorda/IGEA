extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara" && Input.is_action_pressed('ui_up') && Global.health<10:
			
			Global.generateHealt=true
			Global.health+=1
			$Timer.start()
			
		
func _on_Timer_timeout():
	#Global.health+=1
	pass