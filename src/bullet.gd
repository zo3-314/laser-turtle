extends Area2D;

@export var texture_array: Array[Texture2D]

var bullet_type: int = 0;

@export var speed: float = 700.0;
@export var owner_group: String;

var direction = Vector2.RIGHT;

func _physics_process(dt):
	position += direction * speed * dt;

#func _process(dt):
	#translate(Vector2(speed * dt, 0));

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free();

func set_type(type):
	bullet_type = type;
	$Sprite2D.texture = texture_array[type];
