slot2.trigger = {
	"onFlagShip"
}
slot2.arg_list = {
	skill_id = 40210
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "与主力舰队交战时，旗舰受到伤害降低，依据战术属性",
	init_effect = "",
	id = 40210,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 40210,
	last_effect = ""
}