extends Node

class_name ManaSystem

signal manaUpdate(minMana, maxMana, currentMana)
signal addToMagicExtract(mana)

@export var maxMana:float = 100.0
@export var minMana:float = 0.0
@export var mana:float = 100.0

@export var regenPerSec:float = 5

@export var hasGodMode:bool = false

func _ready():
	emit_signal("manaUpdate", minMana, maxMana, mana)
	
	#TEST might start once boss starts and end once boss ends
	startRegenTimer()

func useMana(manaUsed) -> bool:
	if hasGodMode:
		manaUsed = 0
	
	if mana < manaUsed:
		return false
	
	changeMana(-manaUsed)
	return true

func changeMana(amount:float): #main function used for altering mana
	var previousMana:float = mana
	mana += amount
	if mana > maxMana:
		emit_signal("addToMagicExtract", maxMana-previousMana)
		mana = maxMana
	
	emit_signal("manaUpdate", minMana, maxMana, mana)
	print("mana: ", mana)

func regen():
	changeMana(regenPerSec)

func startRegenTimer():
	($regenTimer as Timer).start()

func stopRegenTimer():
	($regenTimer as Timer).stop()


func _on_regen_timer_timeout():
	regen()
