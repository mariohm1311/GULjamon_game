extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	get_node("container_p1/vp/Node/player_cam").set_cam_pos('Tesla')
	get_node("container_p2/vp/Node/player_cam").set_cam_pos('Edison')