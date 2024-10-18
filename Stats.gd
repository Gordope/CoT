extends Node



var all_stats := {
	"str" = 0,
	"dex" = 0,
	"intel" = 0,
	"luck" = 0,
	"char" = 0,
	"wis" = 0,
	"con" =0 
}

func get_stats(stats: Array):
	all_stats["str"] = stats[0]
	all_stats["dex"] = stats[1]
	all_stats["intel"] = stats[2]
	all_stats["luck"] = stats[3]
	all_stats["char"] = stats[4]
	all_stats["wis"] = stats[5]
	all_stats["con"] = stats[6] 


func return_stat(stat):
	if all_stats.has(stat):
		return all_stats[stat]
	else:
		return 0
