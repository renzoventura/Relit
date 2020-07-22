extends AnimatedSprite

func _on_Player_animate(motion, is_light):
	if(is_light):
		if motion.y < 0: 
			play("light_jump")
		elif motion.y > 0: 
			play("light_idle")
		elif motion.x == 0:
			play("light_idle")
		elif motion.x < 0:
			flip_h = true
#			play("walk_left")
		elif motion.x > 0:
			flip_h = false
#			play("walk_right")
	else:
		if motion.y < 0: 
			play("dark_jump")
		elif motion.y > 0: 
			play("dark_idle")
		elif motion.x == 0:
			play("dark_idle")
		elif motion.x < 0:
			flip_h = true
#			play("walk_left")
		elif motion.x > 0:
			flip_h = false
#			play("walk_right")
