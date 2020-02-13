slot0 = class("LotteryLayer", import("..base.BaseUI"))
slot1 = pg.activity_random_award_template

function slot0.getUIName(slot0)
	return "LotteryUI"
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1

	slot0:updateResource()
end

function slot0.updateResource(slot0)
	slot0.resCount = slot0.playerVO[id2res(slot0.resId)]
	slot2 = slot0.resource

	setText(slot0.resource:Find("Text"), slot0.resCount)
end

function slot0.setActivity(slot0, slot1)
	slot0.activityVO = slot1
	slot2 = slot0.activityVO
	slot0.resId = slot0.activityVO:getConfig("config_client").resId
	slot0.awardInfos = slot1:getAwardInfos()

	slot0:initActivityPools()
end

function slot0.initActivityPools(slot0)
	slot0.activityPools = {}
	slot1 = slot0.activityVO
	slot1 = slot0.activityVO:getConfig("config_data")
	slot3 = nil

	for slot7, slot8 in ipairs(_.select(uv0.all, function (slot0)
		return table.contains(uv0, slot0)
	end)) do
		slot10.id = slot8
		slot10.awards = slot0.awardInfos[slot8]
		slot10.prevId = slot3
		slot10.index = slot7
		slot9 = ActivityItemPool.New({})
		slot3 = slot8
		slot0.activityPools[slot9.id] = slot9
	end

	slot0.activityPool = slot0.activityPools[slot0.activityVO.data1 or slot1[1]]
end

function slot0.init(slot0)
	slot0.lotteryPoolContainer = slot0:findTF("left_panel/pool_list/content")
	slot0.attrs = slot0:findTF("left_panel/pool_list/arrs")
	slot0.mainItenContainer = slot0:findTF("right_panel/main_item_list/content")
	slot0.mainItenTpl = slot0:findTF("equipmenttpl", slot0.mainItenContainer)
	slot0.resource = slot0:findTF("left_panel/resource")
	slot0.launchOneBtn = slot0:findTF("left_panel/launch_one_btn")
	slot1 = slot0:findTF("res/Text", slot0.launchOneBtn)
	slot0.launchOneBtnTxt = slot0:findTF("res/Text", slot0.launchOneBtn):GetComponent(typeof(Text))
	slot0.launchTenBtn = slot0:findTF("left_panel/launch_ten_btn")
	slot1 = slot0:findTF("res/Text", slot0.launchTenBtn)
	slot0.launchTenBtnTxt = slot0:findTF("res/Text", slot0.launchTenBtn):GetComponent(typeof(Text))
	slot1 = slot0:findTF("right_panel/count_container/Text")
	slot0.awardsCounttxt = slot0:findTF("right_panel/count_container/Text"):GetComponent(typeof(Text))
	slot1 = slot0:findTF("right_panel")
	slot0.bgTF = slot0:findTF("right_panel"):GetComponent(typeof(Image))
	slot0.descBtn = slot0:findTF("right_panel/desc_btn")
	slot0.bonusWindow = slot0:findTF("Msgbox")

	setActive(slot0.bonusWindow, false)

	slot0.topPanel = slot0:findTF("top")
	slot0.nameTxts = {}
	slot0.nameTxtsN = {}
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("top/back_btn"), function ()
		slot0 = uv0

		uv0:emit(uv1.ON_CLOSE)
	end, SOUND_BACK)

	slot1[1] = slot0.launchOneBtn
	slot1[2] = slot0.launchTenBtn
	slot2 = {
		1,
		10
	}

	for slot6, slot7 in ipairs({}) do
		GetImageSpriteFromAtlasAsync(pg.item_data_statistics[id2ItemId(slot0.resId)].icon, "", slot7:Find("res/icon"), true)
		onButton(slot0, slot7, function ()
			if not uv0.activityPool then
				return
			end

			if uv0.activityPool ~= uv0.showActivityPool then
				slot0 = pg.TipsMgr.GetInstance()

				pg.TipsMgr.GetInstance():ShowTips(i18n("amercian_notice_5"))

				return
			end

			slot0 = uv0.activityPool

			if uv0.activityPool:getleftItemCount() == 0 then
				slot1 = pg.TipsMgr.GetInstance()

				pg.TipsMgr.GetInstance():ShowTips(i18n("activity_pool_awards_empty"))

				return
			end

			if not uv0.activityPool:enoughResForUsage((uv1[uv2] ~= "max" or math.min(slot0, math.max(math.floor(uv0.resCount / uv0.activityPool:getComsume().count), 1))) and math.min(slot0, uv1[uv2])) then
				slot2 = pg.TipsMgr.GetInstance()

				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return
			end

			function slot2()
				slot0 = pg.MsgboxMgr.GetInstance()
				slot2.content = i18n("amercian_notice_1", uv0 * uv1.count, uv0)

				function slot2.onYes()
					slot0 = uv0

					slot0.emit(slot0, LotteryMediator.ON_LAUNCH, uv0.activityVO.id, uv0.activityPool.id, uv1, uv2[uv3] == "max")
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({})
			end

			slot3 = uv0.playerVO

			if not uv0.playerVO:OilMax(1) then
				slot3 = uv0.playerVO

				if uv0.playerVO:GoldMax(1) then
					slot3 = pg.MsgboxMgr.GetInstance()
					slot5.content = i18n("amercian_notice_6")

					function slot5.onYes()
						uv0()
					end

					pg.MsgboxMgr.GetInstance():ShowMsgBox({})
				else
					slot2()
				end
			end
		end, SFX_PANEL)
	end

	onButton(slot0, slot0.descBtn, function ()
		if not uv0.showActivityPool then
			return
		end

		slot0 = uv0.showActivityPool
		slot4, slot5 = slot0:getItems()
		slot2 = uv0

		uv0:showBonus(slot0, slot1)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("window/top/btnBack", slot0.bonusWindow), function ()
		setActive(uv0.bonusWindow, false)
	end)
	onButton(slot0, slot0:findTF("window/button", slot0.bonusWindow), function ()
		setActive(uv0.bonusWindow, false)
	end)
	onButton(slot0, slot0.bonusWindow, function ()
		setActive(uv0.bonusWindow, false)
	end)

	slot0.bgs = {}
	slot0.attrTFs = {}

	for slot6 = 1, table.getCount(slot0.activityPools), 1 do
		slot7 = slot0.attrs

		if not IsNil(slot7:Find("arr_" .. slot6)) then
			table.insert(slot0.attrTFs, slot7)
		end
	end

	slot6 = slot0.resource

	GetImageSpriteFromAtlasAsync(pg.item_data_statistics[id2ItemId(slot0.resId)].icon, "", slot0.resource:Find("icon"), true)
	slot0:updateResource()
	slot0:initPoolTFs()
	slot0:updateActivityPoolState()
	triggerToggle(slot0.activityPoolTFs[slot0.activityPool.id], true)
end

function slot0.onActivityUpdated(slot0, slot1)
	slot0:setActivity(slot1)
	slot0:updateActivityPoolState()
	slot0:switchToPool(slot1.data1)
end

function slot0.initPoolTFs(slot0)
	slot0.activityPoolTFs = {}

	for slot4, slot5 in pairs(slot0.activityPools) do
		slot6 = slot0.lotteryPoolContainer
		slot6 = slot0.lotteryPoolContainer:GetChild(slot5.index - 1)
		slot0.activityPoolTFs[slot5.id] = slot6

		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				if uv0.prevId then
					slot1 = uv1.activityPools[uv0.prevId]

					if uv1.activityPools[uv0.prevId]:canOpenNext() then
						slot1 = uv1

						uv1:emit(LotteryMediator.ON_SWITCH, uv1.activityVO.id, uv0.id)
					else
						slot1 = uv1

						uv1:switchToPool(uv0.id)
					end
				end
			end
		end)
	end
end

function slot0.updateActivityPoolState(slot0)
	for slot4, slot5 in pairs(slot0.activityPools) do
		slot6 = slot0.activityPoolTFs[slot4]

		if slot5.prevId then
			slot7 = slot0.activityPools[slot5.prevId]
			slot7 = slot0.activityPools[slot5.prevId]:canOpenNext()

			if slot0.activityPools[slot5.prevId]:canOpenNext() then
				slot7 = false
			end
		else
			slot7 = true
		end

		setActive(slot6:Find("bg/unlock"), slot7)
		setActive(slot6:Find("bg/lock"), not slot7)
		setActive(slot6:Find("selected/unlock"), slot7)
		setActive(slot6:Find("selected/lock"), not slot7)
		setActive(slot6:Find("finish"), slot5:getleftItemCount() == 0)

		if slot0.attrTFs[slot5.index - 1] then
			triggerToggle(slot0.attrTFs[slot5.index - 1], slot7)
		end
	end
end

function slot0.switchToPool(slot0, slot1)
	slot2 = slot0.activityPools[slot1]
	slot3 = slot0.activityPoolTFs[slot1]

	slot0:updateMainItems(slot2)
	slot0:updateAwardsFetchedCount(slot2)

	if not slot0.bgs[slot1] then
		slot0.bgs[slot1] = LoadSprite("lotterybg/kr_re_" .. slot2.index)
	end

	slot0.bgTF.sprite = slot4
	slot5 = slot2:getComsume()
	slot7 = math.min(slot2:getleftItemCount(), math.max(math.floor(slot0.resCount / slot5.count), 1))
	slot0.launchOneBtnTxt.text = slot5.count
	slot0.launchTenBtnTxt.text = slot5.count * math.min(slot2:getleftItemCount(), 10)
	slot0.showActivityPool = slot0.activityPools[slot2.id]
end

function slot0.updateAwardsFetchedCount(slot0, slot1)
	if slot0.awardsCounttxt then
		slot2 = slot1:getFetchCount()
		slot3 = slot1:getItemCount()
		slot0.awardsCounttxt.text = setColorStr(slot3 - slot2, slot2 < slot3 and COLOR_GREEN or COLOR_RED) .. "/" .. slot3
	end
end

function slot0.updateMainItems(slot0, slot1)
	for slot7 = slot0.mainItenContainer.childCount, #slot1:getMainItems(), 1 do
		cloneTplTo(slot0.mainItenTpl, slot0.mainItenContainer)
	end

	for slot7 = 1, slot0.mainItenContainer.childCount, 1 do
		slot9 = slot7 <= #slot2

		setActive(slot0.mainItenContainer:GetChild(slot7 - 1), slot9)

		if slot9 then
			slot10 = slot2[slot7]

			updateDrop(slot8, slot10)
			setActive(slot8:Find("mask"), slot10.surplus <= 0)
			setText(slot8:Find("icon_bg/surplus"), "X" .. slot10.surplus or "")
			onButton(slot0, slot8, function ()
				uv0:emit(uv1.ON_DROP, uv2)
			end, SFX_PANEL)
		end
	end
end

function slot0.showBonus(slot0, slot1, slot2)
	setActive(slot0.bonusWindow, true)

	slot0.awardMain = slot1
	slot0.awardNormal = slot2
	slot0.trDropTpl = slot0:findTF("Msgbox/window/items/scrollview/item")
	slot0.trDrops = slot0:findTF("Msgbox/window/items/scrollview/list/list_main")
	slot0.dropList = UIItemList.New(slot0.trDrops, slot0.trDropTpl)
	slot3 = slot0.dropList

	slot3:make(function (slot0, slot1, slot2)
		slot3 = uv0

		slot3:updateDrop(slot0, slot1, slot2, uv0.nameTxts, uv0.awardMain)
	end)

	slot3 = slot0.dropList

	slot3:align(#slot0.awardMain)

	slot0.trDropsN = slot0:findTF("Msgbox/window/items/scrollview/list/list_normal")
	slot0.dropListN = UIItemList.New(slot0.trDropsN, slot0.trDropTpl)
	slot3 = slot0.dropListN

	slot3:make(function (slot0, slot1, slot2)
		slot3 = uv0

		slot3:updateDrop(slot0, slot1, slot2, uv0.nameTxtsN, uv0.awardNormal)
	end)

	slot3 = slot0.dropListN

	slot3:align(#slot0.awardNormal)
end

function slot0.updateDrop(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == UIItemList.EventUpdate then
		slot6 = slot5[slot2 + 1]

		updateDrop(slot3, slot6)
		setText(slot3:Find("count"), slot6.surplus .. "/" .. slot6.total)
		setActive(slot3:Find("mask"), slot6.surplus <= 0)

		if not slot4[slot2] then
			slot4[slot2] = ScrollTxt.New(findTF(slot3, "name_mask"), findTF(slot3, "name_mask/name"), true)
		end

		slot7.setText(slot7, slot6.name or slot6.cfg.name)
	end
end

function slot0.clearAllNameTxt(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5 = #slot1, 1, -1 do
		if slot1[slot5] then
			slot6 = slot1[slot5]

			slot6:destroy()
			table.remove(slot1, slot5)
		end
	end
end

function slot0.willExit(slot0)
	slot0.bgs = nil

	slot0:clearAllNameTxt(slot0.nameTxts)
	slot0:clearAllNameTxt(slot0.nameTxtsN)
end

return slot0