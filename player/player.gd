extends Sprite2D

#TODO add iframes

class_name Player

# raw damage without modifications
#TODO will add weapons that modify this somehow
var attackPower = 5

#TODO will tie to holding items later
var manaUsage = 5

func _process(_delta):
	inputProcess()

func _on_player_collision_send_damage(damage):
	($healthSystem as HealthSystem).takeDamage(damage)

func inputProcess():
	if Input.is_action_just_pressed("attack"):
		for hitBox in ($playerCollision as Area2D).get_overlapping_areas():
			hitBox.takeDamage(attackPower)
	if Input.is_action_just_pressed("useItem"):
		useMana()

func useMana(): #TEST will migrate this to a signal in a player script
	$manaSystem.useMana(manaUsage)
