 extends KinematicBody2D


export var EnemySpeed = 40
export var GRAVITY = 10

var EnemyMotion = Vector2()
var EnemyDirection = 1
var UP = Vector2(0,-1)
var OppositeDirection = -1

func _ready():
	set_physics_process(true)
	

func _physics_process(delta):
	EnemyMotion.y += GRAVITY
	
	
	if is_on_wall():
		EnemyDirection= EnemyDirection*OppositeDirection
	
	if EnemyDirection== 1:
		$AnimatedSprite.flip_h= false
	elif EnemyDirection == -1:
		$AnimatedSprite.flip_h= true
	
	EnemyMotion.x = EnemyDirection*EnemySpeed
	EnemyMotion = move_and_slide(EnemyMotion,UP)
