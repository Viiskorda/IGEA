extends CanvasLayer



func _on_ElderTalk_body_entered(body):
	$Sprite/Polygon2D/RichTextLabel.start = true
	$Sprite.visible = true


func _on_ElderTalk_body_exited(body):
	$Sprite/Polygon2D/RichTextLabel.start = false
	$Sprite/Polygon2D/RichTextLabel.page = 0
	$Sprite.visible = false
