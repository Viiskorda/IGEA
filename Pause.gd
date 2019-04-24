extends Control

var menuItem=0

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
	if $VBoxContainer2/TextureButton4.is_hovered()==true:
		$VBoxContainer2/TextureButton4.grab_focus()
		if menuItem != 4:
			audioMenu()
			menuItem = 4


func _input(event):	
	if event.is_action_pressed('ui_cancel'):
		$VBoxContainer2/TextureButton2.grab_focus()
		get_tree().paused = not get_tree().paused
		visible= not visible



func _on_TextureButton_pressed():
	get_tree().paused = not get_tree().paused
	visible= not visible
	Global.goto_scene(change_level,target_spawn_group)
	#get_tree().change_scene("Scenes/Scene.tscn")
	#Global.goto_scene(change_level,target_spawn_group)
	

func _on_TextureButton2_pressed():
	get_tree().paused = not get_tree().paused
	visible= not visible

func _on_TextureButton3_pressed():
	#get_tree().change_scene(Global.prevScene.name)
	get_tree().quit()

func audioMenu():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/mana.wav")
	audioPlayer.set_volume_db(Global.soundFXvolume-10)
	audioPlayer.play()
	print("play mana.wav")
	print(audioPlayer.stream)
	var t = Timer.new()
	t.set_wait_time(0.300)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")








