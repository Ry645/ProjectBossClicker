extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta): #TEST will migrate to player script   ...maybe
	if Input.is_action_just_pressed("attack"):
		damage()
	if Input.is_action_just_pressed("useItem"):
		useMana()

func _input(event):
	if event is InputEventMouseMotion:
		$player.position = event.position

func damage(): #TEST will migrate to player script somehow
	$bossSprite/healthSystem.takeDamage(1)

func useMana(): #TEST will migrate this to a signal in a player script
	$player/manaSystem.useMana(5)

func _on_boss_sprite_spawn_attack(node):
	add_child(node)


# TODO migrate ALL OF THIS to a manager

func playerHealthUpdate(minHealth, maxHealth, currentHealth):
	$playerHealthBar.valueUpdate(currentHealth/maxHealth)


func _on_mana_system_mana_update(minMana, maxMana, currentMana):
	$playerManaBar.valueUpdate(currentMana/maxMana)


func bossHealthUpdate(minHealth, maxHealth, currentHealth):
	$bossHealthBar.valueUpdate(currentHealth/maxHealth)

# TODO ALL OF THIS
