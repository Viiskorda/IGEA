extends Area2D


func _on_ShootTut_body_entered(_body):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			$Tekst.text = "SPACE to jump"


func _on_ShootTut_body_exited(_body):
	$Tekst.text = ""
