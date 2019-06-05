extends CanvasLayer

func _ready():
	$Node2D/Enemy/EnemyText.text = str(Global.EnemiesKilled) + "/4"
	$Node2D/Boss.modulate.a = Global.modulate1
	$Node2D/Crystal.modulate.a = Global.modulate2
	$Node2D/Gate.modulate.a = Global.modulate3
	$Node2D.visible = Global.MissionsVisible
	$Node2D/Boss/BossText.text = Global.m1Tekst
	$Node2D/Crystal/CrystalText.text = Global.m2Tekst
	$Node2D/Gate/GateText.text = Global.m3Tekst

func _on_Enemy3_enemyDead():
	$Node2D.visible = true
	Global.MissionsVisible = true
	Global.EnemiesKilled += 1
	$Node2D/Enemy/EnemyText.text = str(Global.EnemiesKilled) + "/4"


func _on_Enemy5_enemyDead():
	$Node2D.visible = true
	Global.MissionsVisible = true
	Global.EnemiesKilled += 1
	$Node2D/Enemy/EnemyText.text = str(Global.EnemiesKilled) + "/4"


func _on_Enemy6_enemyDead():
	$Node2D.visible = true
	Global.MissionsVisible = true
	Global.EnemiesKilled += 1
	$Node2D/Enemy/EnemyText.text = str(Global.EnemiesKilled) + "/4"


func _on_Enemy4_enemyDead():
	$Node2D.visible = true
	Global.MissionsVisible = true
	Global.EnemiesKilled += 1
	$Node2D/Enemy/EnemyText.text = str(Global.EnemiesKilled) + "/4"

func _physics_process(delta):
	if Global.EnemiesKilled == 4 && Global.mission1 == false:
		$Node2D/Boss.modulate.a = 1
		Global.modulate1 = 1
		Global.mission1 == true
	if Global.enemy2isalive == false && Global.mission2 == false:
		$Node2D/Crystal.modulate.a = 1
		Global.modulate2 = 1
		Global.mission2 == true
		$Node2D/Boss/BossText.text = "1/1"
		Global.m1Tekst = "1/1"
	if Global.CharaGotTheCrystal == true && Global.mission3 == false:
		$Node2D/Gate.modulate.a = 1
		Global.modulate3 = 1
		Global.mission3 == true
		$Node2D/Crystal/CrystalText.text = "1/1"
		Global.m2Tekst = "1/1"
	if Global.mission4 == true:
		$Node2D/Gate/GateText.text = "1/1"
		Global.m3Tekst = "1/1"

func _on_Dialoog_MissionOneV():
	$Node2D.visible = true
	Global.MissionsVisible = true


func _on_Pause_missions():
	$Node2D.visible = false
	Global.MissionsVisible = false
