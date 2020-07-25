extends AudioStreamPlayer


func _ready():
	stream = load("res://assets/sfx/menu_click.wav")
	self.set_pause_mode(2) # Set pause mode to Process
	set_process(true)

func play_click():
	stream = load("res://assets/sfx/menu_click.wav")
	play()
	
func play_hover():
	stream = load("res://assets/sfx/menu_hover.wav")
	play()
