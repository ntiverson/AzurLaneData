slot0 = class("JPSkirmishHeadFramePage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.goBtn = slot0:findTF("GoBtn", slot0.bg)
	slot0.getBtn = slot0:findTF("GetBtn", slot0.bg)
	slot0.gotBtn = slot0:findTF("GotBtn", slot0.bg)
	slot0.gotTag = slot0:findTF("GotTag", slot0.bg)
	slot0.progressBar = slot0:findTF("Progress", slot0.bg)
	slot0.progressText = slot0:findTF("ProgressText", slot0.bg)

	setActive(slot0.goBtn, false)
	setActive(slot0.getBtn, false)
	setActive(slot0.gotBtn, false)
	setActive(slot0.gotTag, false)
	setActive(slot0.progressText, false)
end

function slot0.OnDataSetting(slot0)
	if slot0.ptData then
		slot0.ptData:Update(slot0.activity)
	else
		slot0.ptData = ActivityPtData.New(slot0.activity)
	end
end

function slot0.OnFirstFlush(slot0)
	onButton(slot0, slot0.goBtn, function ()
		uv0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot0, slot1 = uv0.ptData:GetResProgress()

		uv0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = uv0.ptData:GetId(),
			arg1 = slot1
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	if not getProxy(ActivityProxy):getActivityById(ActivityConst.JP_SKIRMISH_EXP_ID) or slot1:isEnd() then
		slot2, slot3, slot4 = slot0.ptData:GetResProgress()

		setText(slot0.progressText, setColorStr(slot2, "#487CFFFF") .. "/" .. slot3)
		setSlider(slot0.progressBar, 0, 1, slot4)
		setActive(slot0.progressText, true)

		slot5 = slot0.ptData:CanGetAward()
		slot6 = slot0.ptData:CanGetNextAward()

		setActive(slot0.goBtn, slot0.ptData:CanGetMorePt() and not slot5 and slot6)
		setActive(slot0.getBtn, slot5)
		setActive(slot0.gotBtn, not slot6)
		setActive(slot0.gotTag, not slot6)
	end
end

function slot0.OnDestroy(slot0)
end

return slot0
