extends Control


func _ready():
	$Buttons/SetLeftHanded.button_pressed = GameManager.left_handed


func _on_set_left_handed_toggled(toggled_on):
	GameManager.left_handed = toggled_on


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Assets of Jacob's Adventure/Scenes/Menus/start_menu.tscn")
