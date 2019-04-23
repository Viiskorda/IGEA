extends Control

export(String, FILE, "*.tscn") var change_level
export(String) var target_spawn_group

func _ready():
	$VBoxContainer2/TextureButton2.grab_focus()
	
	
	
func _physics_process(_delta):

	
	if $VBoxContainer2/TextureButton.is_hovered()==true:
		$VBoxContainer2/TextureButton.grab_focus()
	if $VBoxContainer2/TextureButton2.is_hovered()==true:
		$VBoxContainer2/TextureButton2.grab_focus()
	if $VBoxContainer2/TextureButton3.is_hovered()==true:
		$VBoxContainer2/TextureButton3.grab_focus()
		

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








