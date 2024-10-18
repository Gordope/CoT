extends Node

var str = 0
var dex = 0
var intel = 0
var luck = 0
var char = 0
var wis = 0
var con = 0

var all_stats := {
	str = 0,
	dex = 0,
	intel = 0,
	luck = 0,
	char = 0,
	wis = 0,
	con =0 
}

func get_stats(stats: Array):
	str = stats[0]
	dex = stats[1]
	intel = stats[2]
	luck = stats[3]
	char = stats[4]
	wis = stats[5]
	con = stats[6] 
		
