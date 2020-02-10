slot0 = class("RefreshMilitaryShopCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(18102, {
		type = 0
	}, 18103, function (slot0)
		if slot0.result == 0 then
			slot5 = getProxy(PlayerProxy)
			slot6 = slot5:getData()
			slot9.gem = pg.arena_data_shop[1].refresh_price[getProxy(ShopsProxy):getMeritorousShop().refreshCount] or slot3.refresh_price[#slot3.refresh_price]

			slot6:consume({})
			slot5:updatePlayer(slot6)
			slot2:increaseRefreshCount()

			slot7 = {}

			for slot11, slot12 in ipairs(slot0.arena_shop_list) do
				slot13 = Goods.New(slot12, Goods.TYPE_MILITARY)
				slot7[slot13.id] = slot13
			end

			slot2:updateAllGoods(slot7)
			slot1:updateMeritorousShop(slot2)
			uv0:sendNotification(GAME.REFRESH_MILITARY_SHOP_DONE, Clone(slot2))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return slot0