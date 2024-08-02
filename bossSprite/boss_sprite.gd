extends Sprite2D

#TODO add iframes

class_name BossSprite

signal spawnAttack(node)

var hasIFrames:bool = false
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


func takeDamage(damage):
	if !hasIFrames:
		$healthSystem.takeDamage(damage)
		setHasIFrames(true)
		$iFrameTimer.start()


func _on_boss_hitbox_send_damage(damage):
	takeDamage(damage)


func _on_i_frame_timer_timeout():
	setHasIFrames(false)

func setHasIFrames(iFrames):
	hasIFrames = iFrames
	if iFrames:
		material.set_shader_parameter("tint", Color(1, 102.0/255.0, 102.0/255.0))
	else:
		material.set_shader_parameter("tint", Color(1, 1, 1))
