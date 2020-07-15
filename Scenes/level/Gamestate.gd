extends Node2D

const _order = [
	"Level0",
	"Level1",
	"Level2",
]

static func get_level(var index: int):
	return load(str("res://Scenes/levels/", _order[index], ".tscn"))
	
func _ready():
	pass # Replace with function body.
	
func next_level():
	var context = get_tree().get_current_scene().get_name()
	var current_index = _order.bsearch(context)
	var next_index = current_index + 1
	if check_if_level_exist(next_index):
		end_game()
	else: 
		get_tree().change_scene_to(get_level(next_index))

func end_game():
	get_tree().quit()

func check_if_level_exist(var index: int):
	var size = _order.size()
	return index >= size
