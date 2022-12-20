extends KinematicBody2D


const SPEED = 500
const PlayerId = 0

onready var isCarryingTile
onready var tileBeingCarried
var movement = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	movement.x = 0
	movement.y = 0
	carry()
	apply_speed()
	
	move_and_slide(movement)
	isCarryingTile = get_node("/root/Gamestate").isOrangeCarryingTile

func apply_speed():
	if Input.is_action_pressed("orange_right"):
		movement.x += SPEED
	if Input.is_action_pressed("orange_left"):
		movement.x += -SPEED
	if Input.is_action_pressed("orange_down"):
		movement.y += SPEED
	if Input.is_action_pressed("orange_up"):
		movement.y += -SPEED



func carry():
	if Input.is_action_just_pressed("orange_pick_up"):
		get_tree().call_group("Tile","carry", self) 
		get_tree().call_group("TileSlot", "checkIfTileIsOnTileSlot", self) 
		
		
	
		
		
