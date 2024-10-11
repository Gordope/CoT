extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var key = Item.new()
	key.initialize("key", Types.ItemTypes.KEY)
	key.use_value = $ShedRoom
	
	
	$HouseRoom.connect_exit_unlocked("east", $OutsideRoom)
	
	$OutsideRoom.add_item(key)
	var exit = $OutsideRoom.connect_exit_locked("north", $ShedRoom)
	key.use_value = exit
