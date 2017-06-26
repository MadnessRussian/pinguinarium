extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_fish_body_enter( body ):
	global.linesSpeed += 0.05;
	global.score+=1;
	get_tree().get_root().get_node("main").newScore();
	queue_free();
	pass # replace with function body
