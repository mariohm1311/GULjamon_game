extends KinematicBody2D


export var vel_scalar = 300
export var jump = 500
export var g_force = 20
var vel = Vector2()


func _physics_process(delta):
	vel.x = 0
	vel.y += g_force
	if(Input.is_action_pressed("go_left2")):
		vel.x = -vel_scalar
	if(Input.is_action_pressed("go_right2")):
		vel.x = vel_scalar
	if(Input.is_action_just_pressed("jump2")):
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
