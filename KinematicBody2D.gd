extends KinematicBody2D

const SHOOT = preload("res://BossTestShoot.tscn")
var direction = 1
var directiony = 1

func spit():
	print("ptüi")
	var shoot = SHOOT.instance()
	get_parent().add_child(shoot)
	shoot.position = $Hoidja/Position2D.global_position
	$Hoidja.rotation_degrees += 30
	print($Hoidja.rotation_degrees)

func _physics_process(_delta):
	spit()