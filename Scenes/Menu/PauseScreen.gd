extends Control

const BLACK = Color(0,0,0)
const WHITE = Color(1,1,1)

onready var quit_label = $ColorRect/CenterContainer/VBoxContainer/Quit
onready var resume_label = $ColorRect/CenterContainer/VBoxContainer/Resume

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = !visible
		GlobalStreamPlayer.set_pitch(get_tree().paused)
#		get_tree().call_group("Gamestate", "set_background_music", get_tree().paused)

func _on_Resume_mouse_entered():
	GlobalSoundEffectPlayer.play_hover()
	resume_label.add_color_override("font_color", BLACK)

func _on_Resume_mouse_exited():
	resume_label.add_color_override("font_color", WHITE)

func _on_Resume_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			GlobalSoundEffectPlayer.play_click()
			visible = not visible
			get_tree().paused = false
			get_tree().call_group("Gamestate", "set_background_music", get_tree().paused)
			GlobalStreamPlayer.set_pitch(get_tree().paused)

func _on_Quit_mouse_entered():
	GlobalSoundEffectPlayer.play_hover()
	quit_label.add_color_override("font_color", BLACK)

func _on_Quit_mouse_exited():
	quit_label.add_color_override("font_color", WHITE)

func _on_Quit_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			GlobalSoundEffectPlayer.play_click()
			GlobalStreamPlayer.set_pitch(get_tree().paused)
			get_tree().paused = false
			get_tree().change_scene_to(load(str("res://Scenes/Menu/MainMenu.tscn")))
			GlobalStreamPlayer.set_pitch(get_tree().paused)
