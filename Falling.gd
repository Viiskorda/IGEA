#LevelComplete.gd

extends Area2D

export(String, FILE, "*.tscn") var change_level
export(String) var target_spawn_group

const SAVE_PATH = "res://save.json"

func save_game():
	pass

func _physics_process(_delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			load_game()

func load_game():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return
	save_file.open(SAVE_PATH, File.READ)
	var data = {}
	data = parse_json(save_file.get_as_text())
	for node_path in data.keys():
		var node = get_node(node_path)
		
		for attribute in data[node_path]:
			if attribute == "pos":
				node.set_position(Vector2(data[node_path]['pos']['x'], data[node_path]['pos']['y']))
			else:
				#node.set(attribute, data[node_path][attribute])
				Global.health = data[node_path]['Global.health']
				Global.mana = data[node_path]['Global.mana']
				Global.bossHealth = data[node_path]['Global.bossHealth']
				Global.double_jump = data[node_path]['Global.double_jump']
				
				Global.enemy1isalive = data[node_path]['Global.enemy1isalive']
				Global.enemy2isalive = data[node_path]['Global.enemy2isalive']
				Global.enemy3isalive = data[node_path]['Global.enemy3isalive']
				Global.enemy4isalive = data[node_path]['Global.enemy4isalive']
				Global.enemy5isalive = data[node_path]['Global.enemy5isalive']
				Global.enemy6isalive = data[node_path]['Global.enemy6isalive']
				
				Global.flamefruit0 = data[node_path]['Global.flamefruit0']
				Global.flamefruit1 = data[node_path]['Global.flamefruit1']
				Global.flamefruit2 = data[node_path]['Global.flamefruit2']
				Global.flamefruit3 = data[node_path]['Global.flamefruit3']
				Global.flamefruit4 = data[node_path]['Global.flamefruit4']
				Global.flamefruit5 = data[node_path]['Global.flamefruit5']
				Global.flamefruit6 = data[node_path]['Global.flamefruit6']
				Global.flamefruit7 = data[node_path]['Global.flamefruit7']
				Global.flamefruit8 = data[node_path]['Global.flamefruit8']
				Global.flamefruit9 = data[node_path]['Global.flamefruit9']
				Global.flamefruit10 = data[node_path]['Global.flamefruit10']
				
				Global.mainDialogue = data[node_path]['Global.mainDialogue']
				Global.questDone = data[node_path]['Global.questDone']
				Global.EnemiesKilled = data[node_path]['Global.EnemiesKilled']
				Global.mission1 = data[node_path]['Global.mission1']
				Global.mission2= data[node_path]['Global.mission2']
				Global.mission3 = data[node_path]['Global.mission3']
				Global.mission4 = data[node_path]['Global.mission4']
				Global.modulate1 = data[node_path]['Global.modulate1']
				Global.modulate2 = data[node_path]['Global.modulate2']
				Global.modulate3 = data[node_path]['Global.modulate3']
				Global.m1Tekst = data[node_path]['Global.m1Tekst']
				Global.m2Tekst = data[node_path]['Global.m2Tekst']
				Global.m3Tekst = data[node_path]['Global.m3Tekst']
				
		Global.goto_scene(change_level,target_spawn_group)


