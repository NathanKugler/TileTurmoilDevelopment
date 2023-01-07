extends Node

var isOrangeCarryingTile = [false,-1]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Gamestate")
	
	
	#cool
func orangeIsCarrying(tile):
	isOrangeCarryingTile[0] = true
	isOrangeCarryingTile[1] = tile.ID
	print(tile.ID)
	
func orangeIsNotCarrying():
	isOrangeCarryingTile[0] = false
	isOrangeCarryingTile[1] = -1
	
func flipOrangeCarryingStatus():
	isOrangeCarryingTile = !isOrangeCarryingTile
	

	


# what this does:
# when the tile is/is not being carried by orange, it sets the correct value in this script
# Basically trying to get the tileslot to detect if something is in it's boundaries on command, then seeing if more than 50% of the tile is in the slot, then snapping the tile to the slot


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
