extends Node2D
var manascore
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func new_game():
	manascore=0
	print("new game")
	$Menu.show_message("Get Ready")
	$Menu.update_score(manascore)
	
func game_over():
	$Menu.game_over()