extends ParallaxLayer

@onready var sprite2D: Sprite2D = $Sprite2D

@export var texture : Texture
@export var scrollScale : float = 0.0
@export var tx_x : float = 1920
@export var tx_y : float = 1080

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	motion_scale.x = scrollScale
	
	var scaleF = get_viewport_rect().size.y / tx_y
	
	
	sprite2D.texture = texture
	#Scale the bg correctly in the scene
	sprite2D.scale = Vector2(scaleF, scaleF)
	#Tells the engine when mirroring should occur
	motion_mirroring.x = tx_x * scaleF
