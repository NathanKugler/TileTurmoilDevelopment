extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isBeingCarried = false
onready var playerCarringThisTile 

const detectionRange = 237 # also the resolution of the image  
# used to see if a character is in the range of the tile

func _ready():
	add_to_group("Tile")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isBeingCarried:
		get_tree().call_group("Gamestate", "orangeIsCarrying")
		position = playerCarringThisTile.position
	else:
		get_tree().call_group("Gamestate", "orangeIsNotCarrying")
		playerCarringThisTile = 0 # Null can't be put here so I put in 0 to represent no player

func carry(character):
	# what all of this shit does:
	# first, when the player presses the carry key, then execusion goes here
	# second, the character's position is compared to the tile's position. If the character lays within the bounds of the tile, then it proceeds
	# third, if the player is in bounds, then the tile switches being carried. So if the tile was being carried before, now it isn't. If the tile WASN'T being carried before, now it is.
	# It stores the player's data so in the future the player's position data can be used to set the tile's position data. 
	if character.position.x <= position.x + detectionRange && character.position.x >= position.x - detectionRange:
		if character.position.y <= position.x + detectionRange &&  character.position.y >= position.y - detectionRange:
			isBeingCarried = !isBeingCarried
			if isBeingCarried:	
	#			print("Character x: " + str(character.position.x) + " ExampileTile x: " + str(self.position.x))
	#			print("Character y: " + str(character.position.y) + " ExampileTile y: " + str(self.position.y))

			
				print("Is ExampleTile being carried? :" + str(isBeingCarried))
				
				
				playerCarringThisTile = character
				playerCarringThisTile.tileBeingCarried = self
				get_tree().call_group("Gamestate", "flipOrangeCarryingStatus") # keeps the knowledge if orange is carrying something in synced with gamestate
				print(get_tree().call_group("Gamestate", "flipOrangeCarryingStatus")) 
func _on_ExampleTile_body_entered(body):
	pass # Replace with function body.
