extends RigidBody2D

var ttl=0

func _physics_process(delta):
	ttl+=delta
	if !get_viewport_rect().has_point(position) or ttl>1:
		queue_free()
		