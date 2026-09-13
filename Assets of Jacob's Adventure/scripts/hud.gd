extends CanvasLayer

func _process(_delta):
	$MarginContainer/VBoxContainer/CoinsLabel.text = "Coins: " + str(GameManager.collected_coins.size())
