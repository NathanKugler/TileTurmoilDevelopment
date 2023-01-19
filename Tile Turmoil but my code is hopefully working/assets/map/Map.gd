extends Node2D


# This file is for handling multiple tiles and tileslots

var tileSlotOffset = Vector2(448,-1052)
const tileSlotCount = 16
# makes copies of the tileslots
func _ready():
	var tileslotscene = load("res://assets/TileSlots/TileSlotParent/TileSlotParent.tscn")
	for _i in 4:
		var TileSlot = tileslotscene.instance()
		add_child(TileSlot)	
		TileSlot.ID = _i
		TileSlot.position = tileSlotOffset
		tileSlotOffset.x += 448
		
		
	pass
