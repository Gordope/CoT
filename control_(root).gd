extends Control

var maxPoints = 100
var str = 0
var dex = 0
var intel = 0
var luck = 0
var char = 0
var wis = 0
var per = 0

@onready var str_spinbox = get_node("VBoxContainer/HBoxContainer (str)/Value str")
@onready var str_slider = get_node("VBoxContainer/HBoxContainer (str)/HSlider str")
@onready var remaining_points = get_node("VBoxContainer/Label (Remaining points)")
@onready var dex_spinbox = get_node("VBoxContainer/HBoxContainer (dex)/Value dex")
@onready var dex_slider = get_node("VBoxContainer/HBoxContainer (dex)/HSlider dex")

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
