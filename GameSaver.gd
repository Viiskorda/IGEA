#extends Node2D
#
#func save_game():
#    var save_game = File.new()
#    save_game.open("user://savegame.save", File.WRITE)
#    var save_nodes = get_tree().get_nodes_in_group("Persist")
#    for i in save_nodes:
#        var node_data = i.call("save");
#        save_game.store_line(to_json(node_data))
#    save_game.close()