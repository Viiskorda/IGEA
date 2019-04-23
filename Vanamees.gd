extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(_delta):
	$AnimatedSprite.play("idle")
	if Global.charaPosition.x  < 1700 and Global.charaPosition.x  > 1400 and Global.charaPosition.y  < 1330:
		$AnimatedSprite.modulate.a = 1
		Global.firstConversationWithChara=1
	elif Global.firstConversationWithChara>1:
		$AnimatedSprite.modulate.a = 1
	else:
		$AnimatedSprite.modulate.a = .1
		
	
	
	
func _if_chara_is_near(body):
		if "Chara" in body.name:
			if Global.firstConversationWithChara==1:
				#Esimene jutuajamine Charaga
				pass
			if Global.firstConversationWithChara==2:
				#Teine jutuajamine Charaga
				pass
			

			
