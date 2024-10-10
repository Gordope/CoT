extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var key = Item.new()
	key.initialize("key", Types.ItemTypes.KEY)
	
	$HouseRoom.connect_exit("east", $OutsideRoom)
	$HouseRoom.add_item(key)
