extends StaticBody2D
var CharaIsInCave=0
func _ready():
	$CollisionShape2D.call_deferred("set_disabled", false)

func _on_Area2D_body_entered(body):
	$CollisionShape2D.call_deferred("set_disabled", false)
	CharaIsInCave=1
	Global.BossIsFreed=true

func _process(delta):
	if Global.bossHealth <= 0:
		$CollisionShape2D.call_deferred("set_disabled", true)
	elif CharaIsInCave==1:
		$CollisionShape2D.call_deferred("set_disabled", false)
	elif Global.enemy6isalive==false and Global.enemy5isalive==false and Global.enemy4isalive==false and Global.enemy3isalive==false  and Global.enemy1isalive==false:
		$CollisionShape2D.call_deferred("set_disabled", true)

	
