extends Area2D

@export var coin_id : int

func _ready():
	if coin_id in GameManager.collected_coins:
		queue_free()

func _on_body_entered(body):
	if body is PlayerController:
		GameManager.Coin_Dissapear(self)
		
		$Sprite2D.visible = false
		$CollisionShape2D.set_deferred("disabled", true)
		
		$"Coin Collect SFX".play()
		
		await $"Coin Collect SFX".finished
		queue_free()
