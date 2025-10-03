extends Node2D

@onready var timer: Timer = $Timer

var aesteroid := preload("res://resources/aesteroid.tscn")

func _ready() -> void: 
	timer.timeout.connect(spawn_aesteroid)

func spawn_aesteroid() -> void:
	var aesteroid_instance := aesteroid.instantiate()
	
	var viewport_size := get_viewport_rect().size 
	var random_position := Vector2(0, 0)
	var random_scale := randf_range(1, 2)
	
	random_position.x = randf_range(0, viewport_size.x)
	random_position.y = randf_range(0, viewport_size.y)
	
	aesteroid_instance.position = random_position
	aesteroid_instance.angle = randf_range(0, 2 * PI)
	aesteroid_instance.scale.x = random_scale
	aesteroid_instance.scale.y = random_scale
	aesteroid_instance.speed *= (1 / random_scale)
	
	add_child(aesteroid_instance)
	pass
