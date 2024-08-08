extends Control

@onready var en_label_1: Label = $MarginContainer/VBTutorial/En_Label1
@onready var en_label_2: Label = $MarginContainer/VBTutorial/En_Label2
@onready var en_label_3: Label = $MarginContainer/VBTutorial/En_Label3
@onready var pt_br_label_1: Label = $MarginContainer/VBTutorial/Pt_BR_Label1
@onready var pt_br_label_2: Label = $MarginContainer/VBTutorial/Pt_BR_Label2
@onready var pt_br_label_3: Label = $MarginContainer/VBTutorial/Pt_BR_Label3

var enLabels = []
var pt_brLabels = []

func _ready() -> void:
	enLabels = [en_label_1, en_label_2, en_label_3]
	pt_brLabels = [pt_br_label_1, pt_br_label_2, pt_br_label_3]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GoToMainMenu()


func GoToMainMenu():
	if Input.is_action_just_pressed("Exit"):
		get_tree().change_scene_to_packed(GameManager.mainScene)

func EnLabelOn() -> void:
	for brLabel in pt_brLabels:
		brLabel.hide()
	for enLabel in enLabels:
		enLabel.show()

func BrLabelOn() -> void:
	for brLabel in pt_brLabels:
		brLabel.show()
	for enLabel in enLabels:
		enLabel.hide()


func _on_en_button_pressed() -> void:
	EnLabelOn()

func _on_pt_br_button_pressed() -> void:
	BrLabelOn()
