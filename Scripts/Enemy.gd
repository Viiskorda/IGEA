extends KinematicBody2D

const GRAV = 30
const SPEED = 150
const FLOOR = Vector2(0, -1)

var motion = Vector2()

var direction = 1

var is_dead = false

func _ready():
	pass
	
	
	
func dead():
	is_dead = true
	motion = Vector2(0, 0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true
	$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		motion.x = SPEED * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
			
		$AnimatedSprite.play("walk")
		
		motion.y += GRAV
		
		motion = move_and_slide(motion, FLOOR)
		
		if position.x >= 1800:
			direction = direction * -1
			$RayCast2D.position.x *= -1
		
		if $RayCast2D.is_colliding() == false:
			direction = direction * -1
			$RayCast2D.position.x *= -1
			
		if get_slide_count() > 0:
			for i in range (get_slide_count()):
				if "Chara" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.dead()

func _on_Timer_timeout():
	queue_free()
