extends Area2D

var activated = false

func _ready():
	if GameManager.respawn_position == global_position:
		activated = true
		$CollisionShape2D.set_deferred("disabled", true)
		return


func _on_body_entered(body):
	if body is PlayerController and !activated:
		activated = true
		
		$"Checkpoint SFX".play()
		GameManager.respawn_position = body.global_position
		GameManager.checkpoint_coins = GameManager.collected_coins.duplicate()
		GameManager.checkpoint_collected_coins = GameManager.collected_coins.duplicate()
		$CollisionShape2D.set_deferred("disabled", true)
