extends Node

var linesAtScreen = [];

var lineArray=[
[1,0,0,0,0],
[0,1,0,0,0],
[0,0,1,0,0],
[0,0,0,1,0],
[0,0,0,0,1],
[1,0,1,0,0],
[0,1,0,1,0],
[0,0,1,0,1],
[1,0,0,0,1],
[1,0,1,0,1]
];
var size = 0;
var lines;
var lineType = 0;
var fishRand = 0;

var player;

func _ready():
	size = global.tilezise;
	lines = get_node("lines");
	lines.set_translation(Vector3(-240,320,-size))

	
	
	player =  get_node("lines/player");
	player.set_scale(Vector3(size,size,size));

	generate();
	pass
func generate():
	randomize();
	lineType =  round(rand_range(0,lineArray.size()-1));
	var line = load("res://scenes/line.tscn").instance();
	for enemyType in range(lineArray[lineType].size()):
		if(lineArray[lineType][enemyType] == 1):
			var enemy = load("res://scenes/enemy.tscn").instance();
			enemy.set_scale(Vector3(size,size,size));
			enemy.set_translation(Vector3(size*enemyType,size*6,0));
			line.add_child(enemy);
		pass
		fishRand = round(rand_range(0,1));
		if(lineArray[lineType][enemyType] == 0 && fishRand == 1):
			var enemy = load("res://scenes/fish.tscn").instance();
			enemy.set_scale(Vector3(size,size,size));
			enemy.set_translation(Vector3(size*enemyType,size*6,0));
			line.add_child(enemy);
		pass
	
	lines.add_child(line);
	pass


func _on_left_pressed():
	if(player.get_translation().x>0):
		player.move(1);
	pass # replace with function body


func _on_right_pressed():
	if(player.get_translation().x<global.screenSize.x-size):
		player.move(2);
	pass # replace with function body
