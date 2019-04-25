extends RichTextLabel

var start = false
var dialog = ["Player! You have successfully returned home, thank the Gods. Sadly our reunion will not be a joyous one...", "While you were on your pilgrimage we were attacked by an unknown tribe. Your sister, mother and everybody managed to escape while I held up the barrier, but doing so made me use up the last of my lifeforce. I have moved on to the afterlife, but was granted the chance to meet you one last time.", "My dearest Grandchild.. I am so proud of you. You will do great things in life. Please don't mourn my absence, for I lived a long and blessed life.", "Grandfather.. *sniff*", "I don't have much time, so my very last wish, will you please grant it?", "Of course! Whatever you wish for!", "The intruders destroyed our protective barrier, so now the village is overrun with monsters from the forest. The others won't return as long as the village is unsafe. Please, can you rid of these beasts so that the barrier can be restored?", "The Holy Altar in the Northern Caverns won't let you enter before all the monsters have been cleared. From there, you will receive a new power. A Skill rightfully yours as a Daughter of the Azure Tribe. Return to me once you've received the skill.", "My child, I am so glad to see you safe! I did not expect the Guardian to attack you. It must be because you went to receive the power earlier than usual. Keep this in mind on your journey - powerful guardians protect Altars all around the world, be sure you're ready to face one before visiting an altar.", "Now that you've acquired the skill to jump higher thanks to magic you can reach the Holy Crystal above me. Take it to the Gate located on the east side of the village.", "And now for my last wish that you promised to fulfill..", "(What? I thought this already was his last wish?)", "For my last wish.. please live a long and wonderful life, my dearest child. Know that you are always loved, no matter what choices you might make or wherever life might take you.", "Granpa.. *sniffle* Don't go! *sniffle*", ".. You will be a wonderful Elder one day.. Farewell, my child..", "Grandpa!! *sniffle* ..I will protect this village.. I swear on my life!! *sniffle*", "*sniffle* .. I should go and restore the barrier and then find the villagers, so they can finally return home. I will make grandpa proud!"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if start == true:
		if Input.is_action_pressed("ui_talk"):
			if get_visible_characters() > get_total_character_count():
				if page < dialog.size()-1:
					page += 1
					set_bbcode(dialog[page])
					set_visible_characters(0)
			else:
				set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	if start == true:
		set_visible_characters(get_visible_characters()+1)
