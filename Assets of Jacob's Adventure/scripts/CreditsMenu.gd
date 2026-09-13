extends Control

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Credits Animation":
		get_tree().change_scene_to_file("res://Assets of Jacob's Adventure/Scenes/Menus/start_menu.tscn")
