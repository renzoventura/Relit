extends Control

const BLACK = Color(0,0,0)
const WHITE = Color(1,1,1)


onready var main_menu_button = $CenterContainer/VBoxContainer/MainMenu

func _on_MainMenu_mouse_entered():
	main_menu_button.add_color_override("font_color", BLACK)


func _on_MainMenu_mouse_exited():
	main_menu_button.add_color_override("font_color", WHITE)


func _on_MainMenu_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			get_tree().change_scene_to(load(str("res://Scenes/Menu/MainMenu.tscn")))
