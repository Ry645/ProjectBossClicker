extends Node

class_name HealthSystem

signal die
signal healthUpdate(minHealth, maxHealth, currentHealth)

@export var maxHealth:float = 20.0
@export var minHealth:float = 0.0
@export var health:float = 20.0

@export var hasGodMode:bool = false

func _ready():
	call_deferred("setup")

func takeDamage(damage):
	if hasGodMode:
		return
	
	health -= damage
	#print("health: ", health)
	emit_signal("healthUpdate", minHealth, maxHealth, health)
	if health <= minHealth:
		emit_signal("die")

func setup():
	emit_signal("healthUpdate", minHealth, maxHealth, health)
