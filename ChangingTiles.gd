extends Node2D

const light_texture = "res://assets/white_tile.png"
const dark_texture = "res://assets/dark_tile.png"
var can_change = true
export var is_light = false

onready var sprite = $Sprite;
onready var timer = $Timer;
onready var static_body = $Sprite/StaticBody2D;

func _ready():
	if(can_change):
		change_texture()
	timer.start()

func _on_Timer_timeout():
	if(can_change):
		change_texture()
	timer.start()

func change_texture():
	if is_light:
		sprite.texture = load(dark_texture)
		is_light = false
	else:
		sprite.texture = load(light_texture)
		is_light = true
	change_mask_collision()

func change_mask_collision():
	if is_light:
		static_body.set_collision_layer_bit(1, true)
		static_body.set_collision_layer_bit(2, false)
	else:
		static_body.set_collision_layer_bit(1, false)
		static_body.set_collision_layer_bit(2, true)


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		can_change = false



func _on_Area2D_body_exited(body):
	if(body.name == "Player"):
		can_change = true
