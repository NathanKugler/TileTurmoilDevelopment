extends Node2D


# This file is for handling multiple tiles and tileslots



func _ready():
	var importer = ResourceImporter.new()
	importer.import("res://assets/map/Map.tscn","res://assets/ExampleTile/ExampleTile.tscn")
	
	var duplicated_scene = load("res://assets/ExampleTile/ExampleTile.tscn")
	get_tree().add_child(duplicated_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
