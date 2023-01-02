extends Area2D

const ID = 0
const detectionRange = 237
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("TileSlot")
	monitoring = false
	
func _process(delta):
	pass
#	if Input.is_action_just_pressed("TileSlotTestActionThingKey"):
#		monitoring = true
#		print("h")

func checkIfTileIsOnTileSlot(characterInQuestion):
	if characterInQuestion.position.x <= position.x + detectionRange && characterInQuestion.position.x >= position.x - detectionRange:
		if characterInQuestion.position.y <= position.y + detectionRange &&  characterInQuestion.position.y >= position.y - detectionRange:
			if characterInQuestion.currentTileSlotOrangeIsOn == ID:
				if get_node("/root/Gamestate").isOrangeCarryingTile[0] == true:
					get_node("/root/Gamestate").orangeIsNotCarrying()
					characterInQuestion.tileBeingCarried.position = position
				elif get_node("/root/Gamestate").isOrangeCarryingTile[0] == false: 
					get_node("/root/Gamestate").orangeIsCarrying()

func _on_ExampleTileSlot_area_entered(area):
	print(area)
	
