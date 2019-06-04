extends Node

onready var scene_1=preload("res://Scenes/Scene2.tscn")
onready var scene_2=preload("res://Scenes/Scene.tscn")

var current_scene = null
var spawn_group_name=null
var health=10
var mana=3
var collidingWithChara=false
var charaPosition;
var bossHealth=10
var BossIsFreed=false
var double_jump=false
var generateHealt=false
var firstConversationWithChara=0
var prevScene
var mainDialogue = 1
var questDone = 0
var CharaGotTheCrystal=false

var Gate1onFire=false
var Gate2onFire=false

var enemy1isalive=true

var enemy2isalive=true
var enemy3isalive=true
var enemy4isalive=true
var enemy5isalive=true
var enemy6isalive=true

var enemy1path
var enemy2path
var enemy3path
var enemy4path
var enemy5path
var enemy6path

var flamefruit0=true
var flamefruit1=true
var flamefruit2=true
var flamefruit3=true
var flamefruit4=true
var flamefruit5=true
var flamefruit6=true
var flamefruit7=true
var flamefruit8=true
var flamefruit9=true
var flamefruit10=true

var flamefruit0path
var flamefruit1path
var flamefruit2path
var flamefruit3path
var flamefruit4path
var flamefruit5path
var flamefruit6path
var flamefruit7path
var flamefruit8path
var flamefruit9path
var flamefruit10path

var popup = [0, 0, 0, 0, 0, 0, 0]
var CharaStop=false
var ElderTalk = true

#var movementText = 0
#var flamefruitText = 0
#var backToVillageText = 0
#var jumpText = 0
#var shootText = 0
#var gateText = 0
#var doublejumpText = 0

var currentPopup

var soundvolume=-20
var soundFXvolume=-30

var audioPlayerBackround = AudioStreamPlayer.new()
var lastScene

const SAVE_PATH = "res://save.json"

func _ready():
    var root = get_tree().get_root()
    current_scene = root.get_child(root.get_child_count() - 1)
	
	

func _physics_process(_delta):

	#print(prevScene.name)
	pass

func _finished_loading_scene():
	
	if spawn_group_name:
		var player = get_tree().get_nodes_in_group("player").front()
		var spawn_target=get_tree().get_nodes_in_group(spawn_group_name).front()
		#print(spawn_target.position)
		#print(player.position)
		player.position=spawn_target.position
	save_game()



func goto_scene(path, spawn_group_name):
	self.spawn_group_name=spawn_group_name
	#get_tree().change_scene(path)
	lastScene=path
    # This function will usually be called from a signal callback,
    # or some other function in the current scene.
    # Deleting the current scene at this point is
    # a bad idea, because it may still be executing code.
    # This will result in a crash or unexpected behavior.

    # The solution is to defer the load to a later time, when
    # we can be sure that no code from the current scene is running:
	
	audioBackround()
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()
	
	# Load the new scene.
	var s = ResourceLoader.load(path)
	
	# Instance the new scene.
	current_scene = s.instance()
	
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	
	
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)
	
	_finished_loading_scene()

func audioBackround():
	
	self.add_child(audioPlayerBackround)
	# audioPlayerBackround.stream = load("res://Sounds/back/Märt Nigu - Avatud - 4. Avatud IV.ogg")
	audioPlayerBackround.set_volume_db(Global.soundvolume)
	print("backround audio setings")

func save_game():
	
	var save_dict = {}
	var nodes_to_save = get_tree().get_nodes_in_group('Persist')
	for node in nodes_to_save:
		save_dict[node.get_path()] = node.save()
	
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	
	save_file.store_line(to_json(save_dict))
	
	save_file.close()
	pass




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
				health = data[node_path]['Global.health']
				mana = data[node_path]['Global.mana']
				bossHealth = data[node_path]['Global.bossHealth']
				double_jump = data[node_path]['Global.double_jump']
				
				enemy1isalive = data[node_path]['Global.enemy1isalive']
				enemy2isalive = data[node_path]['Global.enemy2isalive']
				enemy3isalive = data[node_path]['Global.enemy3isalive']
				enemy4isalive = data[node_path]['Global.enemy4isalive']
				enemy5isalive = data[node_path]['Global.enemy5isalive']
				enemy6isalive = data[node_path]['Global.enemy6isalive']
				
				flamefruit0 = data[node_path]['Global.flamefruit0']
				flamefruit1 = data[node_path]['Global.flamefruit1']
				flamefruit2 = data[node_path]['Global.flamefruit2']
				flamefruit3 = data[node_path]['Global.flamefruit3']
				flamefruit4 = data[node_path]['Global.flamefruit4']
				flamefruit5 = data[node_path]['Global.flamefruit5']
				flamefruit6 = data[node_path]['Global.flamefruit6']
				flamefruit7 = data[node_path]['Global.flamefruit7']
				flamefruit8 = data[node_path]['Global.flamefruit8']
				flamefruit9 = data[node_path]['Global.flamefruit9']
				flamefruit10 = data[node_path]['Global.flamefruit10']
				
				mainDialogue = data[node_path]['Global.mainDialogue']
				questDone = data[node_path]['Global.questDone']
				
		goto_scene(lastScene,"player")






