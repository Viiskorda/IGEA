extends CanvasLayer


func _on_ElderTalk_body_entered(body):
	print(Global.questDone)
	if Global.questDone == 1:
		$Sprite/Polygon2D/RichTextLabel.page = 2
		$Sprite/Polygon2D/RichTextLabel.line = 0
	elif Global.questDone == 2:
		$Sprite/Polygon2D/RichTextLabel.page = 3
		$Sprite/Polygon2D/RichTextLabel.line = 0
		
	if Global.mainDialogue == 1:
		$Sprite/Polygon2D/RichTextLabel.page = 0
	if Global.mainDialogue == 2:
		$Sprite/Polygon2D/RichTextLabel.page = 1
	
	$Sprite.visible = true
	$Sprite/Polygon2D/RichTextLabel.start = true
	$Sprite/Polygon2D/RichTextLabel.whenEntered()


func _on_ElderTalk_body_exited(body):
	$Sprite/Polygon2D/RichTextLabel.start = false
	$Sprite/Polygon2D/RichTextLabel.line = 0
	$Sprite.visible = false