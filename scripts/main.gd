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
	lines.set_translation(Vector3(-global.screenSize.x/2,global.screenSize.y/2,-size))

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
			initObject(line,"res://scenes/enemy.tscn",enemyType)
		pass
		fishRand = round(rand_range(0,1));
		if(lineArray[lineType][enemyType] == 0 && fishRand == 1):
			initObject(line,"res://scenes/fish.tscn",enemyType)
		pass
	
	lines.add_child(line);
	pass

func initObject(parent,url,cord):
	var tile = load(url).instance();
	tile.set_scale(Vector3(size,size,size));
	tile.set_translation(Vector3(size*cord,size*9,0));
	parent.add_child(tile);
	pass
func _on_left_pressed():
	if(player.get_translation().x>0):
		player.move(1);
	pass # replace with function body


func _on_right_pressed():
	if(player.get_translation().x<global.screenSize.x-size):
		player.move(2);
	pass # replace with function body
