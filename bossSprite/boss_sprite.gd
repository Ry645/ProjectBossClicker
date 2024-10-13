extends Sprite2D

#TODO add iframes

class_name BossSprite

signal spawnAttack(node, spawnOffset)

var hasIFrames:bool = false
var bossStage:int = 1

var playerNode

#INFO DO NOT CHANGE NAME WITHOUT MAKING SURE NO DATA IS LOST
@export var longAttackSets:Array[PackedScene]
@export var shortAttackSets:Array[PackedScene]

@export var bossDeathParticleScene:PackedScene

#TEMP will later have something else trigger this event
func _ready():
	startBoss()

func startBoss():
	$shortAttackTimer.start()


func _on_short_attack_timer_timeout():
	shortAttack()

func longAttack():
	#TODO match bossStage:
	match bossStage:
		1:
			var rand:int = randi_range(0, longAttackSets.size()-1)
			var swordNode = longAttackSets[rand].instantiate()
			var spawnOffset:Vector2 = Vector2.ZERO
			emit_signal("spawnAttack", swordNode, spawnOffset)

func shortAttack():
	match bossStage:
		1:
			var rand:int = randi_range(0, shortAttackSets.size()-1)
			var swordNode = shortAttackSets[rand].instantiate()
			var spawnOffset:Vector2 = playerNode.position
			emit_signal("spawnAttack", swordNode, spawnOffset)

func nextPhase():
	#match bossStage:
	pass

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

#TEMP will make a better show
func destroy():
	var bossDeathParticles = bossDeathParticleScene.instantiate()
	bossDeathParticles.position = global_position;
	get_parent().add_child(bossDeathParticles);
	bossDeathParticles.emitting = true;
	queue_free()
	
