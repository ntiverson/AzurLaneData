slot2.trigger = {
	"onAttach",
	"onStack",
	"onRemove"
}
slot3.group = {
	id = 300,
	level = 1
}
slot2.arg_list = {
	add = 0,
	mul = -2000
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot0.effect_list = {}

return {
	time = 6,
	name = "减速",
	init_effect = "",
	picture = "",
	desc = "6s减速",
	stack = 1,
	id = 301,
	icon = 301,
	last_effect = "Darkness"
}