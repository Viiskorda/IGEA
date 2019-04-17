extends Node
onready var enemy2=get_node("Enemy2")
onready var enemy3=get_node("Enemy3")
onready var enemy4=get_node("Enemy4")
onready var enemy5=get_node("Enemy5")
onready var enemy6=get_node("Enemy6")



# Called when the node enters the scene tree for the first time.
func _ready():
	#print_tree()
	Global.enemy2path=enemy2
	Global.enemy3path=enemy3
	Global.enemy4path=enemy4
	Global.enemy5path=enemy5
	Global.enemy6path=enemy6
	
	
	if Global.enemy2isalive==false:
		enemy2.queue_free()
	if Global.enemy3isalive==false:
		enemy3.queue_free()
	if Global.enemy4isalive==false:
		enemy4.queue_free()
	if Global.enemy5isalive==false:
		enemy5.queue_free()
	if Global.enemy6isalive==false:
		enemy6.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	pass
