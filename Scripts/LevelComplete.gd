#LevelComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var change_level
export(String) var target_spawn_group


func load_game():
	pass

func _physics_process(_delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			#get_tree().change_scene(change_level)
			Global.goto_scene(change_level,target_spawn_group)









