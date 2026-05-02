extends CharacterBody2D;

@export var health: float = 50.0;

var theta: float = 0.0;
@export_range(0, 2 * PI) var alpha: float = 0.0;

@export var bullet_node: PackedScene;

func _process(dt):
	if health <= 0.0:
		queue_free();
		get_tree().change_scene_to_file("res://scn/ui/win_screen.tscn")

func get_vector(angle):
	theta = angle + alpha;
	return Vector2(cos(theta), sin(theta));

func shoot(angle):
	var bullet = bullet_node.instantiate();
	
	bullet.position = global_position;
	bullet.direction = get_vector(angle);
	bullet.set_type(0);
	
	get_tree().current_scene.call_deferred("add_child", bullet);
	
	$AudioStreamPlayer2D.play();

func _on_speed_timeout() -> void:
	shoot(theta);

func hit():
	$AnimationPlayer.play("hit");
	$AudioStreamPlayer2D2.play();
