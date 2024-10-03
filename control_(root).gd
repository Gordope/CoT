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

	
