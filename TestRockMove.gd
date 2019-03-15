extends Area2D

onready var rock = get_node("..")

var rockMove = 0

func _physics_process(delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			rockMove = 0
			rock.position.y += 1
		elif rockMove == 1:
			rock.position.y -= 0.5

func _on_TestRockMove_area_entered(area):
	rockMove = 0

func _on_TestRockMove_body_exited(body):
	rockMove = 1