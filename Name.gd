extends Label

var dialog = ["Player", "Elder"]

func _input(event):
	if Global.ElderTalk == true:
		text = dialog[1]
	else:
		text = dialog[0]