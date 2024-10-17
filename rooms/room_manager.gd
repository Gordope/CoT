extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$WastelandRoom.connect_exit_unlocked("east", $OutsideRoom)
	var positive_result = "On the left you spot a faint shimmer in the wreckage—a broken piece of tech that might still be usable. On the right you spot one of your fellow mates, Reeve."
	var negative_result = "You sift through the wreckage, but everything looks the same—just broken metal and scraps. If there’s anything useful here, it’s hidden too well for you to find."
	$WastelandRoom.create_option1("[Check your surroundings.]", positive_result, negative_result, "int,10")
	
	positive_result = "You manage to shove aside a large piece of metal debris, uncovering a makeshift weapon—a broken crowbar."
	negative_result = ""
	$WastelandRoom.create_option2("[Try to move debris.]", positive_result, negative_result, "str,15")
	
	
	$WastelandRoom.add_item("")
	
	
	
	var key = load_item("Key")
	var exit = $OutsideRoom.connect_exit_locked("north", $ShedRoom)
	key.use_value = exit
	$OutsideRoom.add_item(key)
	
	var innkeeper = load_npc("Innkeeper")
	var guard = load_npc("guard")
	
	$ShedRoom.add_npc(guard)
	
	var sword = load_item("GuardSword")
	sword.use_value = exit
	$OutsideRoom.add_item(sword)


func load_item(item_name: String):
	return load("res://items/" + item_name + ".tres")


func load_npc(npc_name: String):
	return load("res://npcs/" + npc_name + ".tres")
