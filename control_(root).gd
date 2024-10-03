extends Control

# Total skill points and dictionary to track skill points used
var total_skill_points: int = 100
var skill_points_used: Dictionary = {
	"Strength": 0,
	"Dexterity": 0,
	"Intelligence": 0,
	"Luck": 0,
	"Charisma": 0,
	"Wisdom": 0,
	"Perception": 0,
}

# Nodes for UI elements
@onready var remaining_label: Label = $"VBoxContainer/Label (Remaining points)"  # Label showing remaining skill points
@onready var all_points_used_label: Label = $"VBoxContainer/Label (All points used)"  # Label for all points used message

# Skill sliders
@onready var strength_slider: Slider = $"VBoxContainer/HBoxContainer (str)/HSlider (str)"
@onready var dexterity_slider: Slider = $"VBoxContainer/HBoxContainer (dex)/HSlider (dex)"
@onready var intelligence_slider: Slider = $"VBoxContainer/HBoxContainer (luck)/HSlider (luck)"
@onready var luck_slider: Slider = $"VBoxContainer/HBoxContainer (luck)/HSlider (luck)"
@onready var charisma_slider: Slider = $"VBoxContainer/HBoxContainer (char)/HSlider (char)"
@onready var wisdom_slider: Slider = $"VBoxContainer/HBoxContainer (wis)/HSlider (wis)"
@onready var perception_slider: Slider = $"VBoxContainer/HBoxContainer (per)/HSlider (per)"

func _ready() -> void:
	# Update remaining skill points on start
	update_remaining_points()

	# Connect slider value change signals correctly

	strength_slider.connect("value_changed", Callable(self, "_on_slider_value_changed"))
	dexterity_slider.connect("value_changed", Callable(self, "_on_slider_value_changed"))
	intelligence_slider.connect("value_changed", Callable(self, "_on_slider_value_changed"))
	luck_slider.connect("value_changed", Callable(self, "_on_slider_value_changed"))
	charisma_slider.connect("value_changed", Callable(self, "_on_slider_value_changed"))
	wisdom_slider.connect("value_changed", Callable(self, "_on_slider_value_changed"))
	perception_slider.connect("value_changed", Callable(self, "_on_slider_value_changed"))

func _on_slider_value_changed(value: float) -> void:
	# Find the calling slider and update the corresponding skill points used
	var slider = get_slide_context()  # Function to retrieve the context
	var skill_name: String = slider.get_name()  # Get the name of the slider

	skill_points_used[skill_name] = int(value)
	update_remaining_points()

	# Update the skill value label
	var skill_label = $VBoxContainer/HBoxContainer.get_child(get_skill_index(skill_name)).get_node("Label")
	skill_label.text = str(skill_points_used[skill_name])

func update_remaining_points() -> void:
	# Calculate total used skill points
	var used_points: int = 0
	for points in skill_points_used.values():
		used_points += points

	var remaining_points: int = total_skill_points - used_points
	remaining_label.text = "Remaining Skill Points: " + str(remaining_points)

	# Disable sliders if all points are used
	if remaining_points <= 0:
		for child in $VBoxContainer.get_children():
			if child is HBoxContainer:
				set_slider(false)  # Disable slider
		all_points_used_label.text = "All skill points have been used!"
	else:
		for child in $VBoxContainer.get_children():
			if child is HBoxContainer:
				set_slider(true)  # Enable slider
		all_points_used_label.text = ""

# Helper function to get the index of the skill
func get_skill_index(skill_name: String) -> int:
	match skill_name:
		"Strength": return 0
		"Dexterity": return 1
		"Intelligence": return 2
		"Luck": return 3
		"Charisma": return 4
		"Wisdom": return 5
		"Perception": return 6
	return -1  # Fallback if skill name doesn't match

# Helper function to get the slider context
func get_slide_context() -> Node:
	# This function should return the slider node that is emitting the signal
	return get_tree().current_scene.get_node("NodePathToYourSlider")  # Change this to your actual node path

# Function to disable or enable the slider
func set_slider(disabled: bool) -> void:
	strength_slider.slider_disabled = disabled
	
