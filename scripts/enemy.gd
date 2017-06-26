extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_emeny_body_enter( body ):
	print("lol")
	get_tree().get_root().get_node("main").die();
	global.linesSpeed = 0;
	pass # replace with function body
