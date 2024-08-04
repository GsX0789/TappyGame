extends Node

signal _on_game_over
signal on_score_updated

var saveLocation = "user://Tsave.save"

var gameScene : PackedScene = preload("res://Game/game.tscn")
var mainScene : PackedScene = preload("res://Main/MainScene.tscn")
var tutorialScene : PackedScene = preload("res://Tutorial/tutorial_scene.tscn")

const PLANE_GROUP : String = "plane"
const SCROLLING_SPEED: float = 120.0

var playerScore : int = 0
var playerHighScore : int = 0

func GetScore() -> int:
	return playerScore
	
func GetHighScore() -> int:
	return playerHighScore
	
func SetScore(v: int) -> void:
	playerScore = v
	if playerScore > playerHighScore:
		playerHighScore = playerScore
	on_score_updated.emit()

func IncrementScore() -> void:
	SetScore(playerScore + 1)

func LoadGameScene() -> void:
	get_tree().change_scene_to_packed(gameScene)

func LoadMainScene() -> void:
	get_tree().change_scene_to_packed(mainScene)

func SaveGameData():
	var file = FileAccess.open(saveLocation, FileAccess.WRITE)
	file.store_var(playerScore)
	file.store_var(playerHighScore)
	
func LoadGameData():
	if FileAccess.file_exists(saveLocation):
		var file = FileAccess.open(saveLocation, FileAccess.READ)
		playerScore = file.get_var(playerScore)
		playerHighScore = file.get_var(playerHighScore)
	else:
		print("There was no SaveGameData to load, creating a new one")
		playerScore = 0
		playerHighScore = 0
	
	
	
