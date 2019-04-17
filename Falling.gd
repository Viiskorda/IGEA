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
			#get_tree().change_scene(change_level)
#			Global.goto_scene(change_level,target_spawn_group)
			load_game()

#func load_game():
#	var save_game = File.new()
#	if not save_game.file_exists("res://savegame.save"):
#	    return # Error! We don't have a save to load.
#
#	# We need to revert the game state so we're not cloning objects
#	# during loading. This will vary wildly depending on the needs of a
#	# project, so take care with this step.
#	# For our example, we will accomplish this by deleting saveable objects.
#	var save_nodes = get_tree().get_nodes_in_group("Persist")
#	for i in save_nodes:
#	    i.queue_free()
#
#	# Load the file line by line and process that dictionary to restore
#	# the object it represents.
#	save_game.open("res://savegame.save", File.READ)
#	while not save_game.eof_reached():
#		var current_line = parse_json(save_game.get_line())
#		# Firstly, we need to create the object and add it to the tree and set its position.
#		var new_object = load(current_line["filename"]).instance()
#		print(current_line["parent"])
#		print(current_line["parent"])
#		print(current_line["parent"])
#		get_node(current_line["parent"]).add_child(new_object)
#		new_object.position = Vector2(current_line["pos_x"], current_line["pos_y"])
#		# Now we set the remaining variables.
#		for i in current_line.keys():
#			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
#			    continue
#			new_object.set(i, current_line[i])
#	save_game.close()


func load_game():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return
	save_file.open(SAVE_PATH, File.READ)
	var data = {}
	data = parse_json(save_file.get_as_text())

#	for node_path in data.keys():
#		var node = get_node(node_path)
#		print(node)
#		print(node)
#		print(node)
#		print(node)
#
#		for attribute in data[node_path]:
#			if attribute == "pos":
#				node.set_pos(Vector2(data[node_path]['pos']['x'], data[node_path]['pos']['y']))
#			else:
#				node.set(Global.health, 6)
#				node.set(Global.mana, 5)
	for node_path in data.keys():
		#print(data.keys())
		var node = get_node(node_path)
		
		for attribute in data[node_path]:
			print(data[node_path]['Global.health'])
			if attribute == "pos":
				node.set_position(Vector2(data[node_path]['pos']['x'], data[node_path]['pos']['y']))
			else:
				Global.health = data[node_path]['Global.health']
				Global.mana = data[node_path]['Global.mana']
		Global.goto_scene(change_level,target_spawn_group)
		# We get the node's path from the for loop, so we can use it to retrieve
		# Both the node to load (e.g. Player, Player2) and the node's data with data[node_path]
#		var node_data = data[node_path]
#		# We find the right node to load node_data into and call its load method
#		get_node(node_path).load_state(node_data)


