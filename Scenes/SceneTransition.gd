extends Control

@export var dog:UGDC_Dog
var sceneToLoad:String = "res://Scenes/Basic2dPlayerController.tscn"
var playPressed:bool = false
@export var LoadingScreen:ColorRect
var syntheticWaitTimer:float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(dog)
	assert(LoadingScreen)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(playPressed):
		syntheticWaitTimer += delta
		var progress = []
		ResourceLoader.load_threaded_get_status(sceneToLoad,progress);
		if(progress[0]==1 and syntheticWaitTimer > 2.0):
			var packed_scene = ResourceLoader.load_threaded_get(sceneToLoad)
			get_tree().change_scene_to_packed(packed_scene);
	pass
	
func LoadScene():
	playPressed = true
	LoadingScreen.show()
	dog.Walk()
	ResourceLoader.load_threaded_request(sceneToLoad)
