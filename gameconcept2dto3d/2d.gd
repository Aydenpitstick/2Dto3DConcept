extends CharacterBody3D


const SPEED = 50.0
const JUMP_VELOCITY = 15.0
var CanMove = false

func _physics_process(delta: float) -> void:
	if CanMove == true:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

	# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
			if velocity.x > 0:
				$Sprite3D.flip_h = true
			else:
				$Sprite3D.flip_h = false
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
		

func _on_game_two_d_active() -> void:
	CanMove = true


func _on_game_three_d_active() -> void:
	CanMove = false
	pass # Replace with function body.
