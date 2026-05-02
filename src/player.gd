extends CharacterBody2D;

@export var max_speed: float = 100.0;
@export var accel: float = 0.2;
@export var damp: float = 0.15;

@export var shoot_rate: float = 0.1;
var last_shoot_time: float;

@onready var sprite: Sprite2D = $Sprite2D;
@onready var shoot_point: Node2D = $ShootPoint;

var move_input: Vector2;

var bullet_scene: PackedScene = preload("res://scn/obj/bullet.tscn");

func _physics_process(dt):
	move_input = Input.get_vector("move_left", "move_right", "move_up", "move_down");
	
	if move_input.length() > 0:
		velocity = velocity.lerp(move_input * max_speed, accel);
	else:
		velocity = velocity.lerp(Vector2.ZERO, damp);
	
	move_and_slide();

func _process(dt):
	global_position.y = clamp(global_position.y, 0, 540)
	global_position.x = clamp(global_position.x, 0, 960)
	
	if Input.is_action_pressed("shoot"):
		if Time.get_unix_time_from_system() - last_shoot_time > shoot_rate:
			_shoot();

func _shoot():
	last_shoot_time = Time.get_unix_time_from_system();
	
	var bullet = bullet_scene.instantiate();
	get_tree().root.add_child(bullet);
	
	bullet.global_position = shoot_point.global_position;
	bullet.set_type(2);
