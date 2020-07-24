extends Control
const BLACK = Color(0,0,0)
const WHITE = Color(1,1,1)

onready var back = $CenterContainer/VBoxContainer/VBoxContainer/Back
onready var hover = $Hover
onready var click = $Click
func _on_Back_mouse_entered():
	back.add_color_override("font_color", BLACK)
	hover.play()

func _on_Back_mouse_exited():
	back.add_color_override("font_color", WHITE)
	hover.play()

func _on_Back_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
				click.play()
				var t = Timer.new()
				t.set_wait_time(0.6)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				get_tree().change_scene_to(load(str("res://Scenes/Menu/MainMenu.tscn")))



