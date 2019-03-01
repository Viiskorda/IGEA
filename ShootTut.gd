extends Area2D


func _on_ShootTut_body_entered(body):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			$Tekst.text = "ENTER to shoot"


func _on_ShootTut_body_exited(body):
	$Tekst.text = ""
