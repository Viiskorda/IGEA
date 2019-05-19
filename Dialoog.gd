extends CanvasLayer

var diaVisible = false

#func _physics_process(delta):
#	$Sprite.visible = diaVisible

func _on_Back_to_village_tutorial_body_entered(body):
#	diaVisible = true
	$Sprite.visible = true

func _on_Back_to_village_tutorial_body_exited(body):
#	diaVisible = false
	$Sprite.visible = false


func _on_StartTekst_body_entered(body):
	pass # Replace with function body.


func _on_StartTekst_body_exited(body):
	pass # Replace with function body.
