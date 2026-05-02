extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_tree().change_scene_to_file("")


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scn/main_game.tscn")


func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://instructions.tscn")


func _on_quit_pressed():
	get_tree().quit()
	
