extends RigidBody2D

var ttl=0

func _physics_process(delta):
	ttl+=delta
	if !get_viewport_rect().has_point(position) or ttl>10:
		queue_free()

func _on_Stones_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	queue_free()