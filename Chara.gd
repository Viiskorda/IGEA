extends KinematicBody2D

const UP=Vector2(0,-1)
const SPEED=200
const GRAV=20
var motion=Vector2();
const JUMP=-550

func _physics_process(delta):
	motion.y+=GRAV
		
	if Input.is_action_pressed('ui_right'):
		motion.x =SPEED
		$LiikuvChara.flip_h=false
		$LiikuvChara.play("move")
		
	elif Input.is_action_pressed('ui_left'):
		motion.x =-SPEED
		
		$LiikuvChara.flip_h=true
		$LiikuvChara.play("move")
	else:
		$LiikuvChara.play("idle")
		motion.x=0
		
	if is_on_floor():
		if Input.is_action_just_pressed('ui_jump'):
			motion.y=JUMP
	else:
		$LiikuvChara.play("jump")
		
	
		
	motion=move_and_slide(motion, UP)