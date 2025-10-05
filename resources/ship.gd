extends Area2D

var speed := 0.0
var max_speed := 250.0
var velocity := Vector2(0, 0)
var steering_factor := 1
var bullet := preload("res://resources/bullet.tscn")
var direction := Vector2(0, 0)
@onready var sprite: Sprite2D = $Sprite2D

func _process(delta: float) -> void:
	var mouse := get_global_mouse_position()
	direction = mouse - position
	
	if direction.length() > 1.0: 
		direction = direction.normalized()
	
	if (Input.is_action_pressed("move_up")):
		speed = max_speed
	else: 
		speed = 0.0
	
	var desired_velocity := speed * direction
	var steering := desired_velocity - velocity
	velocity += steering * steering_factor * delta
	position += velocity * delta
	
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, -60, viewport_size.x + 60)
	position.y = wrapf(position.y, -60, viewport_size.y + 60)

	sprite.rotation = direction.angle()
	
	if Input.is_action_just_pressed("shoot"): 
		shoot()
	
	if Manager.lives <= 0:
		queue_free()

func shoot() -> void: 
	var new_bullet := bullet.instantiate()
	var bullet_angle := direction.angle() 
	var bullet_direction := Vector2(cos(bullet_angle), sin(bullet_angle))
	new_bullet.direction = bullet_direction.normalized()
	add_child(new_bullet)
