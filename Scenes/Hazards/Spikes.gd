extends Node2D

export var can_change = true
export var is_light = false
export var is_neutral = true
const dark_modulate = Color("6e6e6e")
const light_modulate = Color("ffffff")
const neutral_modulate = Color("FF0000")
onready var sprite = $Sprite;
onready var timer = $Timer;
onready var static_body = $Sprite/StaticBody2D;

func _ready():
	if is_neutral:
		sprite.modulate = neutral_modulate
	else:
		change_mask_collision()
		change_texture()
		if(can_change):
			change_texture()
			timer.start()

func _on_Timer_timeout():
	if(can_change):
		change_texture()

	timer.start()

func change_texture():
	if is_light:
		sprite.modulate = light_modulate
		is_light = false
	else:
		sprite.modulate = dark_modulate
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
		body.hurt()

func _on_Area2D_body_exited(body):
	if(body.name == "Player"):
		can_change = true
		body.hurt()

func _on_DeathZone_body_entered(body):
	if(body.name == "Player"):
		can_change = false
		body.hurt()
