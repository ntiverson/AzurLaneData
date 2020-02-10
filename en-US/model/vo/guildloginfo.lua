slot0 = class("GuildLogInfo", import(".BaseVO"))
slot0.CMD_TYPE_JOIN = 1
slot0.CMD_TYPE_SET_DUTY = 2
slot0.CMD_TYPE_QUIT = 3
slot0.CMD_TYPE_FIRE = 4
slot0.CMD_TYPE_GET_SHIP = 5
slot0.CMD_TYPE_FACILITY_CONTRIBUTION = 6
slot0.CMD_TYPE_FACILITY_CONSUME = 7

function slot0.Ctor(slot0, slot1)
	slot0.cmd = slot1.cmd
	slot0.time = slot1.time
	slot0.userId = slot1.user_id
	slot0.name = slot1.name
	slot0.arg0 = {}

	for slot5, slot6 in ipairs(slot1.arg0 or {}) do
		table.insert(slot0.arg0, slot6)
	end

	slot0.arg1 = slot1.arg1
end

function slot0.getConent(slot0)
	slot2 = pg.TimeMgr.GetInstance():STimeDescC(slot0.time, "[%m-%d %H:%M]")

	if slot0.cmd == uv0.CMD_TYPE_JOIN then
		return i18n("guild_log_new_guild_join", slot0.name), getOfflineTimeStamp(slot0.time)
	elseif slot0.cmd == uv0.CMD_TYPE_SET_DUTY then
		return i18n("guild_log_duty_change", slot0.name, GuildMember.dutyId2Name(slot0.arg1)), slot1
	elseif slot0.cmd == uv0.CMD_TYPE_QUIT then
		return i18n("guild_log_quit", slot0.name), slot1
	elseif slot0.cmd == uv0.CMD_TYPE_FIRE then
		return i18n("guild_log_fire", slot0.name), slot1
	elseif slot0.cmd == uv0.CMD_TYPE_GET_SHIP then
		slot4.configId = slot0.arg1
		slot3 = Ship.New({})
		slot6.type = PublicArg.TypePlayerName
		slot6.string = slot0.name
		slot4[1] = PublicArg.New({})
		slot6.type = PublicArg.TypeShipId
		slot6.int = slot0.arg1
		slot4[MULTRES] = PublicArg.New({})
		slot5.args = {}

		return {
			id = 3
		}, slot1
	elseif slot0.cmd == uv0.CMD_TYPE_FACILITY_CONTRIBUTION then
		slot5.id = id2ItemId(slot0.arg0[2])

		return slot0.name .. slot0:getDuty(), slot2, i18n("word_contribution"), slot0.arg0[1] .. Item.New({}):getConfig("name"), i18n("guild_facility_get_gold", slot0.arg0[3])
	elseif slot0.cmd == uv0.CMD_TYPE_FACILITY_CONSUME then
		slot3 = i18n("word_consume")
		slot4 = slot0.arg0[1] .. i18n("word_guild_res")
		slot5 = ""

		if slot0.arg0[2] then
			slot7.id = slot0.arg0[2]
			slot5 = i18n("guild_facility_upgrade", GuildFacility.New({}):getConfig("name"), slot0.arg0[3])
		end

		return slot0.name .. slot0:getDuty(), slot2, slot3, slot4, slot5
	end
end

function slot0.getDuty(slot0)
	slot1 = ""

	if slot0.arg1 then
		slot1 = " （" .. GuildMember.dutyId2Name(slot0.arg1) .. "）"
	end

	return slot1
end

return slot0