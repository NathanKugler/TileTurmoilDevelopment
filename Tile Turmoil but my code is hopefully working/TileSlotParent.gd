extends Area2D

export var ID = 0
const detectionRange = 128
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("TileSlot")
	monitoring = true
	print("Here: " + str(ID))
	
		
func _process(delta):
	pass

func checkIfTileIsOnTileSlot(characterInQuestion):
	if characterInQuestion.position.x <= position.x + detectionRange && characterInQuestion.position.x >= position.x - detectionRange:
		if characterInQuestion.position.y <= position.y + detectionRange &&  characterInQuestion.position.y >= position.y - detectionRange:
			if characterInQuestion.currentTileSlotOrangeIsOn == ID:
				if get_node("/root/Gamestate").isOrangeCarryingTile[0] == true:
					get_node("/root/Gamestate").orangeIsNotCarrying()
					characterInQuestion.tileBeingCarried.position = position
				elif get_node("/root/Gamestate").isOrangeCarryingTile[0] == false: 
					get_node("/root/Gamestate").orangeIsCarrying(characterInQuestion.tileBeingCarried)
					




func _on_TileSlot1_body_entered(body):
	if body.currentTileSlotOrangeIsOn > -1: #to verify that it is orange in question
		get_tree().call_group("Orange", "setCurrentTileSlotOrangeIsOn", ID)
		
		
