extends TextureRect

@export var speed:float = 1.0
var initialPosition:Vector2
var elapsedTime:float = 0.0


func _ready() -> void:
	initialPosition = self.position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsedTime += delta
	self.rotation = (elapsedTime * speed)
	self.position = initialPosition + Vector2(sin(elapsedTime * speed)*100, cos(elapsedTime * speed)*100)
	pass
