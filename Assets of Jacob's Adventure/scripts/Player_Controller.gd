extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -40.0
var direction = 0
var applied_spawn = false

func _physics_process(delta):
	if not applied_spawn:
		applied_spawn = true

		if GameManager.respawn_position != Vector2.ZERO:
			global_position = GameManager.respawn_position
			GameManager.respawn_position = Vector2.ZERO

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier
		$"Jump SFX".play()

	direction = Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()
	
	check_spike_collision()

func _ready():
	add_to_group("player")
	
func check_spike_collision():
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider is TileMap:
			var tilemap = collider
			var tile_pos = tilemap.local_to_map(collision.get_position())
			var tile_data = tilemap.get_cell_tile_data(0, tile_pos)

			if tile_data and tile_data.get_custom_data("type") == "spike": GameManager.die(PlayerController)
