extends KinematicBody2D

export var vel_scalar = 300
export var jump = 1000
export var g_force = 20
var vel = Vector2()

var flipped = false
var moving = false

func _physics_process(delta):
	
	vel.y += g_force
		
	if Input.is_action_pressed("go_left1") and is_on_floor():
		vel.x = 0
		flipped = true
		moving = true
		$AnimatedSprite.flip_h = flipped
		if not $AnimatedSprite/AnimationPlayer.current_animation == "moving_ground":
    		$AnimatedSprite/AnimationPlayer.play("moving_ground")
		vel.x = -vel_scalar
	
	if Input.is_action_pressed("go_right1") and is_on_floor():
		vel.x = 0
		flipped = false
		moving = true
		$AnimatedSprite.flip_h = flipped
		if not $AnimatedSprite/AnimationPlayer.current_animation == "moving_ground":
    		$AnimatedSprite/AnimationPlayer.play("moving_ground")
		vel.x = vel_scalar
	
	if Input.is_action_pressed("jump1") and is_on_floor():
		vel.y = -jump
		moving = true
	
	if Input.is_action_pressed("go_right1") and not is_on_floor() and not vel.x >= vel_scalar:
		vel.x += 10
		flipped = false
		moving = true
	
	if Input.is_action_pressed("go_left1") and not is_on_floor() and not vel.x <= -vel_scalar :
		vel.x -= 10
		flipped = true
		moving = true
			
	if Input.is_action_pressed("crouch1"):
		pass
	
	if is_on_floor() and not moving:
		vel.x = 0
		$AnimatedSprite/AnimationPlayer.play("static")
	
	elif not is_on_floor():
		if vel.y <= 0:
			$AnimatedSprite.flip_h = flipped
			if not $AnimatedSprite/AnimationPlayer.current_animation == "moving_up":
	    		$AnimatedSprite/AnimationPlayer.play("moving_up")
		else:
			$AnimatedSprite.flip_h = flipped
			if not $AnimatedSprite/AnimationPlayer.current_animation == "moving_down":
	    		$AnimatedSprite/AnimationPlayer.play("moving_down")
		
	moving = false

	move_and_slide(vel, Vector2(0,-1))





func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
