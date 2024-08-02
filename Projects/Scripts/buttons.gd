extends Control

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_continue_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_options_pressed():
	get_node("Options/OptionsMenu").show()

func _on_exit_pressed():
	get_tree().quit();
