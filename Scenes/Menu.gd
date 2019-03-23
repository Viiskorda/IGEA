extends Node

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	
	
	
func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered()==true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered()==true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()
		
	

func _on_TextureButton_pressed():
	get_tree().change_scene("Scenes/Scene.tscn")
	

func _on_TextureButton2_pressed():
	get_tree().quit()









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



