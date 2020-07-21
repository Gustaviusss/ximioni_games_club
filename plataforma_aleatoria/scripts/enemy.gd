extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 1

export(int) var walksize

func _ready():
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + walksize

func _process(delta):
	if(posicao_inicial <= posicao_final and flip):
		$AnimationPlayer.play("run")
		$".".position.x += velocidade
		$Sprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false
	
	if($".".position.x >= posicao_inicial and !flip):
		$AnimationPlayer.play("runleft")
		$".".position.x -= velocidade
		$Sprite.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true
