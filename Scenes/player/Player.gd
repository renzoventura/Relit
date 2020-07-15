extends KinematicBody2D

const SPEED = 600;
const GRAVITY = 150;
const UP = Vector2(0,-1)
const JUMP_SPEED = 2000
const JUMP_PAD_SPEED = 6000
const WORLD_LIMIT = 4000
const dark_modulate = Color("6e6e6e")
const light_modulate = Color("ffffff")

var motion = Vector2(0,0)
var can_toggle = true

func _ready():
	can_toggle = true

func _process(delta):
	apply_gravity()
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
		motion.y += GRAVITY
		
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED

func toggle_form():
	if Input.is_action_just_pressed("toggle_form") and can_toggle:
		toggle_mask_one()
		toggle_mask_two()
		update_texture()
		update_camera_texture()
	
func toggle_mask_one():
	set_collision_mask_bit(1, !get_collision_mask_bit(1))

func toggle_mask_two():
	set_collision_mask_bit(2, !get_collision_mask_bit(2))

func update_texture():
	if (get_collision_mask_bit(1)):
		$Sprite.modulate = dark_modulate
	elif (get_collision_mask_bit(2)):
		$Sprite.modulate = light_modulate

func update_camera_texture():
	if (get_collision_mask_bit(1) and !get_collision_mask_bit(2)):
		$Camera2D/ParallaxBackground/ParallaxLayer/TextureRect.texture = load("res://assets/black_background.png")
	else:
		$Camera2D/ParallaxBackground/ParallaxLayer/TextureRect.texture = load("res://assets/white_background.png")

func _on_Area2D_body_entered(body):
	#print("something entered cant toggle")
	if body.name != "Player":
		can_toggle = false

func _on_Area2D_body_exited(body):
	#print("something exited we can toggle")
	if body.name != "Player":
		can_toggle = true
