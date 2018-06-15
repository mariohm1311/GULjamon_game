extends KinematicBody2D

export var velocity = 300
export var jump = 300
var vel = Vector2()


func _physics_process(delta):
	
	if(Input.is_action_pressed("go_left1")):
		vel.x = -velocity
	if(Input.is_action_pressed("go_right1")):
		vel.x = velocity
	if(Input.is_action_just_pressed("jump1") and is_on_floor()):
		vel.y = -jump
	if(Input.is_action_pressed("crouch1")):
		pass


	move_and_collide(vel*delta)





func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
