extends Control

var file
var json_as_text
var json_as_dict
var list
var event_num
var event_dict
var event_text = ""
var ans1_text
var ans2_text
var ans3_text
var ans4_text
var character
var start = true
var a = 0

var oxch
var ench
var wtch
var fdch
var mtch
var rdch
var hpch
var psch
var log
var ach_text
var eff_text

signal diction(event_text, ans1_text, ans2_text, ans3_text, ans4_text, char)
signal changes(oxch, ench, wtch, fdch, mtch, rdch, hpch, psch)

const chars = ["Aella", "Deimos", "Enio", "Erot", "Melanippe", "Phobos"]

func json_3():
	json_as_text = FileAccess.get_file_as_string(file)
	json_as_dict = JSON.parse_string(json_as_text)
	list = json_as_dict["Лист1"]
	event_dict = list[str(a)]
	event_text = event_dict["Text"]

func event_take():
	file = "res://data/events.json"
	json_3()
	ans1_text = event_dict["Answer1"]
	ans2_text = event_dict["Answer2"]
	ans3_text = event_dict["Answer3"]
	ans4_text = event_dict["Answer4"]
	character = event_dict["character"]
	emit_signal("diction", event_text, ans1_text, ans2_text, ans3_text, ans4_text, character)

func var_take(n):
	file = "res://data/vars" + str(n) + ".json"
	json_3()
	oxch = event_dict["oxugen"]
	ench = event_dict["eneregy"]
	wtch = event_dict["water"] 
	fdch = event_dict["food"]
	mtch = event_dict["materials"]
	rdch = event_dict["radiation"]
	hpch = event_dict["happyness"]
	psch = event_dict["poisons"]
	log = event_dict["logs"]
	emit_signal("changes", oxch, ench, wtch, fdch, mtch, rdch, hpch, psch)

func _on_b_first_pressed():
	var_take(1)
	a = randi()%103
	event_take()

func _on_b_second_pressed():
	var_take(2)
	a = randi()%103
	event_take()

func _on_b_third_pressed():
	var_take(3)
	a = randi()%103
	event_take()

func _on_b_fourth_pressed():
	var_take(4)
	a = randi()%103
	event_take()
