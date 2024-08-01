extends Sprite2D

#TODO add iframes

class_name BossSprite

signal spawnAttack(node)

var bossStage:int = 1

#INFO DO NOT CHANGE NAME WITHOUT MAKING SURE NO DATA IS LOST
@export var swordSlashSets:Array[PackedScene]

#TEST will later have something else trigger this event
func _ready():
	startBoss()

func startBoss():
	$attackTimer.start()


func _on_attack_timer_timeout():
	attack()

func attack():
	#TODO match bossStage:
	
	var rand:int = randi_range(0, swordSlashSets.size()-1)
	var swordNode = swordSlashSets[rand].instantiate()
	emit_signal("spawnAttack", swordNode)
