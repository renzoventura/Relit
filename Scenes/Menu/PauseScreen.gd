extends Control

const BLACK = Color(0,0,0)
const WHITE = Color(1,1,1)

onready var quit_label = $ColorRect/CenterContainer/VBoxContainer/Quit
onready var resume_label = $ColorRect/CenterContainer/VBoxContainer/Resume

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = !visible

func _on_Resume_mouse_entered():
	resume_label.add_color_override("font_color", BLACK)

func _on_Resume_mouse_exited():
	resume_label.add_color_override("font_color", WHITE)

func _on_Resume_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			visible = not visible
			get_tree().paused = false

func _on_Quit_mouse_entered():
	quit_label.add_color_override("font_color", BLACK)

func _on_Quit_mouse_exited():
	quit_label.add_color_override("font_color", WHITE)

func _on_Quit_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			get_tree().paused = false
			get_tree().change_scene_to(load(str("res://Scenes/Menu/MainMenu.tscn")))
