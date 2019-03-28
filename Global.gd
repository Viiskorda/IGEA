extends Node

var current_scene = null
var spawn_group_name=null
var health=10
var mana=3



func _ready():
    var root = get_tree().get_root()
    current_scene = root.get_child(root.get_child_count() - 1)


func _finished_loading_scene():
	print(health)
	print(mana)
	if spawn_group_name:
		var player = get_tree().get_nodes_in_group("player").front()
		var spawn_target=get_tree().get_nodes_in_group(spawn_group_name).front()
		print(spawn_target.position)
		#print(player.position)
		player.position=spawn_target.position



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










