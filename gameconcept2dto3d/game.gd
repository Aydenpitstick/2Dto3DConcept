extends Node

@onready var TwoDCam = $"2D/Cam2D"
@onready var ThreeDCam = $"3D/Cam3D"
@onready var TwoDMusic = $"BG2D"
@onready var ThreeDMusic = $"BG3D"


signal TwoDActive
signal ThreeDActive
func _ready() -> void:
	TwoDCam.current = true
	TwoDActive.emit()
	TwoDMusic.play()
	ThreeDMusic.play()
	ThreeDMusic.volume_db = -80
	ThreeDCam.current = false

func _process(delta: float) -> void:
	if TwoDCam.current == true:
		TwoDActive.emit()
	if ThreeDCam.current == true:
		ThreeDActive.emit()
	
	if Input.is_action_just_pressed("switch"):
		if TwoDCam.current == true:
			TwoDCam.current = false
			ThreeDCam.current = true
			ThreeDMusic.volume_db = 0
			TwoDMusic.volume_db = -80
		elif ThreeDCam.current == true:
			ThreeDCam.current = false
			TwoDCam.current = true
			TwoDMusic.volume_db = 0
			ThreeDMusic.volume_db = -80
