extends KinematicBody

var deltaTime = 0;
var currPos ;
var deltaPos = 0;
var isMove = false;
var direction = 0;
var speed = 15;
func _ready():

	set_translation(Vector3(global.tilezise*2,-global.screenSize.y+global.tilezise*2,0));
	currPos = get_translation();
	set_process(true)
	

	pass

func _process(delta):

	if(isMove && deltaPos <= global.tilezise-speed ):
		if(direction == 1):
			set_translation(get_translation() - Vector3(speed,0,0))
		if(direction == 2):
			set_translation(get_translation() + Vector3(speed,0,0))
		deltaPos+=speed;
	else:
		set_translation(currPos)
		isMove = false;
	pass

func move(dir):
	if dir == 1:
		currPos = Vector3(get_translation().x - global.tilezise,get_translation().y,get_translation().z);
	if dir == 2:
		currPos = Vector3(get_translation().x + global.tilezise,get_translation().y,get_translation().z);
	direction = dir;
	isMove = true;
	deltaPos = 0;
	pass
	


func _on_CollisionShape_enter_tree():
	print("enter")
	pass # replace with function body


