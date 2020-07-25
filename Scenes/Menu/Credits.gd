extends Control
const BLACK = Color(0,0,0)
const WHITE = Color(1,1,1)

onready var back = $CenterContainer/VBoxContainer/VBoxContainer/Back

func _on_Back_mouse_entered():
	back.add_color_override("font_color", BLACK)
	GlobalSoundEffectPlayer.play_hover()

func _on_Back_mouse_exited():
	back.add_color_override("font_color", WHITE)


func _on_Back_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			GlobalSoundEffectPlayer.play_click()
			get_tree().change_scene_to(load(str("res://Scenes/Menu/MainMenu.tscn")))



