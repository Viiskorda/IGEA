extends KinematicBody2D

const FLOOR = Vector2(0, -1)

var motion = Vector2()

var direction = 1

var is_dead = false

export(int) var hp = 1
export(int) var grav = 30
export(int) var speed = 150

func _ready():
	pass
	
	
	
func dead():
	hp -= 1
	if hp <= 0:
		is_dead = true
		motion = Vector2(0, 0)
		$AnimatedSprite.play("dead")
		$CollisionShape2D.disabled = true
		$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		motion.x = speed * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
			
		$AnimatedSprite.play("walk")
		
		motion.y += grav
		
		motion = move_and_slide(motion, FLOOR)
		
		if $RayCast2D.is_colliding() == false:
			direction = direction * -1
			$RayCast2D.position.x *= -1
			
			
		if get_slide_count() > 0:
			for i in range (get_slide_count()):
				if "Chara" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.dead()

func _on_Timer_timeout():
	queue_free()
