extends Node2D

func _ready():
	$DoublejumpInst.monitoring = false

func _physics_process(delta):
	if Global.enemy2isalive == false:
		$DoublejumpInst.monitoring = true
