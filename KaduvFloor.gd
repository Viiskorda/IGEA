extends StaticBody2D



func _on_Area2D_body_entered(body):
	$CollisionShape2D.call_deferred("set_disabled", false)
