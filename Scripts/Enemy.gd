extends KinematicBody2D

const FLOOR = Vector2(0, -1)

var motion = Vector2()

var direction = 1
var color=.7
var is_dead = false

export(int) var hp = 1
export(int) var grav = 30
export(int) var speed = 150

func _ready():
	if Global.enemy1isalive==false:
		queue_free()
	
func dead():
	hp -= 1
	$AnimatedSprite.modulate.a=0
	fadeAway(color)
	color-=.2
	
	if hp <= 0:
		is_dead = true
		motion = Vector2(0, 0)
		$EnemyCol.call_deferred('free')
		$AnimatedSprite.play("dead")
		audioDeath()
		$Modulate.start()
		Global.enemy1isalive=false
		$Timer.start()

func _physics_process(_delta):
	if is_dead == false:
		#$Label.text = str(hp)
		motion.x = speed * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
			
		$AnimatedSprite.play("walk")
		
		motion.y += grav
		
		motion = move_and_slide(motion, FLOOR)
		
		if position.x >= 1800:
			direction = direction * -1
			$RayCast2D.position.x *= -1
		
		if position.x <= 1300:
			direction = direction * -1
			$RayCast2D.position.x *= -1
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Chara" in get_slide_collision(i).collider.name:
					Global.collidingWithChara=true
		
		
#		if get_slide_count() > 0:
#			for i in range (get_slide_count()):
#				if "Chara" in get_slide_collision(i).collider.name && is_dead==true:
#					print(is_dead)
#					get_slide_collision(i).collider.dead()
		


func fadeAway(color):

	var t = Timer.new()
	t.set_wait_time(0.05)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	$AnimatedSprite.modulate.a=1
	$AnimatedSprite.modulate = Color(color, color, color)

func audioDeath():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/spiderdeath.wav")
	audioPlayer.set_volume_db(Global.soundFXvolume)
	audioPlayer.play()
	#print("play spiderdeath.wav")
	#print(audioPlayer.stream)
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")

func _on_Timer_timeout():
	
	queue_free()


func _on_Modulate_timeout():
	$AnimatedSprite.modulate.a-=.1
