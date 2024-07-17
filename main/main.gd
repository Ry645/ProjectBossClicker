extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _input(event):
	if event is InputEventMouseMotion:
		$player.position = event.position


func _on_boss_sprite_spawn_attack(node):
	add_child(node)
