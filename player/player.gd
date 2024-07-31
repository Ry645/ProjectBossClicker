extends Sprite2D

class_name Player


func _on_player_collision_send_damage(damage):
	($healthSystem as HealthSystem).takeDamage(damage)

#func inputProcess():
	#if Input.is_action_just_pressed("attack"):
		#print("nyeh")
