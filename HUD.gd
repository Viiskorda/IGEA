extends CanvasLayer
var once=false

func update_healthbar(value):
	$VContainer/HealthBar.value = value

func update_manabar(value):
	$VContainer2/ManaBar.value = value

func _process(_delta):
	if Global.double_jump==true && once==false:
		once=true
		#tee TextureRect nähtamatuks ning näita TextureRect1
		$TextureRect2.visible=not $TextureRect2.visible
		$TextureRect.visible=not $TextureRect.visible
#		for i in range(0, get_child_count()):
#
#    		print(get_child(i).name)
