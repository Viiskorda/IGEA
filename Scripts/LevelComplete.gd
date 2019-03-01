#LevelComplete.gd

extends Area2D

export(String, FILE, "*.tscn") var change_level
const SAVE_PATH ={}

func save_game():
	pass


func load_game():
	pass

func _physics_process(delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			get_tree().change_scene(change_level)










