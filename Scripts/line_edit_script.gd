extends LineEdit

@export var RichTextLabelToChange:RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(RichTextLabelToChange != null)
	pass # Replace with function body.

func _on_text_changed(new_text: String) -> void:
	RichTextLabelToChange.text = new_text;
	pass # Replace with function body.
