extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var positive_result = "On the left you spot a faint shimmer in the wreckage—a broken piece of tech that might still be usable. On the right you spot one of your fellow mates, Reeve."
	var negative_result = "You sift through the wreckage, but everything looks the same—just broken metal and scraps. If there’s anything useful here, it’s hidden too well for you to find."
	$WastelandRoom.create_option1("[Check your surroundings.]", positive_result, negative_result, "int,10")
	
	positive_result = "You manage to shove aside a large piece of metal debris, uncovering a makeshift weapon—a broken crowbar."
	negative_result = "Despite your best efforts, the wreckage is too heavy, and you’re unable to find anything useful as a weapon. If you’re in trouble, you’ll have to rely on something else."
	$WastelandRoom.create_option2("[Try to move debris.]", positive_result, negative_result, "str,15")
	
	var crowbar = load_item("Crowbar")
	$WastelandRoom.add_item(crowbar)
	
	var signal_jammer = load_item("SignalJammer")
	$WastelandRoom.add_item(signal_jammer)
	
	$WastelandRoom.connect_exit_unlocked("north", $DestroyedConvoyRoom)
	
	var reeve = load_npc("Reeve")
	$WastelandRoom.add_npc(reeve)
	


func temp():
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
