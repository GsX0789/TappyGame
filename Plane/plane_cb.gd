extends CharacterBody2D
#signal on_plane_death

@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var planeAnimation = $AnimationPlayer as AnimationPlayer
@onready var planeAnimetedSprite: AnimatedSprite2D = $AnimatedSprite2D


const JUMP_FORCE : float = -400.0
var gravityMultiplier : float = 1.75

var death : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += gravity * gravityMultiplier * delta
	
	Fly()
		
	move_and_slide()
	
	if is_on_floor():
		Die()

func Fly() -> void:
	
	if Input.is_action_just_pressed("fly"):
		velocity.y = JUMP_FORCE
		planeAnimation.play("planeRotation")

func Die() -> void:
	if death:
		return
	death = true
	planeAnimetedSprite.stop()
	GameManager._on_game_over.emit()
	set_physics_process(false)
