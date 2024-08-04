extends ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager._on_game_over.connect(GameOverStops)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_offset.x -= GameManager.SCROLLING_SPEED * delta

func GameOverStops() -> void:
	set_process(false)
