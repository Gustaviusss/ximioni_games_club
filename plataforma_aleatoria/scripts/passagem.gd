extends Area2D

export(String,FILE,"*.tscn") var cenas

func _on_passagem_body_entered(player):
	get_tree().change_scene(cenas)
	pass
