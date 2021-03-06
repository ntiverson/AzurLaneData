ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot2 = slot0.Battle.BattleConfig
slot3 = class("BattleEnvironmentUnit")
slot0.Battle.BattleEnvironmentUnit = slot3
slot3.__name = "BattleEnvironmentUnit"

function slot3.Ctor(slot0, slot1, slot2)
	uv0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._uid = slot1
end

function slot3.ConfigCallback(slot0, slot1)
	slot0._callback = slot1
end

function slot3.GetUniqueID(slot0)
	return slot0._uid
end

function slot3.SetTemplate(slot0, slot1)
	slot0._template = slot1

	slot0:initBehaviours()
end

function slot3.SetAOEData(slot0, slot1)
	slot0._expireTimeStamp = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._template.life_time
	slot0._aoeData = slot1
end

function slot3.GetAOEData(slot0)
	return slot0._aoeData
end

function slot3.GetBehaviours(slot0)
	return slot0._behaviours
end

function slot3.GetTemplate(slot0)
	return slot0._template
end

function slot3.UpdateFrequentlyCollide(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._behaviours) do
		slot6:UpdateCollideUnitList(slot1)
	end
end

function slot3.Update(slot0)
	for slot4, slot5 in ipairs(slot0._behaviours) do
		slot5:OnUpdate()
	end
end

function slot3.IsExpire(slot0, slot1)
	return slot0._expireTimeStamp < slot1
end

function slot3.Dispose(slot0)
	if slot0._callback then
		slot0._callback()
	end

	for slot4, slot5 in ipairs(slot0._behaviours) do
		slot5:Dispose()
	end
end

function slot3.initBehaviours(slot0)
	slot0._behaviours = {}

	for slot5, slot6 in ipairs(slot0._template.behaviours) do
		slot7 = uv0.Battle.BattleEnvironmentBehaviour.CreateBehaviour(slot6)

		slot7:SetUnitRef(slot0)
		slot7:SetTemplate(slot6)
		table.insert(slot0._behaviours, slot7)
	end
end
