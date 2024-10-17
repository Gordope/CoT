extends Control

const STAT_SELECTOR = preload("res://stat_selector.tscn")
const START_BUTTON = preload("res://start_journey_button.tscn")


@onready var game_info = $Background/MarginContainer/Columns/Rows/GameInfo
@onready var command_processor = $CommandProcessor
@onready var room_manager = $RoomManager
@onready var player = $Player
@onready var all_stats := []

func _ready() -> void:
	game_info.button_pressed_signal.connect(started_journey)
	var intro_story = create_intro_story()
	await game_info.create_response(intro_story)
	game_info.add_scene(START_BUTTON)
	

func started_journey():
	await game_info.create_response("Before you set forth on your journey, it's time to customize your character. Your choices will shape your destiny in this world!")
	game_info.add_scene(STAT_SELECTOR)

	

func stats_selected(all_stats: Array):
	self.all_stats = all_stats
	
	game_info.history_rows.get_child(0).queue_free()
	game_info.history_rows.get_child(1).queue_free()
	
	await game_info.create_response(Types.wrap_system_text("You can type 'help' to see available commands."))
	
	var side_panel = $Background/MarginContainer/Columns/SidePanel
	command_processor.room_changed.connect(Callable(side_panel, "handle_room_changed"))
	command_processor.room_updated.connect(Callable(side_panel, "handle_room_changed"))
	
	var starting_room_response = command_processor.initialize(room_manager.get_child(0), player)
	game_info.create_response(starting_room_response)


func _on_input_text_submitted(new_text: String) -> void:
	if new_text.is_empty():
		return
	
	var response = command_processor.process_command(new_text)
	game_info.create_response_with_input(response, new_text)
	
	
func create_intro_story():
	var intro_story = "The world had been dying long before the ember core erupted. 
Cities once glistened beneath skies of steel and glass, thier towers reaching
for a future promised but never delivered. Humanity, ever hungry, ever blind, dug deeper,
demanded more. And beneath the surface, beneath the earth's skin, someting dark was stirring. 
The Ember Core was supposed to be the answer. A limitless power source. 
	
HUmanity's salvation.
	
But salvation turned to ash.
	
You remember the day the sky bled fire. The day the world split open, when the ground roared
beneath your feet, and a wave of burning light engulfed everything. You were a child then - too young
to understand the scale of the disaster, too innocent to graps the finality of it. They called it the
	
GREAT EMBER
	
and in a single breath, it turned cities to cinders, the air to poison, and the seas to boiling steam
	
and yet.....
some survived
	
YOU survived
	
It's been twenty years since the Ember Core detonated, tearing out the heart of the planet. You've
grown up in the Ashen Expanse, a wasteland of scorched earth and shattered ruins, where life clings like moss
to a dying tee. The cities of old are nothing byt hollow skeletons now, their bones blackened by the flames that
consumed them. Survivors roam the waste scavenging for scraps, fighting for drops of water and gasps of clean air.
You've spent you life among them, hiding from the dangers of the surface - radiation, mutated creatures, and the machines
that hunt the living
	
But lately, whispers have spread through the ruins, a promise of salvation, rumors carried on the wind like the scent of smoke.
	
They speak of a city - HAVENLIGHT."
	
	return intro_story
