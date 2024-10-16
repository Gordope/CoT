extends MarginContainer


@onready var zebra = $Zebra
@onready var input_label = $Rows/InputHistory
@onready var response_label  = $Rows/Response


func set_text(response: String, input: String = ""):
	if input == "":
		input_label.queue_free()
	else:
		input_label.text = " > " + input
	
	response_label.text = response
	$ShowTextTimer.start(0.03)
	


func _on_show_text_timer_timeout() -> void:
	if response_label.visible_characters < response_label.get_total_character_count():
		response_label.visible_characters += 1
		$ShowTextTimer.start(0.03)
