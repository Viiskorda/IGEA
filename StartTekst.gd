extends Area2D

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _on_StartTekst_body_entered(_body):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			$Tekst.text = "SPACE to jump\nA to move left\nD to move right\n"


func _on_StartTekst_body_exited(_body):
	$Tekst.text = ""
