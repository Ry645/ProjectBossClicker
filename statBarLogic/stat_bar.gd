extends TextureRect

var leftMaterial:ShaderMaterial
var rightMaterial:ShaderMaterial

# Called when the node enters the scene tree for the first time.
func _ready():
	leftMaterial = $progressLeft.get("material")
	rightMaterial = $progressRight.get("material")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func valueUpdate(value): #SLOW if statements in gdshader
	leftMaterial.set_shader_parameter("valueFilled", value)
	rightMaterial.set_shader_parameter("valueFilled", value)
	$progressRight.position.x = lerpf(-252, 8, value) 
