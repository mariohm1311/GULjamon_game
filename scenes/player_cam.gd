extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var cam_pos = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_cam_pos(player):
	cam_pos = self.get_parent().get_node(player).position

func _process(delta):
	self.position = cam_pos
	
