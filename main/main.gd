extends Node2D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _input(event):
	if event is InputEventMouseMotion:
		$player.position = event.position

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
