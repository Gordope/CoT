extends Button

@onready var game_info = self.get_parent().get_parent().get_parent()


func _on_pressed() -> void:
	game_info.delete_start_message()
