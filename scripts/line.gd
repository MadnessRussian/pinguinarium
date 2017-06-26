extends KinematicBody

var deltaTime = 0;
var gen_last = false;

func _ready():
	set_process(true);
	pass

func _process(delta):
	move()
	pass

func move():
	set_translation(get_translation()+Vector3(0,-3,0))
	
	if(get_translation().y<=-global.tilezise*2 && !gen_last ):
		get_parent().get_parent().generate();
		gen_last = true;
	
	if(get_translation().y<-global.screenSize.y*2.5):
		queue_free();
	pass