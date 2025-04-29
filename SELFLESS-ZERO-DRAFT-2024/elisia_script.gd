extends CharacterBody2D

@onready var animations = $AnimationPlayer
const walk_speed = 350
const acc = 10


func _physics_process(delta):
	movement(delta)
	
func movement(delta):
	if Input.is_action_pressed("right"):
		$Sprite.flip_h = true
		animations.play("Walk")
		velocity.x = walk_speed
		# velocity.x = min(velocity.x + acc, walk_speed)
		velocity.y = 0
	elif Input.is_action_pressed("left"):
		$Sprite.flip_h = false 
		animations.play("Walk")
		velocity.x = -walk_speed
		velocity.y = 0
	elif Input.is_action_pressed("up"):
		animations.play("Walk")
		velocity.x = 0
		velocity.y = -walk_speed
	elif Input.is_action_pressed("down"):
		animations.play("Walk")
		velocity.x = 0
		velocity.y = walk_speed
	else:
		animations.stop()
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
