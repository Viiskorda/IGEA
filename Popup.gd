extends CanvasLayer

func _on_StartTekst_body_entered(body):
	$InstructionBase/Polygon2D/PopupText.page = 4
	$InstructionBase/Polygon2D/PopupText.start = true
	$InstructionBase/Polygon2D/PopupText.whenEntered()
	$InstructionBase.visible = true

func _on_StartTekst_body_exited(body):
	$InstructionBase/Polygon2D/PopupText.start = false
	$InstructionBase.visible = false


func _on_Flamefruit_Tutorial_body_entered(body):
	$InstructionBase/Polygon2D/PopupText.page = 1
	$InstructionBase/Polygon2D/PopupText.start = true
	$InstructionBase/Polygon2D/PopupText.whenEntered()
	$InstructionBase.visible = true
	$InstructionBase/Polygon2D/FlameFruit.visible = true

func _on_Flamefruit_Tutorial_body_exited(body):
	$InstructionBase/Polygon2D/PopupText.start = false
	$InstructionBase.visible = false
	$InstructionBase/Polygon2D/FlameFruit.visible = false


func _on_Back_to_village_tutorial_body_entered(body):
	$InstructionBase/Polygon2D/PopupText.page = 0
	$InstructionBase/Polygon2D/PopupText.start = true
	$InstructionBase/Polygon2D/PopupText.whenEntered()
	$InstructionBase.visible = true

func _on_Back_to_village_tutorial_body_exited(body):
	$InstructionBase/Polygon2D/PopupText.start = false
	$InstructionBase.visible = false


func _on_JumpTut_body_entered(body):
	$InstructionBase/Polygon2D/PopupText.page = 2
	$InstructionBase/Polygon2D/PopupText.start = true
	$InstructionBase/Polygon2D/PopupText.whenEntered()
	$InstructionBase.visible = true

func _on_JumpTut_body_exited(body):
	$InstructionBase/Polygon2D/PopupText.start = false
	$InstructionBase.visible = false


func _on_ShootTut_body_entered(body):
	$InstructionBase/Polygon2D/PopupText.page = 3
	$InstructionBase/Polygon2D/PopupText.start = true
	$InstructionBase/Polygon2D/PopupText.whenEntered()
	$InstructionBase.visible = true
	$InstructionBase/Polygon2D/Monster.visible = true
	$InstructionBase/Polygon2D/Ability.visible = true

func _on_ShootTut_body_exited(body):
	$InstructionBase/Polygon2D/PopupText.start = false
	$InstructionBase.visible = false
	$InstructionBase/Polygon2D/Monster.visible = false
	$InstructionBase/Polygon2D/Ability.visible = false


func _on_GateTut_body_entered(body):
	$InstructionBase/Polygon2D/PopupText.page = 5
	$InstructionBase/Polygon2D/PopupText.start = true
	$InstructionBase/Polygon2D/PopupText.whenEntered()
	$InstructionBase.visible = true
	$InstructionBase/Polygon2D/Gate.visible = true

func _on_GateTut_body_exited(body):
	$InstructionBase/Polygon2D/PopupText.start = false
	$InstructionBase.visible = false
	$InstructionBase/Polygon2D/Gate.visible = false


func _on_DoublejumpInst_body_entered(body):
	if Global.enemy2isalive == false:
		$InstructionBase/Polygon2D/PopupText.page = 6
		$InstructionBase/Polygon2D/PopupText.whenEntered()
		$InstructionBase/Polygon2D/PopupText.start = true
		$InstructionBase.visible = true
		$InstructionBase/Polygon2D/Doublejump.visible = true
