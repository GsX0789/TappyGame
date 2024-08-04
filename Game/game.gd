extends Node2D

@export var pipesScene: PackedScene

@onready var pipesHolder: Node = $PipesHolder 
@onready var spawnU: Marker2D = $PipesHolder/SpawnU
@onready var spawnB: Marker2D = $PipesHolder/SpawnB
@onready var spawnTimer: Timer = $SpawnTimer
@onready var pEngineSFX: AudioStreamPlayer = $PlaneEngineSound
@onready var gameOverSFX: AudioStreamPlayer = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.SetScore(0)
	GameManager._on_game_over.connect(OnGameOver)
	SpawnPipes()

#Spawn Pipes Between a random y value
func SpawnPipes() -> void:
	#Setting the random y value
	var yPos = randf_range(spawnU.position.y, spawnB.position.y)
	#instanciating the newPipes
	var newPipes = pipesScene.instantiate()
	#setting the newPipes position to be the yPos
	newPipes.position = Vector2(spawnB.position.x, yPos)
	#adding the NewPipes to be childrens of the PipesHolder Node
	pipesHolder.add_child(newPipes)

func StopPipes() -> void:
	spawnTimer.stop()
	for pipe in pipesHolder.get_children():
		pipe.set_process(false)
	
func GameOverSequence() -> void:
	pEngineSFX.stop()
	gameOverSFX.play()
	GameManager.SaveGameData()

func _on_spawn_timer_timeout() -> void:
	SpawnPipes()

func OnGameOver() -> void:
	StopPipes()
	GameOverSequence()

