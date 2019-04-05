extends KinematicBody2D
const FLOOR = Vector2(0, -1)
var motion = Vector2()
var direction = 1
var is_dead = false

export(int) var hp = 1
export(int) var grav = 0
export(int) var speed = 150

func _ready():
	var attackRandomly= attackRandomly()
	print(attackRandomly)
	
func attackRandomly():
	return randi() % 3 
	
func dead():
	hp -= 1
	if hp <= 0:
		is_dead = true
		motion = Vector2(0, 0)
		$EnemyCol.call_deferred('free')
		$AnimatedSprite.play("dead")
		$Timer.start()

func attack(rand):
	if Global.charaPosition.x>2300 && Global.charaPosition.x<3700 && Global.charaPosition.y<850:
		#print(Global.charaPosition)
		$AnimatedSprite.play("attack")
		$Attack.start()

func spit():
	print("ptüi")


func _physics_process(_delta):
	if is_dead == false:
		motion.x = speed * -direction
		#print(position)
		
#		if direction == 1:
#			$AnimatedSprite.flip_h = false
#		else:
#			$AnimatedSprite.flip_h = true
			
		$AnimatedSprite.play("walk")
		
		#attack(attackRandomly())
		motion.y += grav
		
#		if attackRandomly()==0:
#			print(11111)
		#attack(attackRandomly())

		motion = move_and_slide(motion, FLOOR)
		
		if position.x >= Global.charaPosition.x+150:
			#print("suurem")
			direction = abs(direction) * 1
			$RayCast2D.position.x *= 1


		if $RayCast2D.is_colliding() == false && position.x <= Global.charaPosition.x-150:
			#print("väiksem")
			direction = abs(direction) * -1
			$RayCast2D.position.x *= -1
		

		if position.x <= Global.charaPosition.x+100 && position.x >= Global.charaPosition.x-100:
			var attackRandomly= randi() % 100
			if attackRandomly==10:
				spit()


		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Chara" in get_slide_collision(i).collider.name:
					Global.collidingWithChara=true

func _on_Timer_timeout():
	queue_free()

func _on_Attack_timeout():
	return attackRandomly()
	