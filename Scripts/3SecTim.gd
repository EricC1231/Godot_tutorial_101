extends Button

@export var Three_second_timer:Timer
@export var TextToShow:RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(Three_second_timer)
	assert(TextToShow)
	pass # Replace with function body.

func _on_pressed() -> void:
	Three_second_timer.start(3)
	TextToShow.hide()
	pass # Replace with function body.


func _on__second_timer_timeout() -> void:
	TextToShow.show()
	pass # Replace with function body.
