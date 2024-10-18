@tool
extends PanelContainer
class_name GameArea

@export var room_name = "Room Name":set = set_room_name
@export_multiline var room_description = "This is the description of the room":set = set_room_description

var option1_name = ""
var option1_result_p = ""
var option1_result_n = ""
var option1_req_stat = ""

var option2_name = ""
var option2_result_p = ""
var option2_result_n = ""
var option2_req_stat = ""


var option3_name = ""
var option3_result_p = ""
var option3_result_n = ""
var option3_req_stat = ""


var exits: Dictionary = {}
var npcs = []
var items = []

func set_room_name(new_name: String):
	$MarginContainer/Rows/RoomName.text = new_name
	room_name = new_name
	
func set_room_description(new_discription: String):
	$MarginContainer/Rows/RoomDescription.text = new_discription
	room_description = new_discription


func add_item(item: Item):
	items.append(item)
	

func remove_item(item: Item):
	items.erase(item)


func add_npc(npc: NPC):
	npcs.append(npc)


func get_full_description() -> String:
	var full_description = PackedStringArray([get_room_name()])
	
	full_description.append(get_room_description())
	
	var npc_description = get_npc_description()
	if npc_description != "":
		full_description.append(npc_description)
	
	var item_description = get_item_description()
	if item_description != "":
		full_description.append(item_description)
	
	full_description.append(get_exit_description())
	
	var full_description_string = "\n".join(full_description)
	return full_description_string


func get_room_name() -> String:
	return "You are now in: " + Types.wrap_location_text(room_name)



func get_room_description() -> String:
	return room_description

func get_npc_description() -> String:
	if npcs.size() == 0:
		return ""
	
	var npc_string = ""
	for npc in npcs:
		npc_string += Types.wrap_npc_text(npc.npc_name) + " "
	return "NPCs: " + npc_string

func get_item_description() -> String:
	if items.size() == 0:
		return ""
	
	var item_string = ""
	for item in items:
		item_string += Types.wrap_item_text(item.item_name) + " "
	return "Items: " + item_string

func get_special_description() -> String:
	var option_string = []
	option_string = " 1. " + option1_name + "\n" + " 2. " +option2_name + "\n" + " 3. " +option3_name
	
	return option_string

func get_exit_description() -> String:
	return "Exits: " + Types.wrap_location_text(" ".join(PackedStringArray(exits.keys())))


func connect_exit_locked(direction: String, room, room_2_override_name = "null"):
	return _connect_exit(direction, room, true, room_2_override_name)
	

func connect_exit_unlocked(direction: String, room, room_2_override_name = "null"):
	return _connect_exit(direction, room, false, room_2_override_name)


func _connect_exit(direction: String, room, is_locked: bool = false, room_2_override_name = "null"):
	var exit = Exit.new()
	exit.room_1 = self
	exit.room_2 = room
	exit.is_locked = is_locked
	exits[direction] = exit
	
	if room_2_override_name != "null":
		room.exits[room_2_override_name] = exit
	else:
		match direction:
			"west":
				room.exits["east"] = exit
			"east":
				room.exits["west"] = exit
			"north":
				room.exits["south"] = exit
			"south":
				room.exits["north"] = exit
			"path":
				room.exits["path"] = exit
			"inside":
				room.exits["outside"] = exit
			"inside":
				room.exits["inside"] = exit
			_:
				printerr("Tried to connect invalid direction %s", direction)
	return exit

func create_option1(option_label, positive_result, negative_result, stat_difficulty):
	option1_name = option_label
	option1_result_p = positive_result
	option1_result_n = negative_result
	option1_req_stat = stat_difficulty

func create_option2(option_label, positive_result, negative_result, stat_difficulty):
	option2_name = option_label
	option2_result_p = positive_result
	option2_result_n = negative_result
	option2_req_stat = stat_difficulty

func create_option3(option_label, positive_result, negative_result, stat_difficulty):
	option3_name = option_label
	option3_result_p = positive_result
	option3_result_n = negative_result
	option3_req_stat = stat_difficulty

func option1():
	var roll = randf() * 100
	var stat_value = option1_req_stat.split(",", false)
	var stat = stat_value[0]
	var difficulty = int(stat_value[1])
	var success_chance = Stats.get(stat) * 100 / difficulty
	if roll < success_chance:
		return option1_result_p
	else:
		return option1_result_n

func option2():
	var roll = randf() * 100
	var stat_value = option2_req_stat.split(",", false)
	var stat = stat_value[0]
	var difficulty = int(stat_value[1])
	var success_chance = Stats.get(stat) * 100 / difficulty
	if roll < success_chance:
		return option2_result_p
	else:
		return option2_result_n 


func option3():
	var roll = randf() * 100
	var stat_value = option3_req_stat.split(",", false)
	var stat = stat_value[0]
	var difficulty = int(stat_value[1])
	var success_chance = Stats.get(stat) * 100 / difficulty
	if roll < success_chance:
		return option3_result_p
	else:
		return option3_result_n 
