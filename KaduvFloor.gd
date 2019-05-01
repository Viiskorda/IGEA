extends StaticBody2D
var CharaIsInCave=0


func _ready():
	$CollisionShape2D.call_deferred("set_disabled", false)

func _on_Area2D_body_entered(body):
	$CollisionShape2D.call_deferred("set_disabled", false)
	CharaIsInCave=1
	if Global.bossHealth > 0:
		audioKoobas()
	
	Global.BossIsFreed=true

func _process(delta):
	if Global.bossHealth <= 0:
		$CollisionShape2D.call_deferred("set_disabled", true)
	elif CharaIsInCave==1:
		$CollisionShape2D.call_deferred("set_disabled", false)
	elif Global.enemy6isalive==false and Global.enemy5isalive==false and Global.enemy4isalive==false and Global.enemy3isalive==false  and Global.enemy1isalive==false:
		$CollisionShape2D.call_deferred("set_disabled", true)
		

	

func audioKoobas():
	Global.audioPlayerBackround.stream = load("res://Sounds/back/Ambience_Cave_00.wav")
	Global.audioPlayerBackround.set_volume_db(Global.soundvolume+5)
	Global.audioPlayerBackround.play()
	print ("play: Ambience_Cave_00.wav")

