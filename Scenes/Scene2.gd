extends Node

signal gameEnd

var modulate=0
var modulate2=0
var crystal=false
var crystalInGate=false
var crystalmodulate=0

onready var enemy2=get_node("Enemies/Enemy2")
onready var enemy3=get_node("Enemies/Enemy3")
onready var enemy4=get_node("Enemies/Enemy4")
onready var enemy5=get_node("Enemies/Enemy5")
onready var enemy6=get_node("Enemies/Enemy6")


onready var flamefruite1=get_node("Flamefruits/Flamefruite")
onready var flamefruite2=get_node("Flamefruits/Flamefruite2")
onready var flamefruite3=get_node("Flamefruits/Flamefruite3")
onready var flamefruite4=get_node("Flamefruits/Flamefruite4")
onready var flamefruite5=get_node("Flamefruits/Flamefruite5")
onready var flamefruite6=get_node("Flamefruits/Flamefruite6")
onready var flamefruite7=get_node("Flamefruits/Flamefruite7")
onready var flamefruite8=get_node("Flamefruits/Flamefruite8")
onready var flamefruite9=get_node("Flamefruits/Flamefruite9")
onready var flamefruite10=get_node("Flamefruits/Flamefruite10")


var audioPlayerBackround = AudioStreamPlayer.new()

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
	Global.flamefruit9path=flamefruite9
	Global.flamefruit10path=flamefruite10
	
	#var audioPlayerBackround = AudioStreamPlayer.new()
	#self.add_child(audioPlayerBackround)
	Global.audioPlayerBackround.stream = load("res://Sounds/back/Märt Nigu - Avatud - 4. Avatud IV.ogg")
	Global.audioPlayerBackround.set_volume_db(Global.soundvolume)
	Global.audioPlayerBackround.play()
	#print("play: Märt Nigu - Avatud - 4. Avatud IV.oggs")
	
	$blackoutsidecave.modulate.a=0
	$HideCave.modulate.a=1
	$LevelComplete2/crystalbg2.modulate.a=0

	

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

	$Background/Modulate.start()
	$Background/Modulate2.start()
	

	$LevelComplete2/GateFire.modulate.a=0
	
	$Closecave/DoubleJump.modulate.a=0
  
	$Crystalmodulate.start()

func _process(delta):
	if $pilv/pilv5.position.x>4200:
		$pilv/pilv5.position.x=-300	
	if $pilv/pilv4.position.x>4200:
		$pilv/pilv4.position.x=-300
	if $pilv/pilv3.position.x>4200:
		$pilv/pilv3.position.x=-300
	if $pilv/pilv2.position.x>4200:
		$pilv/pilv2.position.x=-300
	if $pilv/pilv1.position.x>4200:
		$pilv/pilv1.position.x=-300
	
		
	if crystalmodulate==0:
		$Crystal/crystalbg.modulate.a-=.005

		
	elif crystalmodulate==1:
		$Crystal/crystalbg.modulate.a+=.005

	
	
	if Global.enemy6isalive==false and Global.enemy5isalive==false and Global.enemy4isalive==false and Global.enemy3isalive==false:

		$HideCave.modulate.a-=0.01
		Global.questDone = 2
	if Global.enemy2isalive==false:
		if $blackoutsidecave.modulate.a>0:
			$blackoutsidecave.modulate.a-=0.01
	
	if modulate==0:
		$Background/foxlight1.modulate.a-=.001
		$Background/foxlight1.position.x+=delta
		$Background/foxlight2.modulate.a-=.005
		$Background/foxlight2.position.x+=delta
	if modulate2==0:		
		$Background/foxlight3.modulate.a-=.01
		$Background/foxlight3.position.y+=delta
		$Background/foxlight4.modulate.a-=.008
		$Background/foxlight4.position.y+=delta		
		
		
		$LevelComplete/GateFire.modulate.a-=.007
		
		$pilv/pilv1.position.x+=delta*1
		$pilv/pilv2.position.x+=delta*2
		$pilv/pilv3.position.x+=delta*10
		$pilv/pilv4.position.x+=delta*5
		$pilv/pilv5.position.x+=delta*10
		$pilv/pilv1.rotate(deg2rad(delta/4))
		$pilv/pilv2.rotate(deg2rad(-delta/3))
		$pilv/pilv3.rotate(deg2rad(delta/2))
		$pilv/pilv4.rotate(deg2rad(-delta/4))
		$pilv/pilv5.rotate(deg2rad(delta/2))
		
	if modulate==1:
		$Background/foxlight1.modulate.a+=.001
		$Background/foxlight1.position.x-=delta
		$Background/foxlight2.modulate.a+=.005
		$Background/foxlight2.position.x-=delta
	if modulate2==1:
		$Background/foxlight3.modulate.a+=.01
		$Background/foxlight3.position.y-=delta
		$Background/foxlight4.modulate.a+=.008
		$Background/foxlight4.position.y-=delta


		$LevelComplete/GateFire.modulate.a+=.007
		
		
		
		
		
		$pilv/pilv1.position.x+=delta*1
		$pilv/pilv2.position.x+=delta*2
		$pilv/pilv3.position.x+=delta*10
		$pilv/pilv4.position.x+=delta*5
		$pilv/pilv5.position.x+=delta*10
		$pilv/pilv1.rotate(deg2rad(delta/4))
		$pilv/pilv2.rotate(deg2rad(-delta/3))
		$pilv/pilv3.rotate(deg2rad(delta/2))
		$pilv/pilv4.rotate(deg2rad(-delta/4))
		$pilv/pilv5.rotate(deg2rad(delta/2))
		
		
	if Global.charaPosition.x>1450 and Global.charaPosition.x<1600 and Global.charaPosition.y<1010:
		Global.CharaGotTheCrystal=true
		crystal=true
		emit_signal("gameEnd")
	if crystal==true:
		$Crystal.position=Global.charaPosition
	if crystalInGate==true:
		$LevelComplete2/crystalbg2.modulate.a=1
		$Crystal.modulate.a=0
		

		
	if Global.charaPosition.x>3700  and Global.charaPosition.y<1400 and crystal==true:
		crystalInGate=true
		Global.mission4 = true
		#print(Global.charaPosition.x)
		
	if Global.Gate1onFire==true:
		$LevelComplete/GateFire.modulate.a=1
		
	if Global.Gate2onFire==true:
		$LevelComplete/GateFire.modulate.a=1
	
	if Global.double_jump==true and $Closecave/DoubleJump.modulate.a<3:
		$Closecave/DoubleJump.modulate.a+=.01
	
func _on_Close_cave_body_entered(body):
	if Global.double_jump==false:
		$blackoutsidecave.modulate.a=1


func _on_Modulate_timeout():
	if modulate==1:
		modulate=0
	else:
		modulate=1


func _on_Modulate2_timeout():
	if modulate2==1:
		modulate2=0
	else:
		modulate2=1


func _on_Crystalmodulate_timeout():
	if crystalmodulate==1:
		crystalmodulate=0
	else:
		crystalmodulate=1
