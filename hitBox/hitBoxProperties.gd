class_name HitBoxProperties

@export var damageValue:float
@export var duration:float = 1
@export_enum("oneShot", "lingering") var hurtBoxType:int
@export var hitGroup:StringName = "hitGroup1"
@export var statusEffect:String

func _init(hitBoxType):
	var array
	if hitBoxType is Array:
		array = hitBoxType
	elif hitBoxType is String:
		array = HitBoxTypes.dictType[hitBoxType]
	
	#shorthand for hitGroup (ie 1 for hitGroup1)
	if array[3] is int:
		array[3] = "hitGroup" + str(array[3])
	
	for i in range(array.size()):
		set(HitBoxTypes.propertyList[i], array[i])
	
