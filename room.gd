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
	match direction:
		"west":
			exits[direction] = room
			room.exits["east"] = self
		"east":
			exits[direction] = room
			room.exits["west"] = self
		"north":
			exits[direction] = room
			room.exits["south"] = self
		"south":
			exits[direction] = room
			room.exits["north"] = self
		_:
			printerr("Tried to connect invalid direction %s", direction)
