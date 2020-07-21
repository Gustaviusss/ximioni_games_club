extends KinematicBody2D

const UP = Vector2(0,-1)
const JUMP = -400
var motion = Vector2(0,0)
const GRAVITY = 20
var speed = 200
var life = 3
onready var text = get_node("Control/Label")

func _ready():
	text.set_text("lifes: "+ str(life))

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$animacao.play("run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("die"):
		$animacao.play("die")
	elif Input.is_action_pressed("ui_accept"):
		$animacao.play("attack");
	
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$animacao.play("runleft")
		$Sprite.flip_h = true
	else: 
		motion.x = 0
		$animacao.play("idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP
	else:
		$animacao.play("jump")
	
	motion = move_and_slide(motion, UP)
	
func _on_Area2D_body_entered(body):
	if "enemy" in body.name:
		life -= 1
		text.set_text("lifes: "+ str(life))
	if life == 0:
		$".".queue_free()
		get_tree().change_scene("res://scenes/Control.tscn")


func _on_attack_body_entered(body):
	if "enemy" in body.name:  
		body.queue_free()
