@tool
extends PanelContainer
class_name GameArea

@export var room_name = "Room Name":set = set_room_name
@export var room_description = "This is the description of the room":set = set_room_description

var exits: Dictionary = {}

func set_room_name(new_name: String):
	$MarginContainer/Rows/RoomName.text = new_name
	room_name = new_name
	
func set_room_description(new_discription: String):
	$MarginContainer/Rows/RoomDescription.text = new_discription
	room_description = new_discription

func connect_exit(direction: String, room):
	var exit = Exit.new()
	exit.room_1 = self
	exit.room_2 = room
	exits[direction] = exit
	match direction:
		"west":
			room.exits["east"] = exit
		"east":
			room.exits["west"] = exit
		"north":
			room.exits["south"] = exit
		"south":
			room.exits["north"] = exit
		_:
			printerr("Tried to connect invalid direction %s", direction)
