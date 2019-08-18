
extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY=10
const ACCELERATION = 50
const MAX_SPEED= 300
const JUMP_HEIGHT=-500


var motion = Vector2()


func _ready():
	set_physics_process(true)
#	set_process(true)

#func _process(delta):
#
#	if Input.is_action_just_pressed("ui_left") and is_on_floor():
#		var musicNode = $"Audio Effect/AudioStreamPlayer2D"
#		musicNode.play()
#	elif Input.is_action_just_pressed("ui_right") and is_on_floor():
#		var musicNode = $"Audio Effect/AudioStreamPlayer2D"
#		musicNode.play()
#
#
#	if Input.is_action_just_released("ui_left") and is_on_floor():
#		var musicNode = $"Audio Effect/AudioStreamPlayer2D"
#		musicNode.stop()
#	elif Input.is_action_just_released("ui_right") and is_on_floor():
#		var musicNode = $"Audio Effect/AudioStreamPlayer2D"
#		musicNode.stop()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false

	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION,MAX_SPEED)

		$AnimatedSprite.flip_h= false
		$AnimatedSprite.play("run")

	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION,-MAX_SPEED)
		$AnimatedSprite.flip_h= true
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
		friction = true
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y=JUMP_HEIGHT
		if friction == true:
			motion.x=lerp(motion.x,0,0.2)
	else:
		if motion.y<0:
		 $AnimatedSprite.play("jump")

	motion=move_and_slide(motion,UP)

	pass
