extends Control
var datas = []
const persy = ["Aella", "Deimos", "Enio", "Erot", "Melanipe", "Phobos"]
func _on_b_first_pressed():
	$Anim.play("new_day")

func _on_b_second_pressed():
	$Anim.play("new_day")

func _on_b_third_pressed():
	$Anim.play("new_day")

func _on_b_fourth_pressed():
	$Anim.play("new_day")

func _on_database_diction(event_text, ans1_text, ans2_text, ans3_text, ans4_text, char):
	datas = [event_text, ans1_text, ans2_text, ans3_text, ans4_text, char]
	$Timer.start()

func _on_timer_timeout():
	$Event.text = datas[0]
	$B_t_first.text = datas[1]
	$B_t_second.text = datas[2]
	$B_t_third.text = datas[3]
	$B_t_fourth.text = datas[4]
	if datas[5] in persy:
		$Actor.texture = load("res://images/Characters/" + datas[5] + ".png")
		$Name.text = datas[5]
	else:
		$Actor.texture = load("res://images/Characters/Gray_shadow.png")
		$Name.text = ""

func _on_live_death(cause):
	$B_t_first.hide()
	$B_t_second.hide()
	$B_t_third.hide()
	$B_t_fourth.hide()
	$B_first.hide()
	$B_second.hide()
	$B_third.hide()
	$B_fourth.hide()
	
