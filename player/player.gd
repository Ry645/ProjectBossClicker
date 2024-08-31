extends Sprite2D

#TODO add iframes
#should i?

class_name Player

# raw damage without modifications
#TODO will add weapons that modify this somehow
var attackPower = 5

#TODO will tie to holding items later
var manaUsage = 5

@export var attackParticlesScene:PackedScene

func _process(_delta):
	inputProcess()

func _on_player_collision_send_damage(damage):
	($healthSystem as HealthSystem).takeDamage(damage)

func inputProcess():
	if Input.is_action_just_pressed("attack"):
		for collision in ($playerCollision as Area2D).get_overlapping_areas():
			if collision.has_method("takeDamage"):
				attack(collision)
	if Input.is_action_just_pressed("useItem"):
		useMana() # TODO change to useItem()

func useMana():
	$manaSystem.useMana(manaUsage)

func attack(collision):
	collision.takeDamage(attackPower)
	var node:GPUParticles2D = attackParticlesScene.instantiate()
	add_child(node)
	node.emitting = true
	
