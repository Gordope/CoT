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

func _on_h_slider_str_value_changed(value: float) -> void:
	str = value
	str_spinbox.value = value

func _on_value_str_value_changed(value: float) -> void:
	str = value
	str_slider.value = int(value)
