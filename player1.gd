extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY=10
const ACCELERATION = 50
const MAX_SPEED= 300
const JUMP_HEIGHT=-400


var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false

	if Input.is_action_pressed("right"):
		motion.x = min(motion.x+ACCELERATION,MAX_SPEED)

		$AnimatedSprite.flip_h= false
		$AnimatedSprite.play("run")
		
	if Input.is_action_pressed("slide"):
		motion.x = min(motion.x+ACCELERATION,MAX_SPEED)

		$AnimatedSprite.flip_h= false
		$AnimatedSprite.play("slide")

	elif Input.is_action_pressed("left"):
		motion.x = max(motion.x-ACCELERATION,-MAX_SPEED)
		$AnimatedSprite.flip_h= true
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
		friction = true
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			motion.y=JUMP_HEIGHT
		if friction == true:
			motion.x=lerp(motion.x,0,0.2)
	else:
		if motion.y<0:
		 $AnimatedSprite.play("jump")

	motion=move_and_slide(motion,UP)

	pass
