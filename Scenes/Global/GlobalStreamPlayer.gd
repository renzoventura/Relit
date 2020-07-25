extends AudioStreamPlayer

const game_music = "res://assets/sfx/background_music.ogg"
const menu_music = "res://assets/sfx/menu_music.ogg"

var in_game = false
var in_menu = false

func _ready():
	self.set_pause_mode(2) # Set pause mode to Process
	set_process(true)
	
func play_menu_music():
	stream = load(menu_music)
	play()

func play_game_music():
	stream = load(game_music)
	play()

func set_pitch(paused):
	if paused:
		pitch_scale = 0.8
	else:
		pitch_scale = 1
