extends PanelContainer


const INPUT_RESPONSE = preload("res://input/input_response.tscn")

@export var max_lines_remembered := 30

var should_zebra := false

@onready var scroll = $Scroll
@onready var scrollbar = scroll.get_v_scroll_bar()
@onready var history_rows = $Scroll/HistoryRows

var history_rows_queue := {}

@onready var auto_scroll = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scrollbar.changed.connect(handle_scrollbar_changed)

#### PUBLIC #####
func create_response(response_text: String):
	#var response = INPUT_RESPONSE.instantiate()
	history_rows_queue[response_text] = null
	#response.set_text(response_text)
	

func create_response_with_input(response_text: String, input_text: String):
	#var input_response = INPUT_RESPONSE.instantiate()
	history_rows_queue[response_text] = input_text
	#input_response.set_text(response_text, input_text)


func add_scene(SCENE):
	#var scene = SCENE.instantiate()
	#history_rows.add_child(scene)
	history_rows_queue[SCENE] = null


func delete_start_message():
	history_rows.get_child(0).queue_free()
	history_rows.get_child(1).queue_free()

func test():
	if history_rows_queue.keys().is_empty() == false:
		if history_rows_queue.keys()[0] is String:
			var response = INPUT_RESPONSE.instantiate()
			history_rows.add_child(response)
			var key = history_rows_queue.keys()[0]  
			var value = history_rows_queue[key]     
			history_rows_queue.erase(key)
			if value != null:
				response.set_text(key, value)
			else:
				response.set_text(key)
		else:
			var scene = history_rows_queue.keys()[0].instantiate()
			history_rows_queue.erase(history_rows_queue.keys()[0])


func add_response_to_game(response: Control):
	history_rows.add_child(response)
	if not should_zebra:
		response.zebra.hide()
	should_zebra = !should_zebra
	delete_history_beyond_limit()

#### PRIVATE ####
func handle_scrollbar_changed():
	if auto_scroll == true:
		scroll.scroll_vertical = scrollbar.max_value
	

func delete_history_beyond_limit():
	if history_rows.get_child_count() > max_lines_remembered:
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		for i in range(rows_to_forget):
			history_rows.get_child(i).queue_free()
