extends TextureRect

var leftMaterial:ShaderMaterial
var rightMaterial:ShaderMaterial

# Called when the node enters the scene tree for the first time.
func _ready():
	setMaterials()
	

func setMaterials():
	leftMaterial = $progressLeft.get("material")
	rightMaterial = $progressRight.get("material")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func valueUpdate(value): #SLOW if statements in gdshader, change to step instead
	leftMaterial.set_shader_parameter("valueFilled", value)
	rightMaterial.set_shader_parameter("valueFilled", value)
	
	var minPos = $progressLeft.position.x - $progressLeft.size.x
	var maxPos = $progressLeft.position.x
	$progressRight.position.x = lerpf(minPos, maxPos, value)
