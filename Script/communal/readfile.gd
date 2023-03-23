class_name ReadFile
extends Node

static func save(content,loadPath):
	var file = File.new()
	file.open(loadPath, File.WRITE)
	file.store_var(content)
	file.close()

static func loadData(loadPath):
	var file = File.new()
	file.open(loadPath, File.READ)
	var content = file.get_as_text()
	file.close()
	return str2var(content)
