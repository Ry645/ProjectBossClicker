extends Sprite2D

class_name Player


func _on_player_collision_send_damage(damage):
	($healthSystem as HealthSystem).takeDamage(damage)
