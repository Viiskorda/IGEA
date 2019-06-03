extends Node

func _ready():
	$VBoxContainer/TextureButton.grab_focus()
	Global.audioBackround()
	Global.audioPlayerBackround.stream = load("res://Sounds/back/Märt Nigu - Visualiseerimine - 4. Visualiseerimine IV_01.ogg")
	Global.audioPlayerBackround.set_volume_db(Global.soundvolume)
	Global.audioPlayerBackround.play()
	#print("play: Märt Nigu - Visualiseerimine - 4. Visualiseerimine IV_01.ogg")
	var root = get_tree().get_root()
	Global.current_scene = root.get_child(root.get_child_count() - 1)

	
func _physics_process(_delta):
	if Input.is_action_pressed('ui_cancel'):
		get_tree().paused = false
		#print("cancel")
	
	
	if $VBoxContainer/TextureButton.is_hovered()==true:
		$VBoxContainer/TextureButton.grab_focus()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")