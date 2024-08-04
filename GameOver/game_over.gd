extends Control

@onready var gameOverLabel: Label = $GameOverLabel
@onready var pressSpaceLabel: Label = $PressSpaceLabel
@onready var textTimer: Timer = $Timer
@onready var canPressSpace : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager._on_game_over.connect(OnPlaneCrash)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fly") and canPressSpace:
		GameManager.LoadMainScene()

func OnPlaneCrash() -> void:
	show()
	textTimer.start()
	
func RunSequence() -> void:
	gameOverLabel.text = pressSpaceLabel.text
	canPressSpace = true
	#if it does not work as inded we can just hide one and show the other
	
func _on_timer_timeout() -> void:
	RunSequence()
	
