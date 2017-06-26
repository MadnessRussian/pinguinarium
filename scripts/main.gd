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
var randMaximumLevel = 4;
var deltaPoint = 0;

var player;

func _ready():
	global.linesSpeed = 4;
	size = global.tilezise;
	lines = get_node("lines");
	lines.set_translation(Vector3(-global.screenSize.x/2,global.screenSize.y/2,-size))

	player =  get_node("lines/player");
	player.set_scale(Vector3(size,size,size));

	generate();
	pass
func generate():
	randomize();
	lineType =  round(rand_range(0,randMaximumLevel));
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
	if(player.get_translation().x>0 && global.linesSpeed != 0):
		player.move(1);
	pass # replace with function body


func _on_right_pressed():
	if(player.get_translation().x<global.screenSize.x-size  && global.linesSpeed != 0):
		player.move(2);
	pass # replace with function body

func die():
	get_node("AcceptDialog").show_modal();
	pass
func newScore():
	get_node("score/points").set_text(String(global.score))
	if(randMaximumLevel<lineArray.size()-1):
		if(deltaPoint>15 ):
			randMaximumLevel+=1;
			deltaPoint = 0;
		else:
			deltaPoint+=1;
	pass
func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene();
	pass # replace with function body


func _on_SwipeDetector_swiped( gesture ):
	if(gesture.get_direction() == "left" && player.get_translation().x>0 && global.linesSpeed != 0):
		player.move(1);
	if(gesture.get_direction() == "right" && player.get_translation().x<global.screenSize.x-size  && global.linesSpeed != 0):
		player.move(2);

	pass # replace with function body
