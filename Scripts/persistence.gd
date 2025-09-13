extends Control

@export var DataInput:LineEdit
var data:Dictionary = {"TextData":""}
@export var DataDisplay:RichTextLabel

func _ready() -> void:
	assert(DataInput)
	assert(DataDisplay)

func SaveTextData():
	data["TextData"] = DataInput.text
	WriteFile(data)
	
func LoadAndDisplayData():
	data = ReadFile()
	DataDisplay.text = data["TextData"]

func WriteFile(DataToSave:Dictionary):
	#use write tag to create the file if it doesnt exist, and also overwrite any existing data
	var file = FileAccess.open("res://GameSave.dat", FileAccess.ModeFlags.WRITE)
	
	#I Use JSON as it lets me open the file on my computer to see what was actually saved
	file.store_pascal_string(JSON.stringify(DataToSave))
	# Note: another method for storing data is to store variables directly
	# ex: file.store_var()
	# Note 2: You can run multiple store commands in a row before writing to disk
	# Retrive them my running multiple get commands in a row when reading the file.
	# Note 3: Will not work on web builds
	
	#Always close a file once you are done writing it, this actually saves it to your computer
	file.close()
	pass

func ReadFile() -> Dictionary:
	# Always do this check as it will ensure your file exists otherwise future steps will error
	if(not FileAccess.file_exists("res://GameSave.dat")):
		printerr("No SaveFile Exists, Create One Before Reading")
		return {"TextData":""}

	# Note the read flag in the open function
	var file = FileAccess.open("res://GameSave.dat", FileAccess.ModeFlags.READ)
	
	# I prefer using JSON and dictionaries as it is a more robust method to store data
	var s := file.get_pascal_string()
	file.close()
	return JSON.parse_string(s)
