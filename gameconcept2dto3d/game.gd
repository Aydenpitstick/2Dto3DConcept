extends Node

@onready var TwoDCam = $"2D/Cam2D"
@onready var ThreeDCam = $"3D/Cam3D"

func _ready() -> void:
	
	
	TwoDCam.current = true
	ThreeDCam.current = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch"):
		if TwoDCam.current == true:
			TwoDCam.current = false
			ThreeDCam.current = true
		elif ThreeDCam.current == true:
			ThreeDCam.current = false
			TwoDCam.current = true
