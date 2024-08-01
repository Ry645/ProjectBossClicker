extends Node2D

var temp = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta): #TEST will migrate to player script
	if Input.is_action_just_pressed("attack"):
		damage()
	if Input.is_action_just_pressed("useItem"):
		useMana()

func _input(event):
	if event is InputEventMouseMotion:
		$player.position = event.position

func damage(): #TEST will connect to boss health system
	temp -= 0.1
	$bossHealthBar.valueUpdate(temp)

func useMana(): #TEST will migrate this to a signal
	$player/manaSystem.useMana(5)

func _on_boss_sprite_spawn_attack(node):
	add_child(node)


func _on_health_system_health_update(minHealth, maxHealth, currentHealth):
	$playerHealthBar.valueUpdate(currentHealth/maxHealth)


func _on_mana_system_mana_update(minMana, maxMana, currentMana):
	$playerManaBar.valueUpdate(currentMana/maxMana)
