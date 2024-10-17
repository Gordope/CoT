extends MarginContainer


@onready var zebra = $Zebra
@onready var input_label = $Rows/InputHistory
@onready var response_label  = $Rows/Response

signal text_revealed


func set_text(response: String, input: String = ""):
	if input == "":
		input_label.queue_free()
	else:
		input_label.text = " > " + input
	
	response_label.text = response
	print(response_label.visible_characters)
	print(response_label.get_total_character_count())
	$ShowTextTimer.start(0.03)
	
	await text_revealed
	
	return
	

func _on_show_text_timer_timeout() -> void:
	if response_label.visible_characters < response_label.get_total_character_count():
		response_label.visible_characters += 1
		$ShowTextTimer.start(0.03)
	else:
		$ShowTextTimer.stop()  # Stop the timer when text is fully revealed
		emit_signal("text_revealed")  # Emit the signal that the text is fully revealed
