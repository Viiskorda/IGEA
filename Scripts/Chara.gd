extends KinematicBody2D

signal hp_changed
signal mp_changed

export(String, FILE, "*.tscn") var change_level
export(String) var target_spawn_group

const UP=Vector2(0,-1)
const SPEED=300
const GRAV=30
const JUMP=-800
const DAMAGE_DELAY = 0.5

const SHOOT = preload("res://Scenes/Shoot.tscn")
const SAVE_PATH = "res://save.json"

var motion=Vector2();
var Throw=preload("res://Throw.tscn")
var direction=0
var is_dead = false
var on_ground = false
var getDamage = 1
var lastStep = 2
var jump_count = 0
var max_jump_count = 2



func _ready():
	emit_signal("hp_changed", Global.health)
	emit_signal("mp_changed", Global.mana)
	add_to_group('Persist')

func _input(_event):
	if Input.is_action_pressed("ui_jump"):
		if jump_count == 1:
			jump_count = 2
		if jump_count < max_jump_count and Global.double_jump == true:
			motion.y = JUMP
			jump_count += 1
			audioJump()
			on_ground = false
			print(jump_count)
		elif on_ground == true:
			motion.y = JUMP
			audioJump()
			on_ground = false
# Throw.tscn 
#
func throw(x):
	var rock=Throw.instance()
	rock.position=position+Vector2(x,0)
	var imp=get_global_mouse_position()-position
	get_node('../../').add_child(rock)
	rock.apply_impulse(Vector2(),imp)

func _physics_process(_delta):
	
	Global.charaPosition=position
	emit_signal("mp_changed", Global.mana)
	if is_dead == false:
	
		motion.y+=GRAV
		$HP.text = str(Global.health)

#		if position.y >= 5000:
#			get_tree().reload_current_scene()
		if Global.generateHealt==true:
			emit_signal("hp_changed", Global.health)
			Global.generateHealt=false
						
		
		if Input.is_action_pressed('ui_right'):
			direction=0
			$LiikuvChara.flip_h=false
			
			motion.x =SPEED
			audioStep()
			$LiikuvChara.play("walk")
			
			
			
			if sign($Position2D.position.x) == -1:
				 $Position2D.position.x *= -1
			if Input.is_action_just_pressed('ui_throw'):
				throw(20)
	
		elif Input.is_action_pressed('ui_left'):
			if position.x < -100:
				motion.x = 0
			else:
				direction=1
				motion.x =-SPEED
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
				
			$LiikuvChara.flip_h=true
			audioStep()
			$LiikuvChara.play("walk")
			
			
			if Input.is_action_just_pressed('ui_throw'):
				throw(-70)
		elif Input.is_action_pressed('ui_down'):
			$LiikuvChara.play("kneel")
		else:
			$LiikuvChara.play("idle")
			motion.x=0
			
			if Input.is_action_just_pressed('ui_throw') && direction==0:
				throw(20)
	
			if Input.is_action_just_pressed('ui_throw') && direction==1:
				throw(-70)
			
		
		if is_on_floor():
			on_ground = true
			jump_count = 0
		else:
			on_ground = false
			if motion.y < 0:
				$LiikuvChara.play("jump")
			else:
				$LiikuvChara.play("fall")
			

		
		
		
#		if is_on_floor():
#			if Input.is_action_just_pressed('ui_jump'):
#				motion.y=JUMP
#
#		else:
#			$LiikuvChara.play("jump")
		
		
		
		if Input.is_action_just_pressed("ui_shoot"):
			if Global.mana>0:
				var shoot = SHOOT.instance()
				Global.mana -= 1
				audioShoot()
				
				if sign($Position2D.position.x) == 1:
					shoot.set_shoot_direction(1)
				else:
					shoot.set_shoot_direction(-1)
	
				get_parent().add_child(shoot)
				shoot.position = $Position2D.global_position
			
		
		motion=move_and_slide(motion, UP)
		
		# If enemy collides with Chara then Chara looses life
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name or Global.collidingWithChara==true:
					dead()

func audioStep():
	if on_ground == true:
		var audioPlayer = AudioStreamPlayer.new()
		self.add_child(audioPlayer)
		if lastStep == 2:
			lastStep = 0
			audioPlayer.stream = load("res://Sounds/step1.wav")
			print("step1.wav")
			audioPlayer.play()
			var t = Timer.new()
			t.set_wait_time(0.300)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			lastStep = 1
		elif lastStep == 1: 
			lastStep = 0
			audioPlayer.stream = load("res://Sounds/step2.wav")
			print("step2.wav")
			audioPlayer.play()
			var t = Timer.new()
			t.set_wait_time(0.323)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			lastStep = 2

func audioJump():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/mana.wav")
	audioPlayer.play()
	print("play mana.wav")
	print(audioPlayer.stream)
	var t = Timer.new()
	t.set_wait_time(0.500)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
func audioShoot():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/mana.wav")
	audioPlayer.play()
	print("play mana.wav")
	print(audioPlayer.stream)
	var t = Timer.new()
	t.set_wait_time(0.300)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
func audioDamage():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/mana.wav")
	audioPlayer.play()
	print("play mana.wav")
	print(audioPlayer.stream)
	var t = Timer.new()
	t.set_wait_time(0.300)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	
func dead():
	if getDamage == 1 :
		Global.health -= 1
		audioDamage()
		emit_signal("hp_changed", Global.health)
		Global.collidingWithChara=false
		$HP.text = str(Global.health)
		if Global.health <= 0:
			is_dead = true
			motion = Vector2(0, 0)
			$LiikuvChara.play("dead")
			$CollisionShape2D.disabled = true
			$Timer.start()
		else:
			wait()
	
	
func wait():
	getDamage = 0
	var t = Timer.new()
	t.set_wait_time(DAMAGE_DELAY)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	getDamage = 1
	
func _on_Timer_timeout():
	#get_tree().reload_current_scene()
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return
	save_file.open(SAVE_PATH, File.READ)
	var data = {}
	data = parse_json(save_file.get_as_text())
	for node_path in data.keys():
		var node = get_node(node_path)
		
		for attribute in data[node_path]:
			if attribute == "pos":
				node.set_position(Vector2(data[node_path]['pos']['x'], data[node_path]['pos']['y']))
			else:
				#node.set(attribute, data[node_path][attribute])
				Global.health = data[node_path]['Global.health']
				Global.mana = data[node_path]['Global.mana']
				Global.enemy1isalive = data[node_path]['Global.enemy1isalive']
				Global.enemy2isalive = data[node_path]['Global.enemy2isalive']
				Global.enemy3isalive = data[node_path]['Global.enemy3isalive']
				Global.enemy4isalive = data[node_path]['Global.enemy4isalive']
				Global.enemy5isalive = data[node_path]['Global.enemy5isalive']
				Global.enemy6isalive = data[node_path]['Global.enemy6isalive']

				
		Global.goto_scene(change_level,target_spawn_group)
	
func save():
	var save_dict={
		pos={
			x=position.x,
			y=position.y
		},
		"Global.health" : Global.health,
		"Global.mana" : Global.mana,
		"Global.enemy1isalive" : Global.enemy1isalive,
		"Global.enemy2isalive" : Global.enemy2isalive,
		"Global.enemy3isalive" : Global.enemy3isalive,
		"Global.enemy4isalive" : Global.enemy4isalive,
		"Global.enemy5isalive" : Global.enemy5isalive,
		"Global.enemy6isalive" : Global.enemy6isalive,
		"Global.flamefruit0" : Global.flamefruit0,
		"Global.flamefruit1" : Global.flamefruit1,
		"Global.flamefruit2" : Global.flamefruit2,
		"Global.flamefruit3" : Global.flamefruit3,
		"Global.flamefruit4" : Global.flamefruit4,
		"Global.flamefruit5" : Global.flamefruit5,
		"Global.flamefruit6" : Global.flamefruit6,
		"Global.flamefruit7" : Global.flamefruit7,
		"Global.flamefruit8" : Global.flamefruit8
		
	}	
	return save_dict
	
