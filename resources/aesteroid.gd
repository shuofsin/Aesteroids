extends Area2D

var direction := Vector2(0, 0)
var angle := 0.0
var speed := 300.0 
var rotation_speed := 1.3
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void: 
	direction = Vector2(cos(angle), sin(angle))
	if direction.length() > 1.0:
		direction = direction.normalized()
	area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	position += direction * speed * delta
	sprite.rotation += rotation_speed * delta
	
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, -60, viewport_size.x + 60)
	position.y = wrapf(position.y, -60, viewport_size.y + 60)

func _on_area_entered(area_that_entered: Area2D) -> void:
	if area_that_entered.is_in_group("ship"):
		Manager.lives -= 1
		queue_free()
	if area_that_entered.is_in_group("bullet"):
		if scale.x > 1.5 && scale.y > 1.5:
			var aesteroid_obj := preload("res://resources/aesteroid.tscn")
			var aesteroid_instance_one := aesteroid_obj.instantiate()
			var aesteroid_instance_two := aesteroid_obj.instantiate()
			var new_scale = scale.x * 0.5
			aesteroid_instance_one.position = position; 
			aesteroid_instance_one.scale = scale * 0.5 
			aesteroid_instance_one.speed *= 1 / (new_scale)
			aesteroid_instance_one.angle = randf_range(0, 2 * PI)
			aesteroid_instance_two.position = position; 
			aesteroid_instance_two.scale = scale * 0.5 
			aesteroid_instance_two.speed *= 1 / (new_scale)
			aesteroid_instance_two.angle = randf_range(0, 2 * PI)
			get_parent().add_child(aesteroid_instance_one)
			get_parent().add_child(aesteroid_instance_two)
		area_that_entered.queue_free()
		queue_free()
		Manager.points += scale.x * 100
		
