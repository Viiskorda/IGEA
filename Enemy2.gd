extends KinematicBody2D
const FLOOR = Vector2(0, -1)
var motion = Vector2()
var direction = 1
var directiony = 1
var temp=1
var is_dead = false
const SHOOT = preload("res://BossShoot.tscn")
var beginningposition
var color=1
export(int) var grav = 0
export(int) var speed = 150

func _ready():
	if Global.enemy2isalive==false:
		queue_free()
	else:

		$AnimatedSprite.modulate.a=0
		var attackRandomly= attackRandomly()
		#print(attackRandomly)
		beginningposition=position

	
	
func attackRandomly():
	return randi() % 3 
	
func dead():
	Global.bossHealth -= 1
	
	$AnimatedSprite.modulate.a=0
	fadeAway(color)
	#color-=.1
	
	#print(Global.bossHealth)
	if Global.bossHealth <= 0:
		
		is_dead = true
		Global.firstConversationWithChara=2
		motion = Vector2(0, 0)
		
		$EnemyCol.call_deferred('free')
		$AnimatedSprite.play("dead")
		audioBossDeath()
		#audioBack()
		$Modulate.start()
		$Timer.start()
		Global.mainDialogue = 2
		Global.questDone = 0


func attack():
	direction=0
	temp=position.y
	#print(temp)
	if Global.bossHealth<3:
		$AnimatedSprite.play("attack4")
	elif Global.bossHealth<5:
		$AnimatedSprite.play("attack3")
		
	elif Global.bossHealth<7:
		$AnimatedSprite.play("attack2")
	elif Global.bossHealth<9:
		$AnimatedSprite.play("attack1")
	else:
		$AnimatedSprite.play("attack")

	
	if position.y<Global.charaPosition.y -100:
		
		position.y+=10
	elif position.y>650:
		position.y-=1
	else:
		position.y-=1

	$Attack.start()
	

func spit():
	#print("ptüi")
	var shoot = SHOOT.instance()
	get_parent().add_child(shoot)
	shoot.position = $Position2D.global_position


func _physics_process(_delta):
	
	if is_dead == false and Global.BossIsFreed==true:
		$AnimatedSprite.modulate.a=1
		motion.x = speed * -direction
		motion.y = speed * -directiony
		#print(position)
		
#		if direction == 1:
#			$AnimatedSprite.flip_h = false
#		else:
#			$AnimatedSprite.flip_h = true
			
		if position.y>750:
			#print("liiga all!!!")
			directiony = abs(directiony) * -1
			$RayCast2D.position.y *= -10	
		
		#attack(attackRandomly())
		#motion.y += grav
		
#		if attackRandomly()==0:
#			print(11111)
		#attack(attackRandomly())

		motion = move_and_slide(motion, FLOOR)
		
		if position.x >= Global.charaPosition.x+150:
			
			direction = abs(direction) * 1
			
			$RayCast2D.position.x *= 1


		if $RayCast2D.is_colliding() == false && position.x <= Global.charaPosition.x-150:
			
			direction = abs(direction) * -1
			
			$RayCast2D.position.x *= -1

		#Kui Chara on liiga üleval, siis koletis liigub üles
		

	
		if Global.charaPosition.x>2300 && Global.charaPosition.x<3700 && Global.charaPosition.y<850:
			
			
			if position.y >= Global.charaPosition.y-100:


				directiony = abs(directiony) * 1
				$RayCast2D.position.y *= 1


			if $RayCast2D.is_colliding() == false && position.y <= Global.charaPosition.y-500:
			
				directiony = abs(directiony) * -1
				$RayCast2D.position.y *= -1	
			
			if position.x <= Global.charaPosition.x+2 && position.x >= Global.charaPosition.x-1:
				# print("kohal")
				attack()
		
			elif position.x <= Global.charaPosition.x+300 && position.x >= Global.charaPosition.x-300:
				var attackRandomly= randi() % 50
				if attackRandomly==10:
					spit()
			elif Global.bossHealth<3:
				$AnimatedSprite.play("walk4")
			elif Global.bossHealth<5:
				$AnimatedSprite.play("walk3")
				
			elif Global.bossHealth<7:
				$AnimatedSprite.play("walk2")
			elif Global.bossHealth<9:
				$AnimatedSprite.play("walk1")
			else:
				$AnimatedSprite.play("walk")
				
			
			
		
		elif Global.charaPosition.y>1500:
			position=beginningposition
			
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Chara" in get_slide_collision(i).collider.name:
					Global.collidingWithChara=true

func fadeAway(color):

	var t = Timer.new()
	t.set_wait_time(0.05)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	$AnimatedSprite.modulate.a=1
	$AnimatedSprite.modulate = Color(color, color, color)

func audioBossDeath():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/bossdeath.wav")
	audioPlayer.set_volume_db(Global.soundFXvolume)
	audioPlayer.play()
	#print("play bossdeah.wav")
	#print(audioPlayer.stream)
	var t = Timer.new()
	t.set_wait_time(0.400)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	audioBack()
	
func audioBack():
	Global.audioPlayerBackround.stream = load("res://Sounds/back/Märt Nigu - Avatud - 4. Avatud IV.ogg")
	Global.audioPlayerBackround.play()
	#print ("play: Märt Nigu - Avatud - 4. Avatud IV.ogg")


func _on_Timer_timeout():
	Global.enemy2isalive=false
	queue_free()

func _on_Attack_timeout():
	direction=1
	
func _on_Modulate_timeout():
	$AnimatedSprite.modulate.a-=.1
	Global.double_jump=true