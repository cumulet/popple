extends Node

func get_random_value_in_dictionary(_dictionary: Dictionary):
	var size = _dictionary.size()
	var random_key = _dictionary.keys()[randi() % size]
	var value = _dictionary[random_key]
	return value
