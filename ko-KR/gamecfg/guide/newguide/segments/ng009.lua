return {
	id = "NG009",
	events = {
		{
			style = {
				text = "이 곳을 터치하면 지휘냥의 스킬과 어빌리티를 확인할 수 있습니다!",
				mode = 1,
				dir = -1,
				posY = -200,
				posX = 200
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/blur_panel/main/CommanderDetailUI(Clone)/info/skill_btn",
				triggerType = {
					2
				}
			}
		},
		{
			style = {
				text = "이 곳을 터치하면 지휘냥으로 인해 추가된 속성을 확인할 수 있습니다!",
				mode = 1,
				dir = -1,
				posY = -200,
				posX = 100
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/blur_panel/main/CommanderDetailUI(Clone)/info/addition_btn",
				triggerType = {
					2
				}
			}
		},
		{
			style = {
				text = "“강화”와 “어빌리티”를 통해 지휘냥을 업그레이드 할 수 있습니다. 이 부분은 지휘관이 직접 경험해보시기 바랍니다~",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = -500
			}
		},
		{
			style = {
				text = "이 곳을 터치하면 구체적인 도움 정보를 확인할 수 있습니다! 힘내요! 안녕~",
				mode = 1,
				dir = -1,
				posY = -200,
				posX = -500
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/blur_panel/main/left_panel/help_btn",
				fingerPos = {
					posY = -45,
					posX = 45
				}
			}
		}
	}
}
