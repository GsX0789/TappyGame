extends Control

@onready var scoreText : Label = $MC/ScoreText

func _ready() -> void:
	GameManager.on_score_updated.connect(UpdateScoreText)

func UpdateScoreText() -> void:
	scoreText.text = str(GameManager.GetScore())
