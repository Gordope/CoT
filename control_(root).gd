extends Control

var maxPoints = 100
var str = 0
var dex = 0
var intel = 0
var luck = 0
var char = 0
var wis = 0
var con = 0

@onready var remaining_points = get_node("VBoxContainer/HBoxContainer/Value points")
@onready var str_spinbox = get_node("VBoxContainer/HBoxContainer (str)/Value str")
@onready var str_slider = get_node("VBoxContainer/HBoxContainer (str)/HSlider str")
@onready var dex_spinbox = get_node("VBoxContainer/HBoxContainer (dex)/Value dex")
@onready var dex_slider = get_node("VBoxContainer/HBoxContainer (dex)/HSlider dex")
@onready var int_spinbox = get_node("VBoxContainer/HBoxContainer (int)/Value int")
@onready var int_slider = get_node("VBoxContainer/HBoxContainer (int)/HSlider int")
@onready var luck_spinbox = get_node("VBoxContainer/HBoxContainer (luck)/Value luck")
@onready var luck_slider = get_node("VBoxContainer/HBoxContainer (luck)/HSlider luck")
@onready var char_spinbox = get_node("VBoxContainer/HBoxContainer (char)/Value char")
@onready var char_slider = get_node("VBoxContainer/HBoxContainer (char)/HSlider char")
@onready var wis_spinbox = get_node("VBoxContainer/HBoxContainer (wis)/Value wis")
@onready var wis_slider = get_node("VBoxContainer/HBoxContainer (wis)/HSlider wis")
@onready var con_spinbox = get_node("VBoxContainer/HBoxContainer (con)/Value con")
@onready var con_slider = get_node("VBoxContainer/HBoxContainer (con)/HSlider con")

func _ready() -> void:	
	remaining_points.text = str(100)


func _on_h_slider_str_value_changed(value: float) -> void:
	maxPoints += str - value
	remaining_points.text = str(maxPoints)
	str = value
	str_spinbox.value = value

func _on_value_str_value_changed(value: float) -> void:
	maxPoints += str - value
	remaining_points.text = str(maxPoints)
	str = value
	str_slider.value = int(value)
	
func _on_h_slider_dex_value_changed(value: float) -> void:
	maxPoints += dex - value
	remaining_points.text = str(maxPoints)
	dex = value
	dex_spinbox.value = value

func _on_value_dex_value_changed(value: float) -> void:
	maxPoints += dex - value
	remaining_points.text = str(maxPoints)
	dex = value
	dex_slider.value = int(value)
	
func _on_h_slider_int_value_changed(value: float) -> void:
	maxPoints += intel - value
	remaining_points.text = str(maxPoints)
	intel = value
	int_spinbox.value = value

func _on_value_int_value_changed(value: float) -> void:
	maxPoints += intel - value
	remaining_points.text = str(maxPoints)
	intel = value
	int_slider.value = int(value)
	
func _on_h_slider_luck_value_changed(value: float) -> void:
	maxPoints += luck - value
	remaining_points.text = str(maxPoints)
	luck = value
	luck_spinbox.value = value

func _on_value_luck_value_changed(value: float) -> void:
	maxPoints += luck - value
	remaining_points.text = str(maxPoints)
	luck = value
	luck_slider.value = int(value)

func _on_h_slider_char_value_changed(value: float) -> void:
	maxPoints += char - value
	remaining_points.text = str(maxPoints)
	char = value
	char_spinbox.value = value

func _on_value_char_value_changed(value: float) -> void:
	maxPoints += char - value
	remaining_points.text = str(maxPoints)
	char = value
	char_slider.value = int(value)

func _on_h_slider_wis_value_changed(value: float) -> void:
	maxPoints += wis - value
	remaining_points.text = str(maxPoints)
	wis = value
	wis_spinbox.value = value

func _on_value_wis_value_changed(value: float) -> void:
	maxPoints += wis - value
	remaining_points.text = str(maxPoints)
	wis = value
	wis_slider.value = int(value)
	
func _on_h_slider_con_value_changed(value: float) -> void:
	maxPoints += con - value
	remaining_points.text = str(maxPoints)
	con = value
	con_spinbox.value = value

func _on_value_con_value_changed(value: float) -> void:
	maxPoints += con - value
	remaining_points.text = str(maxPoints)
	con = value
	con_slider.value = int(value)
