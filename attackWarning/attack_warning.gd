extends Sprite2D

#HACK & TODO make each attack warning have its own texture image instead of scaling an existing one

@export var warningDuration:float
@export var attackToSpawn:PackedScene

func _ready():
	$warningTimer.start(warningDuration)


func _on_warning_timer_timeout():
	#HACK bruh don't use get_parent()
	var node = attackToSpawn.instantiate()
	get_parent().add_child(node)
	node.global_transform = global_transform
	queue_free()
