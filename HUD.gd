extends CanvasLayer

func update_healthbar(value):
	$VContainer/HealthBar.value = value

func update_manabar(value):
	$VContainer2/ManaBar.value = value

func _process(_delta):
	if Global.double_jump==true:
		#tee TextureRect nähtamatuks ning näita TextureRect1
		print(get_tree())
		pass
