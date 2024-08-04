extends Node2D

@onready var scoreSound: AudioStreamPlayer = $ScoreSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= GameManager.SCROLLING_SPEED * delta
	

func _on_screen_exited() -> void:
	queue_free()


func _on_pipes_body_entered(body: Node2D) -> void:
	if body.is_in_group(GameManager.PLANE_GROUP):
		body.Die()


func _on_laser_body_entered(body: Node2D) -> void:
	#If the player passes through the laser, it gets a point!
	if body.is_in_group(GameManager.PLANE_GROUP):
		GameManager.IncrementScore()
		scoreSound.play()
