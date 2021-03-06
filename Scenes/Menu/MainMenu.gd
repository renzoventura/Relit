extends Control

const BLACK = Color(0,0,0)
const WHITE = Color(1,1,1)

func _on_StartGame_mouse_entered():
	GlobalSoundEffectPlayer.play_hover()
	$CenterContainer/Texts/Options/StartGame.add_color_override("font_color", BLACK)

func _on_StartGame_mouse_exited():
	$CenterContainer/Texts/Options/StartGame.add_color_override("font_color", WHITE)

func _on_Credits_mouse_entered():
	GlobalSoundEffectPlayer.play_hover()
	$CenterContainer/Texts/Options/Credits.add_color_override("font_color", BLACK)

func _on_Credits_mouse_exited():
	$CenterContainer/Texts/Options/Credits.add_color_override("font_color", WHITE)

func _on_StartGame_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			GlobalSoundEffectPlayer.play_click()
			GlobalStreamPlayer.play_game_music()
			get_tree().change_scene_to(load(str("res://Scenes/levels/Level0.tscn")))


func _on_Credits_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			GlobalSoundEffectPlayer.play_click()
			get_tree().change_scene_to(load(str("res://Scenes/Menu/Credits.tscn")))

