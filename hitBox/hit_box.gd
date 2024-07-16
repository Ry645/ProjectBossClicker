extends Area2D

class_name HitBox

@onready var timer = $Timer

@export var hitBoxType:String = "swordSlash"
var hitBoxProperties:HitBoxProperties = HitBoxProperties.new(hitBoxType)

#oneShot: tracks enemies so it doesn't hit them again
#lingering: tracks enemies currently in its radius to set status effects
var enteredAreas:Array

func _ready():
	add_to_group(hitBoxProperties.hitGroup)
	timer.start(hitBoxProperties.duration)

#INFO
#for anything for detecting collision or anything else
#in the game world, use _physics_process instead of _process
func _on_area_entered(area:Area2D):
	if !area.is_in_group(hitBoxProperties.hitGroup):
		if area.has_method("takeDamage"):
			match hitBoxProperties.hurtBoxType:
				0: #store some kind of array of nodes it hit so it doesn't hit them again
					for enteredArea in enteredAreas:
						if enteredArea == area:
							return
					
					enteredAreas.append(area)
					area.takeDamage(hitBoxProperties.damageValue)
					
	


func _on_timer_timeout():
	queue_free()
