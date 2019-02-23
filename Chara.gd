extends KinematicBody2D

const UP=Vector2(0,-1)
const SPEED=300
const GRAV=30
var motion=Vector2();
const JUMP=-750
var Throw=preload("res://Throw.tscn")
var direction=0

func throw(x):
	var rock=Throw.instance()
	rock.position=position+Vector2(x,0)
	var imp=get_global_mouse_position()-position
	get_node('../../').add_child(rock)
	rock.apply_impulse(Vector2(),imp)

func _physics_process(delta):
	motion.y+=GRAV
		
		
	if Input.is_action_pressed('ui_right'):
		direction=0
		motion.x =SPEED
		$LiikuvChara.flip_h=false
		$LiikuvChara.play("move")
		if Input.is_action_just_pressed('ui_throw'):
			throw(20)
			
		
	elif Input.is_action_pressed('ui_left'):
		direction=1
		motion.x =-SPEED
		
		$LiikuvChara.flip_h=true
		$LiikuvChara.play("move")
		
		if Input.is_action_just_pressed('ui_throw'):
			throw(-70)
			
	else:
		$LiikuvChara.play("idle")
		motion.x=0
		if Input.is_action_just_pressed('ui_throw') && direction==0:
			throw(20)
		if Input.is_action_just_pressed('ui_throw') && direction==1:
			throw(-70)
		
	if is_on_floor():
		if Input.is_action_just_pressed('ui_jump'):
			motion.y=JUMP
	else:
		$LiikuvChara.play("jump")
		
	
		
	motion=move_and_slide(motion, UP)