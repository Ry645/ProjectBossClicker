class_name HitBoxTypes

static var propertyList:Array[String] = ["damageValue", "duration", "hurtBoxType", "hitGroup", "statusEffect"]

#property order: ["damageValue", "duration", "hurtBoxType", "hitGroup", "statusEffect"]
#@export_enum("oneShot", "lingering")
static var dictType = {
	"swordSlash" = [5, 0.5, 0, "hitGroup1", ""]
}
