#LevelComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var change_level
export(String) var target_spawn_group


func _ready():
	#$FadeOut.start()
	$Sprite.modulate.a=0
	pass


func _physics_process(_delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Chara":
			#get_tree().change_scene(change_level)
			$Sprite.modulate.a=0
			$Timer.start()
			$Modulate.start()

			



func _on_Timer_timeout():

	Global.goto_scene(change_level,target_spawn_group)


func _on_Modulate_timeout():
	$Sprite.modulate.a+=.1


func _on_FadeOut_timeout():
	$Sprite.modulate.a-=.1
