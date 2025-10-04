extends Node2D

@onready var random_aesteroid_placer: Node2D = %RandomAesteroidPlacer

func restart_game() -> void: 
	Manager.lives = 3
	Manager.points = 0
	for aesteroid in random_aesteroid_placer.get_children(): 
		aesteroid.queue_free()
	var ship := preload("res://resources/ship.tscn")
	var player := ship.instantiate()
	player.position.x = get_global_mouse_position().x
	player.position.y = get_global_mouse_position().y
	add_child(player)
