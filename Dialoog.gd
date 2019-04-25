extends CanvasLayer

var diaVisible = false

func _physics_process(delta):
	$Sprite.visible = diaVisible

func _on_Back_to_village_tutorial_body_entered(body):
	diaVisible = true

func _on_Back_to_village_tutorial_body_exited(body):
	diaVisible = false
