extends PanelContainer


const INPUT_RESPONSE = preload("res://input/input_response.tscn")

@export var max_lines_remembered := 30

var should_zebra := false

@onready var scroll = $Scroll
@onready var scrollbar = scroll.get_v_scroll_bar()
@onready var history_rows = $Scroll/HistoryRows
@onready var auto_scroll := false

signal button_pressed_signal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scrollbar.changed.connect(handle_scrollbar_changed)

#### PUBLIC #####
func create_response(response_text: String):
	var response = INPUT_RESPONSE.instantiate()
	_add_response_to_game(response)
	await response.set_text(response_text)
	return
	

func create_response_with_input(response_text: String, input_text: String):
	var input_response = INPUT_RESPONSE.instantiate()
	_add_response_to_game(input_response)
	input_response.set_text(response_text, input_text)


func add_scene(SCENE):
	var scene = SCENE.instantiate()
	history_rows.add_child(scene)


func start_journey_pressed():
	history_rows.get_child(0).queue_free()
	history_rows.get_child(1).queue_free()
	auto_scroll = true
	emit_signal("button_pressed_signal")


#### PRIVATE ####
func handle_scrollbar_changed():
	if auto_scroll == true:
		scroll.scroll_vertical = scrollbar.max_value


func _add_response_to_game(response: Control):
	history_rows.add_child(response)
	if not should_zebra:
		response.zebra.hide()
	should_zebra = !should_zebra
	delete_history_beyond_limit()
	

func delete_history_beyond_limit():
	if history_rows.get_child_count() > max_lines_remembered:
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		for i in range(rows_to_forget):
			history_rows.get_child(i).queue_free()
