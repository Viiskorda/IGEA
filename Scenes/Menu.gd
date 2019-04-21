extends Node

export(String, FILE, "*.tscn") var change_level
export(String) var target_spawn_group

func _ready():
	$VBoxContainer2/TextureButton.grab_focus()
	
	
	
func _physics_process(_delta):
	if Input.is_action_pressed('ui_cancel'):
		get_tree().paused = false
		print("cancel")
	
	
	if $VBoxContainer2/TextureButton.is_hovered()==true:
		$VBoxContainer2/TextureButton.grab_focus()
	if $VBoxContainer2/TextureButton2.is_hovered()==true:
		$VBoxContainer2/TextureButton2.grab_focus()
		
	

func _on_TextureButton_pressed():
	Global.goto_scene(change_level,target_spawn_group)
	#get_tree().change_scene("Scenes/Scene.tscn")
	#Global.goto_scene(change_level,target_spawn_group)
	

func _on_TextureButton2_pressed():
	get_tree().quit()

func _on_TextureButton3_pressed():
	get_tree().change_scene(Global.prevScene.name)








#extends CanvasLayer
#
#signal start_game
#
#func show_message(text):
#	$MessageLabel.text=text
#	$MessageLabel.show()
#	$MessageTimer.start()
#
#func game_over():
#	show_message("Game Over")
#	yield($MessageTimer, "timeout")
#	$StartButton.show()
#	$MessageLabel.text="Chara The Manana"
#	$MessageLabel.show()
#
#func update_score(mana):
#	$Mana.text=str(mana)
#
#func _on_MessageTimer_timeout():
#	$MessageLabel.hide()
#
#
#func _on_StartButton_pressed():
#	$StartButton.hide()
#	emit_signal("start_game")



