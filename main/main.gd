extends Node2D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	$bossSprite.playerNode = $player

func _input(event):
	if event is InputEventMouseMotion:
		$player.position = event.position

func _on_boss_sprite_spawn_attack(node, spawnOffset):
	add_child(node)
	node.position += spawnOffset


# TODO migrate ALL OF THIS to a manager

func playerHealthUpdate(_minHealth, maxHealth, currentHealth):
	$playerHealthBar.valueUpdate(currentHealth/maxHealth)


func _on_mana_system_mana_update(_minMana, maxMana, currentMana):
	$playerManaBar.valueUpdate(currentMana/maxMana)


func bossHealthUpdate(_minHealth, maxHealth, currentHealth):
	$bossHealthBar.valueUpdate(currentHealth/maxHealth)

# TODO ALL OF THIS
