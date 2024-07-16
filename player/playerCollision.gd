extends Area2D

signal sendDamage(damage)

func takeDamage(damage):
	emit_signal("sendDamage", damage)
