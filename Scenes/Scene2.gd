extends Node
onready var enemy2=get_node("Enemy2")
onready var enemy3=get_node("Enemy3")
onready var enemy4=get_node("Enemy4")
onready var enemy5=get_node("Enemy5")
onready var enemy6=get_node("Enemy6")


onready var flamefruite1=get_node("Flamefruite")
onready var flamefruite2=get_node("Flamefruite2")
onready var flamefruite3=get_node("Flamefruite3")
onready var flamefruite4=get_node("Flamefruite4")
onready var flamefruite5=get_node("Flamefruite5")
onready var flamefruite6=get_node("Flamefruite6")
onready var flamefruite7=get_node("Flamefruite7")
onready var flamefruite8=get_node("Flamefruite8")
onready var flamefruite9=get_node("Flamefruite9")
onready var flamefruite10=get_node("Flamefruite10")



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.prevScene=Global.current_scene
	#print_tree()
	Global.enemy2path=enemy2
	Global.enemy3path=enemy3
	Global.enemy4path=enemy4
	Global.enemy5path=enemy5
	Global.enemy6path=enemy6
	
	Global.flamefruit1path=flamefruite1
	Global.flamefruit2path=flamefruite2
	Global.flamefruit3path=flamefruite3
	Global.flamefruit4path=flamefruite4
	Global.flamefruit5path=flamefruite5
	Global.flamefruit6path=flamefruite6
	Global.flamefruit7path=flamefruite7
	Global.flamefruit8path=flamefruite8
	Global.flamefruit7path=flamefruite9
	Global.flamefruit8path=flamefruite10

	

	if Global.flamefruit1==false:
		flamefruite1.queue_free()
	if Global.flamefruit2==false:
		flamefruite2.queue_free()
	if Global.flamefruit3==false:
		flamefruite3.queue_free()
	if Global.flamefruit4==false:
		flamefruite4.queue_free()
	if Global.flamefruit5==false:
		flamefruite5.queue_free()
	if Global.flamefruit6==false:
		flamefruite6.queue_free()
	if Global.flamefruit7==false:
		flamefruite7.queue_free()
	if Global.flamefruit8==false:
		flamefruite8.queue_free()
	if Global.flamefruit9==false:
		flamefruite9.queue_free()
	if Global.flamefruit10==false:
		flamefruite10.queue_free()
	
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
