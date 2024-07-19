extends Control

var val
signal death(cause)
const maxskull = ["Burned", "Burned", "Flooded", "Poisoned", "Radiated", "Poisoned"]
const minskull = ["Suffocated", "Freezed", "Suffocated", "Eated", "Poisoned", "Beated"]
const maxdeath = ["Из-за переизбытка кислорода баллоны прорвались, и все погибли в пожаре", "Из-за переизбытка электроэнергии аккумуляторы взорвались, все погибли в пожаре", "Из-за переизбытка воды цистерны прорвались, вода затопила ваш кабинет, а потом и большую часть колонии", "Еды стало настолько много, что разлагающие бактерии поглотили весь кислород и выделили массу токсинов, никто не пережил отравление и удушье", "Радиационное облучение превысило допустимый уровень, все погибли от лучевой болезни", "Токсины в вохдухе превысили допустимый уровень, от отравления погибли все"]
const mindeath = ["Кислорода не осталось, всё население колонии погибло от удушья", "Электроэнергии не осталось, все, включая вас, погибли в темноте и холоде", "Воды не осталось, все растения погибли и колонисты погибли от удушья", "Еды не осталось, самообьявившийся гражданиский совет решил пополнить рацион колонистов. В новый рацион попали вы", "Строительные материалы закончились, и как назло противотоксичные фильтры сломались. Отравление никто не смог пережить ", "Люди настолько вами недовольны, что толпой выбили дверь и избили досмерти"]
var tracks = ["res://musics/EEEEEEE.mp3", "res://musics/FIRST.OST.mp3", "res://musics/THEME_FOR_AMIR_GAMEMARS.mp3"]
var maxval
var minval
var ran
var bran

func _ready():
	$Music.stream = load("res://musics/FIRST.OST.mp3")
	$Music.play()

func _on_database_changes(oxch, ench, wtch, fdch, mtch, rdch, hpch, psch):
	$Oxbar.value += oxch
	$Enbar.value += ench
	$Wtbar.value += wtch
	$Fdbar.value += fdch
	$Mtbar.value += mtch
	$Rdbar.value += rdch
	$Hpbar.value += hpch
	$Psbar.value += psch

func smert():
	$Music.stream = load("res://musics/DEADEND.mp3")
	$Music.play()

func check(ox, en, wt, fd, mt, rd, hp, ps):
	var maxlis  = [ox, en, wt, fd, rd, ps]
	var minlis = [ox, en, wt, fd, mt, hp]
	if max(maxlis) > 200:
		for i in range(len(maxlis)):
			if maxlis[i] == max(maxlis):
				emit_signal("death", mindeath[i])
	elif min(minlis) <= 0:
		for i in range(len(maxlis)):
			if maxlis[i] == max(maxlis):
				emit_signal("death", maxdeath[i])

func rand(n):
	ran = randi()%n

func _on_music_finished():
	if ran == null:
		rand(2)
	tracks.append($Music.stream)
	$Music.stream = load(tracks[ran])
	tracks.pop_at(ran)
	ran = null
	$Music.play()
