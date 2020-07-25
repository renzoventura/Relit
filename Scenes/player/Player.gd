extends KinematicBody2D

const SPEED = 700;
const GRAVITY = 100;
const UP = Vector2(0,-1)
const JUMP_SPEED = 1500
const JUMP_PAD_SPEED = 6000
const WORLD_LIMIT = 4000
const MAX_FALL_SPEED = 1900

export var is_light = true

var motion = Vector2(0,0)
var can_toggle = true
var is_alive = true

signal animate
signal death_animate

onready var jump_sfx = $JumpSFX
onready var hurt_sfx = $HurtSFX
onready var change_sfx = $FormChange

func _ready():
	is_alive = true
	is_light = true
	can_toggle = true

func _process(delta):
	apply_gravity()
	animate()
	if is_alive:
		move()
		jump()
		toggle_form()
		move_and_slide(motion,UP)

func move():
	if Input.is_action_pressed("left") and not Input.is_action_just_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_just_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
	
func apply_gravity():
	if is_on_floor() and motion.y > 0: 
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		if(motion.y < MAX_FALL_SPEED):
			motion.y += GRAVITY
		
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		jump_sfx.play()

func toggle_form():
	if Input.is_action_just_pressed("toggle_form") and can_toggle:
		is_light = !is_light
		change_sfx.play()
		update_form()

func update_form():
	if is_light:
		set_collision_mask_bit(1, true)
		set_collision_mask_bit(2, false)
	else:
		set_collision_mask_bit(1, false)
		set_collision_mask_bit(2, true)

func _on_Area2D_body_entered(body):
	if body.name != "Player":
		can_toggle = false

func _on_Area2D_body_exited(body):
	if body.name != "Player":
		can_toggle = true

func hurt():
	is_alive = false
	hurt_sfx.play()
	var t = Timer.new()
	t.set_wait_time(2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_tree().call_group("Gamestate", "reset_level")
	t.queue_free()
		
func animate():
	if is_alive:
		emit_signal("animate", motion, is_light)
	else: 
		emit_signal("death_animate")
	

