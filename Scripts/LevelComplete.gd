#LevelComplete.gd

extends Area2D

export(String, FILE, "*.tscn") var change_level
export(String) var target_spawn_group

const SAVE_PATH = "res://save.json"


func load_game():
	pass

func _physics_process(_delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			#get_tree().change_scene(change_level)
			Global.goto_scene(change_level,target_spawn_group)
#			save_game()

#func save_game():
#
#	var save_dict = {}
#	var nodes_to_save = get_tree().get_nodes_in_group('Persist')
#	for node in nodes_to_save:
#		save_dict[node.get_path()] = node.save()
#
#	var save_file = File.new()
#	save_file.open(SAVE_PATH, File.WRITE)
#
#	save_file.store_line(to_json(save_dict))
#
#	save_file.close()
#	pass








