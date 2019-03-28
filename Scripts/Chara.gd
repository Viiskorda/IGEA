extends KinematicBody2D

signal hp_changed
signal mp_changed

const UP=Vector2(0,-1)
const SPEED=300
const GRAV=30
const JUMP=-750
const DAMAGE_DELAY = 0.5

const SHOOT = preload("res://Scenes/Shoot.tscn")

var motion=Vector2();
var Throw=preload("res://Throw.tscn")
var direction=0
var is_dead = false
var on_ground = false
var getDamage = 1
var lastStep = 2


func _ready():
	emit_signal("hp_changed", Global.health)
	emit_signal("mp_changed", Global.mana)
	
	
# Throw.tscn 
#
func throw(x):
	var rock=Throw.instance()
	rock.position=position+Vector2(x,0)
	var imp=get_global_mouse_position()-position
	get_node('../../').add_child(rock)
	rock.apply_impulse(Vector2(),imp)

func _physics_process(delta):
	
	if is_dead == false:
	
		motion.y+=GRAV
		$HP.text = str(Global.health)

		if position.y >= 5000:
			get_tree().reload_current_scene()



		
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
			
			

			
			
			
		
			
		
		if Input.is_action_pressed("ui_jump"):
			if on_ground == true:
				motion.y = JUMP
				on_ground = false
		
		if is_on_floor():
			on_ground = true
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
			var shoot = SHOOT.instance()
			
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
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()

func audioStep():
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	if lastStep == 2:
		lastStep = 0
		audioPlayer.stream = load("res://Sounds/step1.wav")
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
		audioPlayer.stream = load("res://Sounds/step1.wav")
		audioPlayer.play()
		var t = Timer.new()
		t.set_wait_time(0.323)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		lastStep = 2
	
	
	
	
func dead():
	if getDamage == 1:
		Global.health -= 1
		emit_signal("hp_changed", Global.health)
		emit_signal("mp_changed", Global.mana)
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
	get_tree().reload_current_scene()
	
#func save():
#	var save_dict={
#		pos={
#			x=get_pos().x,
#			y=get_pos().y
#		},
#		Global.health=Global.health
#	}
#	return save_dict
	
