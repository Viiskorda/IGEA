extends Area2D

const SPEED = 600

var motion = Vector2()
var direction = 1


func _ready():
	pass
	
	
func set_shoot_direction(dir):
	direction = dir
	
	if dir == -1:
		$AnimatedSprite.flip_h = true
	
	
func _physics_process(delta):
	motion.y = SPEED * delta * direction
	translate(motion)
	
	$AnimatedSprite.play("nest")
	

func _on_Shoot_body_entered(body):
		if "Chara" in body.name:
			print("pihtas")
			body.dead()
		queue_free()
