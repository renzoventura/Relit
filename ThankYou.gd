extends Control

const BLACK = Color(0,0,0)
const WHITE = Color(1,1,1)
onready var hover = $Hover
onready var click = $Click

onready var main_menu_button = $CenterContainer/VBoxContainer/MainMenu

func _on_MainMenu_mouse_entered():
	hover.play()
	main_menu_button.add_color_override("font_color", BLACK)

func _on_MainMenu_mouse_exited():
	main_menu_button.add_color_override("font_color", WHITE)

func _on_MainMenu_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			click.play()
			var t = Timer.new()
			t.set_wait_time(0.6)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			get_tree().change_scene_to(load(str("res://Scenes/Menu/BaseScene.tscn")))
