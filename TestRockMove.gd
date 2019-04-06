extends Area2D

onready var rock = get_node("..")
var fisrPosition

var rockMove = 0

func getallnodes(node):
    for N in node.get_children():
        if N.get_child_count() > 0:
            print("["+N.get_name()+"]")
            getallnodes(N)
        else:
            # Do something
            print("- "+N.get_name())
func _ready():
	fisrPosition=rock.position


func _physics_process(_delta):
	#print_tree()

	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		
		if body.name=="Chara":
			if (body.position.y+80) < rock.position.y:

				rockMove = 0
				rock.position.y += 1
		elif rockMove == 1 && fisrPosition<rock.position:
			rock.position.y -= .2

func _on_TestRockMove_area_entered(_area):
	rockMove = 0

func _on_TestRockMove_body_exited(_body):
	rockMove = 1