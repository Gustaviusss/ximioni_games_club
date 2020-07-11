extends KinematicBody2D

const UP = Vector2(0,-1)
const JUMP = -400
var motion = Vector2(0,0)
const GRAVITY = 20
var speed = 200


func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_select"):
		$animacao.play("attack")
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
		$animacao.play("run")
		$animacao.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$animacao.play("run")
		$animacao.flip_h = true
	else: 
		motion.x = 0
		$animacao.play("idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP
	else:
		$animacao.play("jump")
	
	motion = move_and_slide(motion, UP)
	
	pass
