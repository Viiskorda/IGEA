extends Node2D
var manascore

onready var enemy=get_node("Characters/Enemy")
onready var flamefruite0=get_node("Flamefruite")


# Called when the node enters the scene tree for the first time.
func _ready():
#	Global.prevScene=Global.current_scene
#	print(Global.prevScene.name)
	Global.enemy1path=enemy
	#print("test")
	#print(Global.enemy1path.name)
	Global.flamefruit0path=flamefruite0
	
	if Global.enemy1isalive==false:
		enemy.queue_free()
	
	if Global.flamefruit0==false:
		flamefruite0.queue_free()

	#print(Global.enemy1isalive)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	Global.audioPlayerBackround.stream = load("res://Sounds/back/Märt Nigu - Avatud - 3. Avatud III.ogg")
	Global.audioPlayerBackround.set_volume_db(Global.soundvolume)
	Global.audioPlayerBackround.play()
	#print("play: Märt Nigu - Avatud - 3. Avatud III.oggs")


func new_game():
	manascore=0
	#print("new game")
	$Menu.show_message("Get Ready")
	$Menu.update_score(manascore)
	
func game_over():
	$Menu.game_over()
	
func _physics_process(delta):
	pass