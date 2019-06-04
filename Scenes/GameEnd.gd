extends Area2D


func _on_Scene2_gameEnd():
	$CollisionShape2D.disabled = false