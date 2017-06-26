extends Node

var screenSize = Vector2(0,0);
var tilezise = 0;
var linesSpeed = 3;
var score = 0;

func _ready():
	screenSize =OS.get_window_size();
	tilezise = screenSize.x / 5;

	pass
