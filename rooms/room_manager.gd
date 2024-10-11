extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HouseRoom.connect_exit_unlocked("east", $OutsideRoom)
	
	var key = load_item("Key")
	var exit = $OutsideRoom.connect_exit_locked("north", $ShedRoom)
	key.use_value = exit
	$OutsideRoom.add_item(key)
	
	var innkeeper = load_npc("Innkeeper")
	var guard = load_npc("guard")
	
	$ShedRoom.add_npc(guard)
	$HouseRoom.add_npc(innkeeper)
	
	var sword = load_item("GuardSword")
	sword.use_value = exit
	$OutsideRoom.add_item(sword)


func load_item(item_name: String):
	return load("res://items/" + item_name + ".tres")


func load_npc(npc_name: String):
	return load("res://npcs/" + npc_name + ".tres")
