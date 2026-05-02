extends Area2D;

@export var texture_array: Array[Texture2D]

var bullet_type: int = 0;

@export var speed: float = 700.0;
@export var owner_group: String;
@export var damage: float = 1.0;

var direction = Vector2.RIGHT;

func _physics_process(dt):
	position += direction * speed * dt;

#func _process(dt):
	#translate(Vector2(speed * dt, 0));

func _on_body_entered(body: Node2D) -> void:
	if bullet_type == 0 && body.is_in_group("Player"):
		body.health -= damage;
		body.hit();
		queue_free(); #PLACEHOLDER
	if bullet_type == 2 && body.is_in_group("Enemy"):
		body.health -= damage;
		body.hit();
		queue_free(); #PLACEHOLDER

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free();

func set_type(type):
	bullet_type = type;
	$Sprite2D.texture = texture_array[type];
