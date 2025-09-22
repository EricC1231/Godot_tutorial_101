extends Node2D

class_name UGDC_Dog

@onready var animator:AnimationPlayer = $AnimationPlayer

func Walk():
	animator.play("Walking")
	pass
	
func FaceRight():
	self.scale.x = absf(self.scale.x)
	pass
	
func FaceLeft():
	self.scale.x = -absf(self.scale.x)
	pass
	
func Stop():
	animator.play("Standing")
	pass
