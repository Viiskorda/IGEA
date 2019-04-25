extends Area2D

var textCounter = 0


func _on_Flamefruit_Tutorial_body_entered(body):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			textCounter = 1
				
func _on_Flamefruit_Tutorial_body_exited(body):
	$Tekst.text = ""
	textCounter = 0
	
func _input(_event):
	if Input.is_action_pressed("ui_talk"):
		textCounter += 1
		
	if textCounter == 0:
		$Tekst.text = ""	
	elif textCounter == 1:
		$Tekst.text = "Press E"
	elif textCounter == 2:
		$Tekst.text = "This is a Flamefruit"
	elif textCounter == 3:
		$Tekst.text = "Use it to recharge your Mana Points"
	elif textCounter == 4:
		$Tekst.text = "There's only limited amount of Mana left\n in this world so..."
	elif textCounter == 5:
		$Tekst.text = "Use it wisely!"
	elif textCounter > 5:
		$Tekst.text = ""

#func _physics_process(delta):