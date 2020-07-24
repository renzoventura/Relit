extends Node2D

const _order = [
	"Level0",
	"Level1",
#	"Level2",
]

static func get_level(var index: int):
	return load(str("res://Scenes/levels/", _order[index], ".tscn"))

onready var backgroundMusic = $Music/AudioStreamPlayer
onready var tween_out = get_node("Tween")


func _ready():
	play_music()

func next_level():
	var context = get_tree().get_current_scene().get_name()
	var current_index = _order.bsearch(context)
	var next_index = current_index + 1
	if check_if_level_exist(next_index):
		end_game()
	else: 
		get_tree().change_scene_to(get_level(next_index))

func check_if_level_exist(var index: int):
	var size = _order.size()
	return index >= size

func end_game():
	get_tree().change_scene_to(load(str("res://Scenes/Menu/ThankYou.tscn")))


func reset_level():
	get_tree().reload_current_scene()

func set_background_music(paused):
	if paused:
		backgroundMusic.pitch_scale = 0.8
	else:
		backgroundMusic.pitch_scale = 1
		
var starting_volume = -20

func play_music():
	backgroundMusic.volume_db = starting_volume;
	backgroundMusic.play();
	fade_in_music(backgroundMusic)
	
func fade_in_music(stream_player):
	var transition_duration = 2
	var transition_type = 4 # TRANS_SINE
	tween_out.interpolate_property(stream_player, "volume_db", starting_volume, 0, transition_duration, transition_type, Tween.EASE_IN, 3)
	tween_out.start()
