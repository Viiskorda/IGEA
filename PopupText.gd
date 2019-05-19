extends RichTextLabel

var start = false
var page = 0
var line = 0

var popups = [["[center]I should head back to village. I've been away on the pilgrimage long enough...[/center]"],
["[center]You've found a Flamefruit!\n\nThese recharge your mana points. You can store up to 12 mana points at a time. There's only a limited amount of Flamefruits in this world though...\nso use them wisely![/center]"],
["[center]Press 'W' to jump.[/center]"],
["[center]You've encountered a monster! \nPress 'SPACE' to shoot with your Fire Ball ability.\n Each shot costs 1 mana point.[/center]"],
["[center]Press 'A' to move left and 'D' to move right.[/center]"],
["[center]Did you end up losing some lives? Need to save your progress?\n Press 'E' to restore your lives near posts like these.\nYou can have 10 lives at a time.\nTo save your progress you simply need to walk past the post.[/center]"]]


func whenEntered():
	set_bbcode(popups[page][line])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if start == true:
		if Input.is_action_pressed("ui_talk"):
			if get_visible_characters() > get_total_character_count():
				if line < popups[page].size()-1:
					line += 1
					set_bbcode(popups[page][line])
					set_visible_characters(0)
				else:
					print(get_node("../.."))
					get_node("../..").visible = false
			else:
				set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	if start == true:
		set_visible_characters(get_visible_characters()+1)