extends Area2D

var onFlamefruit = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(_delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			#get_tree().change_scene(change_level)
			if onFlamefruit == false:
				onFlamefruit = true
				audioMana()
				Global.mana+=3
				var t = Timer.new()
				t.set_wait_time(0.50)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				onFlamefruit = false
				queue_free()
			
		
			
	
			#onFlamefruit = false



func audioMana():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/mana.wav")
	audioPlayer.play()
	print("play mana.wav")
	print(audioPlayer.stream)
	
	
	
	