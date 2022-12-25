extends Area2D

const ID = 1
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
		if characterInQuestion.position.y <= position.x + detectionRange &&  characterInQuestion.position.y >= position.y - detectionRange:
			if characterInQuestion.currentTileSlotOrangeIsOn == ID:
				if get_node("/root/Gamestate").isOrangeCarryingTile == false:
					characterInQuestion.tileBeingCarried.position = position
					#get_node("/root/Orange").tileBeingCarried.position = position
				#get_tree().call_group()

func _on_ExampleTileSlot_area_entered(area):
	print(area)
	


func _on_TileSlot1_body_entered(body):
	if body.currentTileSlotOrangeIsOn > -1: #to verify that it is orange in question
		get_tree().call_group("Orange", "setCurrentTileSlotOrangeIsOn", ID)
		
