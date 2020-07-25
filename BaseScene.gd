extends Node2D

func _ready():
	GlobalStreamPlayer.play_menu_music()
	get_tree().change_scene_to(load("res://Scenes/Menu/MainMenu.tscn"))
