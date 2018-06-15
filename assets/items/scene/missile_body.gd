extends KinematicBody2D

export var vel_scalar = 300
export var jump = 1000
export var g_force = 20
export var time_ability = 5

var vel = Vector2()
var explode_time = 0.75
var time = 0
var exploding = false
var exploded = false
var moving = true
var target 

var taken = false
export var distance_move = 4000
var distance_edison = 0
var vector_move = Vector2()

func _physics_process(delta):
	vel.y = vel_scalar
	if moving:
		if not $missile/AnimationPlayer.current_animation == "flying":
	    	$missile/AnimationPlayer.play("flying")
		
	var collision = move_and_collide(vel*delta)

	if collision != null:
		self.get_parent().get_node(target).position += Vector2(0,-10)
		time += delta
		moving = false
		distance_edison = self.get_parent().get_node(target).position.distance_to(position)
		if distance_edison < distance_move:
			vector_move = self.get_parent().get_node(target).position - position
			vector_move = vector_move.normalized()
			vector_move += Vector2(0,-1.5)
			if not exploded:
				self.get_parent().get_node(target).create_impulse(vector_move*1500)
				exploded = true
		
		if not $missile/AnimationPlayer.current_animation == "explosion":
			$missile/AnimationPlayer.play("explosion")
		if time >= explode_time:
			queue_free()


func set_target(tgt, tgt_position, tgt_velocity):
	target = tgt
	self.position = tgt_position + tgt_velocity*2.8 + Vector2(0,-600)


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass