extends Control

signal missions

var menuItem=0
var audioPlayerBackroundPause = AudioStreamPlayer.new()

export(String, FILE, "*.tscn") var change_level
export(String) var target_spawn_group

func _ready():
	$VBoxContainer2/TextureButton2.grab_focus()
	menuItem = 2
	
	
	
func _physics_process(_delta):
	
	if $VBoxContainer2/TextureButton.is_hovered()==true:
		$VBoxContainer2/TextureButton.grab_focus()
		if menuItem != 1:
			audioMenu()
			menuItem = 1
	if $VBoxContainer2/TextureButton2.is_hovered()==true:
		$VBoxContainer2/TextureButton2.grab_focus()
		if menuItem != 2:
			audioMenu()
			menuItem = 2
	if $VBoxContainer2/TextureButton3.is_hovered()==true:
		$VBoxContainer2/TextureButton3.grab_focus()
		if menuItem != 3:
			audioMenu()
			menuItem = 3


func _input(event):
	if event.is_action_pressed('ui_cancel'):
		$VBoxContainer2/TextureButton2.grab_focus()
		get_tree().paused = not get_tree().paused
		#print(visible)
		if visible == false:
			audioBackround()
			#print("pausi musa play")
		else:
			self.remove_child(audioPlayerBackroundPause)
				
		visible= not visible
		
	if event.is_action_pressed('ui_shoot') and Global.CharaStop==true:	
		visible= not visible



func _on_TextureButton_pressed():
	get_tree().paused = not get_tree().paused
	visible= not visible
	#get_tree().reload_current_scene()
	#get_tree().change_scene(change_level)
	self.remove_child(audioPlayerBackroundPause)

	Global.CharaStop=false
	Global.health=10
	Global.mana=3
	Global.collidingWithChara=false
	Global.charaPosition;
	Global.bossHealth=10
	Global.double_jump=false
	Global.generateHealt=false
	Global.firstConversationWithChara=0
	
	
	Global.enemy1isalive=true
	Global.enemy2isalive=true
	
	Global.enemy3isalive=true
	Global.enemy4isalive=true
	Global.enemy5isalive=true
	Global.enemy6isalive=true
	Global.enemy2path
	Global.enemy3path
	Global.enemy4path
	Global.enemy5path
	Global.enemy6path
	
	
	Global.flamefruit0=true
	Global.flamefruit1=true
	Global.flamefruit2=true
	Global.flamefruit3=true
	Global.flamefruit4=true
	Global.flamefruit5=true
	Global.flamefruit6=true
	Global.flamefruit7=true
	Global.flamefruit8=true
	Global.flamefruit9=true
	Global.flamefruit10=true
	
	Global.flamefruit0path
	Global.flamefruit1path
	Global.flamefruit2path
	Global.flamefruit3path
	Global.flamefruit4path
	Global.flamefruit5path
	Global.flamefruit6path
	Global.flamefruit7path
	Global.flamefruit8path
	Global.flamefruit9path
	Global.flamefruit10path
	
	Global.soundvolume=-10
	Global.soundFXvolume=-30
	
	Global.popup = [0, 0, 0, 0, 0, 0, 0]
	Global.CharaStop=false
	Global.ElderTalk = true
	Global.DiaEnd = false
	Global.EnemiesKilled = 0
	Global.MissionsVisible = false
	Global.mission1 = false
	Global.mission2 = false
	Global.mission3 = false
	Global.mission4 = false
	Global.modulate1 = 0.2
	Global.modulate2 = 0.2
	Global.modulate3 = 0.2
	Global.m1Tekst = "0/1"
	Global.m2Tekst = "0/1"
	Global.m3Tekst = "0/1"
	Global.BossDead = false
	Global.mainDialogue = 1
	Global.questDone = 0

	emit_signal("missions")

	Global.goto_scene(change_level,target_spawn_group)
	#get_tree().change_scene("Scenes/Scene.tscn")
	#Global.goto_scene(change_level,target_spawn_group)
	

func _on_TextureButton2_pressed():
	self.remove_child(audioPlayerBackroundPause)
	get_tree().paused = not get_tree().paused
	visible= not visible
	

func _on_TextureButton3_pressed():
	#get_tree().change_scene(Global.prevScene.name)
	self.remove_child(audioPlayerBackroundPause)
	get_tree().quit()

func audioMenu():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/menu.wav")
	audioPlayer.set_volume_db(Global.soundFXvolume-10)
	audioPlayer.play()
	#print("play mana.wav")
	#print(audioPlayer.stream)
	var t = Timer.new()
	t.set_wait_time(0.300)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
func audioBackround():
	
	self.add_child(audioPlayerBackroundPause)
	audioPlayerBackroundPause.stream = load("res://Sounds/back/Märt Nigu - Visualiseerimine - 4. Visualiseerimine IV_01.ogg")
	audioPlayerBackroundPause.set_volume_db(Global.soundvolume)
	audioPlayerBackroundPause.play()
	#print("play: Märt Nigu - Visualiseerimine - 4. Visualiseerimine IV_01.ogg")
	
