extends Parallax2D

@export var parallax_rate: float = 1.0;

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#autoscroll.x = -parallax_rate;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	screen_offset.x -= parallax_rate * delta;
