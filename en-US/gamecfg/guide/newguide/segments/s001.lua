slot2.style = {
	text = "Are you the new Commander? Welcome to the world of Azur Lane. I'll be your teacher!",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[1] = {
	alpha = 0.34
}
slot2.style = {
	text = "First, let's build a new ship.",
	mode = 2,
	dir = 1,
	posY = -152.6,
	posX = 215.2
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -24.76,
	posX = 19.75
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/buildButton"
}
slot1[2] = {
	alpha = 0.359
}
slot2.style = {
	text = "How about trying to build a <color=#ffde38>light ship</color> first?",
	mode = 1,
	dir = 1,
	posY = -46.82,
	posX = -126.5
}
slot3.triggerType = {
	2
}
slot3.fingerPos = {
	posY = -24.76,
	posX = 19.75
}
slot2.ui = {
	pathIndex = -1,
	path = "/UICamera/Canvas/UIMain/BuildShipUI(Clone)/bg/main/gallery/toggle_bg/toggles/light/frame"
}
slot1[3] = {
	alpha = 0.367,
	waitScene = "BuildShipScene"
}
slot2.style = {
	text = "Tap <color=#ffde38>build</color> to get started.",
	mode = 1,
	dir = 1,
	posY = -11.13,
	posX = 301.54
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -22.75,
	posX = 89.2
}
slot2.ui = {
	pathIndex = -1,
	path = "UICamera/Canvas/UIMain/BuildShipUI(Clone)/bg/main/gallery/start_btn"
}
slot1[4] = {
	alpha = 0.235
}
slot2.style = {
	text = "Once you've confirmed that you have enough resources, tap <color=#ffde38>confirm</color>!",
	mode = 1,
	dir = 1,
	posY = 65.31,
	posX = 103.3
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -24.49,
	posX = 21.42
}
slot2.ui = {
	pathIndex = -1,
	path = "/OverlayCamera/Overlay/UIMain/build_msg/window/btns/confirm_btn"
}
slot1[5] = {
	alpha = 0.306
}
slot0.events = {}

return {
	id = "S001"
}