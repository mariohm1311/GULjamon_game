extends Sprite

var time = 0
var taken = false
export var time_to_explote = 1
export var distance_move = 200
var distance_edison = 0
var vector_move = Vector2()
var target

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	time += delta
	if time > time_to_explote and not taken:
		taken = true
		distance_edison = self.get_parent().get_node(target).position.distance_to(position)
		if distance_edison < distance_move:
			vector_move = self.get_parent().get_node(target).position - position
			vector_move = vector_move.normalized()
			vector_move += Vector2(0,-1)
			self.get_parent().get_node(target).create_impulse(vector_move*600)
		$animation.play('disappear')
		
func set_target(tgt):
	target = tgt