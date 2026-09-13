extends Area2D

func _on_body_entered(body):
	if body is PlayerController:
		call_deferred("_go_to_next_level")

func _go_to_next_level():
	GameManager.Next_Level()
