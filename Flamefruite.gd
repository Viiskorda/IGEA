extends Area2D

var onFlamefruit = false

var isEaten=false
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
	if isEaten==false:
		var bodies= get_overlapping_bodies()
		for body in bodies:
		
			if body.name=="Chara":
				#get_tree().change_scene(change_level)
				if onFlamefruit == false && Global.mana<12:
					onFlamefruit = true
					audioMana()
					Global.mana+=3
					if Global.mana>12:
						Global.mana=12
					#Flamefruite.hide()
					isEaten=true
					for child in get_children():
						child.queue_free()
					var t = Timer.new()
					t.set_wait_time(0.50)
					t.set_one_shot(true)
					self.add_child(t)
					t.start()
					yield(t, "timeout")
					onFlamefruit = false
					if Global.flamefruit0path==self:
						Global.flamefruit0=false
					if Global.flamefruit1path==self:
						Global.flamefruit1=false
					if Global.flamefruit2path==self:
						Global.flamefruit2=false
					if Global.flamefruit3path==self:
						Global.flamefruit3=false
					if Global.flamefruit4path==self:
						Global.flamefruit4=false
					if Global.flamefruit5path==self:
						Global.flamefruit5=false
					if Global.flamefruit6path==self:
						Global.flamefruit6=false
					if Global.flamefruit7path==self:
						Global.flamefruit7=false
					if Global.flamefruit8path==self:
						Global.flamefruit8=false
										
					queue_free()
				
			
				
		
				#onFlamefruit = false



func audioMana():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/mana.wav")
	audioPlayer.play()
	print("play mana.wav")
	print(audioPlayer.stream)
	
	
	
	