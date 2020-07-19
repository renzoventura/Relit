extends Area2D

func _on_DeathDetector_body_entered(body):
	if(body.name == "Player" and body.has_method("hurt")):
		body.hurt()
		
