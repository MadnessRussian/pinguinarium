extends Node

var screenSize = Vector2(0,0);
var tilezise = 0;

func _ready():
	screenSize =OS.get_window_size();
	tilezise = screenSize.x / 5;
	pass
