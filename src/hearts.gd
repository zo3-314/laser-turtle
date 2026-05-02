extends Control


func _process(delta: float) -> void:
	if has_node("../Player"):
		if $"../Player".health < 5.0:
			$Heart5.hide()
		if $"../Player".health < 4.0:
			$Heart4.hide()
		if $"../Player".health < 3.0:
			$Heart3.hide()
		if $"../Player".health < 2.0:
			$Heart2.hide()
		if $"../Player".health <= 0.0:
			$Heart1.hide()
	else:
		get_tree().change_scene_to_file("res://scn/ui/loss_screen.tscn")
