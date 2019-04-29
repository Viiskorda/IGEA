extends StaticBody2D

func _on_Area2D_body_entered(body):
	$CollisionShape2D.call_deferred("set_disabled", false)	

func _process(delta):
	if Global.bossHealth <= 0:
		$CollisionShape2D.call_deferred("set_disabled", true)
		
	elif Global.enemy1isalive==true and Global.enemy3isalive==true and Global.enemy4isalive==true and Global.enemy5isalive==true and Global.enemy6isalive==true:
		$CollisionShape2D.call_deferred("set_disabled", false)

	
