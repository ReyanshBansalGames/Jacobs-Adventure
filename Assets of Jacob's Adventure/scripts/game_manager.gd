extends Node


var respawn_position: Vector2 = Vector2.ZERO
var area_number = 1
var collected_coins: Array = []
var checkpoint_coins: Array = []
var checkpoint_collected_coins: Array = []


func die(player):
	if player == null:
		return
	
	call_deferred("_reload_scene")
	

func _reload_scene():
	get_tree().reload_current_scene()


func Coin_Dissapear(coin):
	if coin:
		collect_coin(coin.coin_id)


func collect_coin(coin_id):
	if coin_id == null:
		return
	
	if coin_id not in collected_coins:
		collected_coins.append(coin_id)


func set_checkpoint(pos: Vector2):
	respawn_position = pos


func Next_Level():
	respawn_position = Vector2.ZERO
	area_number += 1
	get_tree().change_scene_to_file("res://Assets of Jacob's Adventure/Scenes/Areas/area_" + str(area_number) + ".tscn")


func go_to_next_level(scene_path: String):
	if scene_path == "":
		return
	
	call_deferred("_change_scene", scene_path)


func _change_scene(scene_path):
	get_tree().change_scene_to_file(scene_path)


func _input(event):
	if event.is_action_pressed("GoToStartMenu"):
		var scene_path = get_tree().current_scene.scene_file_path
		
		if scene_path.begins_with("res://Assets of Jacob's Adventure/Scenes/Areas/area_"):
			get_tree().change_scene_to_file("res://Assets of Jacob's Adventure/Scenes/Menus/start_menu.tscn")
