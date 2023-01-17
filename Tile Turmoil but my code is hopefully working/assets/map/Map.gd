extends Node2D


# This file is for handling multiple tiles and tileslots

var rng = RandomNumberGenerator.new()
# makes copies of the tileslots
func _ready():
	var tileslotscene = load("res://assets/TileSlots/TileSlotParent/TileSlotParent.tscn")
	for _i in 2:
		rng.randomize()
		var TileSlot = tileslotscene.instance()
		add_child(TileSlot)	
		TileSlot.ID = _i
		TileSlot.position.x = rng.randi_range(0,500)
		TileSlot.position.y = rng.randi_range(0,500)
	pass
