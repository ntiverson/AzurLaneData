slot2.trigger = {
	"onLeader"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 12770,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 12770,
	target = "TargetSelf",
	time = 30
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}
slot0[2] = {}
slot0[3] = {}
slot0[4] = {}
slot0[5] = {}
slot0[6] = {}
slot0[7] = {}
slot0[8] = {}
slot0[9] = {}
slot0[10] = {}

return {
	desc_get = "",
	name = "希佩尔2",
	init_effect = "",
	id = 12770,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12770,
	last_effect = ""
}