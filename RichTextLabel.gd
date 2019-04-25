extends RichTextLabel

var dialog = ["Tere, mis toimub kas saad midagi elust aru", "Yo, mis värk on?"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if Input.is_action_pressed("ui_talk"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())				

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
