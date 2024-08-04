extends Control

@onready var high_score_number: Label = $MC/HBoxContainer/HighScoreNumber

func _ready() -> void:
	GameManager.LoadGameData()
	high_score_number.text = str(GameManager.GetHighScore())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#space key
	if Input.is_action_just_pressed("fly"):
		GameManager.LoadGameScene()
	ExitGame()
	Tutorial()

func ExitGame() -> void:
	#esc key
	if Input.is_action_just_pressed("Exit"):
		GameManager.SaveGameData()
		get_tree().quit()
		
func Tutorial() -> void:
	#shift key
	if Input.is_action_just_pressed("tutorial"):
		get_tree().change_scene_to_packed(GameManager.tutorialScene)
