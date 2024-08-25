extends Sprite2D

#INFO DO NOT DISABLE EDITABLE CHILDREN
#JUST COLLAPSE IT IT'S FINE

func _on_exist_timer_timeout():
	queue_free()
