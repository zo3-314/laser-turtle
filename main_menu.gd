extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#get_tree().change_scene_to_file("")
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scn/main_game.tscn")

func _on_instructions_pressed():
	$Button_manager/TextureRect.visible = true

func _on_quit_pressed():
	get_tree().quit()

func _on_timer_timeout() -> void:
	$Button_manager/TextureRect2.hide();
