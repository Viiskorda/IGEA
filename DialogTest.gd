extends CanvasLayer


func _on_ElderTalk_body_entered(body):
	$Sprite/Polygon2D/RichTextLabel.start = true
	$Sprite.visible = true
	if Global.mainDialogue == 1:
		$Sprite/Polygon2D/RichTextLabel.page = 0
	if Global.mainDialogue == 2:
		$Sprite/Polygon2D/RichTextLabel.page = 1


func _on_ElderTalk_body_exited(body):
	$Sprite/Polygon2D/RichTextLabel.start = false
	$Sprite/Polygon2D/RichTextLabel.line = 0
	$Sprite.visible = false