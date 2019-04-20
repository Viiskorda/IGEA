extends Node

var current_scene = null
var spawn_group_name=null
var health=10
var mana=3
var collidingWithChara=false
var charaPosition;
var bossHealth=10
var double_jump=false
var generateHealt=false
var firstConversationWithChara=0


var enemy1isalive=true
var enemy2isalive=true

var enemy3isalive=true
var enemy4isalive=true
var enemy5isalive=true
var enemy6isalive=true
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

var flamefruit0path
var flamefruit1path
var flamefruit2path
var flamefruit3path
var flamefruit4path
var flamefruit5path
var flamefruit6path
var flamefruit7path
var flamefruit8path



const SAVE_PATH = "res://save.json"

func _ready():
    var root = get_tree().get_root()
    current_scene = root.get_child(root.get_child_count() - 1)

func _physics_process(_delta):
#	print(current_scene.name)
	pass

func _finished_loading_scene():
	print(health)
	print(mana)
	if spawn_group_name:
		var player = get_tree().get_nodes_in_group("player").front()
		var spawn_target=get_tree().get_nodes_in_group(spawn_group_name).front()
		print(spawn_target.position)
		#print(player.position)
		player.position=spawn_target.position
	save_game()



func goto_scene(path, spawn_group_name):
	self.spawn_group_name=spawn_group_name
	#get_tree().change_scene(path)
	
    # This function will usually be called from a signal callback,
    # or some other function in the current scene.
    # Deleting the current scene at this point is
    # a bad idea, because it may still be executing code.
    # This will result in a crash or unexpected behavior.

    # The solution is to defer the load to a later time, when
    # we can be sure that no code from the current scene is running:
	
	
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






