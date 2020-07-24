extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Portal_body_entered(body):
	get_tree().call_group("Gamestate", "next_level")
#	$AudioStreamPlayer.play()
