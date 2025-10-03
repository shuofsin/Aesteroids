extends Area2D

@export var speed := 1000.0
@export var direction := Vector2(1, 0)
@onready var sprite: Sprite2D = $Sprite2D
var velocity := Vector2(0, 0)

func _process(delta: float) -> void:
	velocity += direction * speed * delta
	position = velocity
	if velocity.length() > 0.0:
		sprite.rotation = velocity.angle()
