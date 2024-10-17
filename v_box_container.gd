extends VBoxContainer

var maxPoints = 100
var str = 0
var dex = 0
var intel = 0
var luck = 0
var char = 0
var wis = 0
var con = 0


@onready var done_button = $DoneButton

@onready var error_label = $ErrorLabel

@onready var remaining_points = get_node("HBoxContainer/Value points")
@onready var value_points = get_node("HBoxContainer/Value points")
@onready var str_spinbox = get_node("HBoxContainer (str)/Value str")
@onready var str_slider = get_node("HBoxContainer (str)/HSlider str")
@onready var dex_spinbox = get_node("HBoxContainer (dex)/Value dex")
@onready var dex_slider = get_node("HBoxContainer (dex)/HSlider dex")
@onready var int_spinbox = get_node("HBoxContainer (int)/Value int")
@onready var int_slider = get_node("HBoxContainer (int)/HSlider int")
@onready var luck_spinbox = get_node("HBoxContainer (luck)/Value luck")
@onready var luck_slider = get_node("HBoxContainer (luck)/HSlider luck")
@onready var char_spinbox = get_node("HBoxContainer (char)/Value char")
@onready var char_slider = get_node("HBoxContainer (char)/HSlider char")
@onready var wis_spinbox = get_node("HBoxContainer (wis)/Value wis")
@onready var wis_slider = get_node("HBoxContainer (wis)/HSlider wis")
@onready var con_spinbox = get_node("HBoxContainer (con)/Value con")
@onready var con_slider = get_node("HBoxContainer (con)/HSlider con")
@onready var children_vbox = self.get_children()

func _ready() -> void:	
	remaining_points.text = str(100)
	


func _on_h_slider_str_value_changed(value: float) -> void:
	maxPoints += str - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	str = value
	str_spinbox.value = value

func _on_value_str_value_changed(value: float) -> void:
	maxPoints += str - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	str = value
	str_slider.value = int(value)
	
func _on_h_slider_dex_value_changed(value: float) -> void:
	maxPoints += dex - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	dex = value
	dex_spinbox.value = value

func _on_value_dex_value_changed(value: float) -> void:
	maxPoints += dex - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	dex = value
	dex_slider.value = int(value)
	
func _on_h_slider_int_value_changed(value: float) -> void:
	maxPoints += intel - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	intel = value
	int_spinbox.value = value

func _on_value_int_value_changed(value: float) -> void:
	maxPoints += intel - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	intel = value
	int_slider.value = int(value)
	
func _on_h_slider_luck_value_changed(value: float) -> void:
	maxPoints += luck - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	luck = value
	luck_spinbox.value = value

func _on_value_luck_value_changed(value: float) -> void:
	maxPoints += luck - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	luck = value
	luck_slider.value = int(value)

func _on_h_slider_char_value_changed(value: float) -> void:
	maxPoints += char - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	char = value
	char_spinbox.value = value

func _on_value_char_value_changed(value: float) -> void:
	maxPoints += char - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	char = value
	char_slider.value = int(value)

func _on_h_slider_wis_value_changed(value: float) -> void:
	maxPoints += wis - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	wis = value
	wis_spinbox.value = value

func _on_value_wis_value_changed(value: float) -> void:
	maxPoints += wis - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	wis = value
	wis_slider.value = int(value)
	
func _on_h_slider_con_value_changed(value: float) -> void:
	maxPoints += con - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	con = value
	con_spinbox.value = value

func _on_value_con_value_changed(value: float) -> void:
	maxPoints += con - value
	remaining_points.text = str(maxPoints)
	if (maxPoints < 0):
		red_ui()
	else:
		white_ui()
	con = value
	con_slider.value = int(value)

func red_ui():
	done_button.disabled = true
	done_button.text == "Done"
	error_label.text = "You cannot allocate more than 100 points to your skills."
	remaining_points.add_theme_color_override("font_color", Color.RED)
	value_points.add_theme_color_override("font_color", Color.RED)
	
	for child in children_vbox:
		if child is Label:
			child.add_theme_color_override("font_color", Color.RED)

func white_ui():
	done_button.disabled = false
	done_button.text = "Done"
	error_label.text = ""
	remaining_points.add_theme_color_override("font_color", Color.WHITE)
	value_points.add_theme_color_override("font_color", Color.WHITE)
	for child in children_vbox:
		if child is Label:
			child.add_theme_color_override("font_color", Color.WHITE)


func _on_done_button_pressed() -> void:
	if maxPoints > 0 and done_button.text == "Done":
		error_label.text = "You still have unused skill points. Are you sure you want to continue?"
		done_button.text = "Yes"
	else:
		var all_stats = [str, dex, intel, luck, char, wis, con]
		get_tree().root.stats_selected(all_stats)
