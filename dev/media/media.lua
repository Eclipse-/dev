local T, C, L = unpack(select(2, ...))

C["media"] = {
	-- fonts (ENGLISH, SPANISH)
	["font"] = [=[Interface\Addons\dev\media\fonts\normal_font.ttf]=], -- general font of tukui
	["uffont"] = [[Interface\AddOns\dev\media\fonts\uf_font.ttf]], -- general font of unitframes
	["dmgfont"] = [[Interface\AddOns\dev\media\fonts\combat_font.ttf]], -- general font of dmg / sct
	
	-- textures
	["normTex"] = [[Interface\AddOns\dev\media\textures\normTex]], -- texture used for tukui healthbar/powerbar/etc
	["glowTex"] = [[Interface\AddOns\dev\media\textures\glowTex]], -- the glow text around some frame.
	["bubbleTex"] = [[Interface\AddOns\dev\media\textures\bubbleTex]], -- unitframes combo points
	["striped"] = [[Interface\AddOns\dev\media\textures\Striped]], -- unitframes combo points
	["copyicon"] = [[Interface\AddOns\dev\media\textures\copy]], -- copy icon
	["blank"] = [[Interface\AddOns\dev\media\textures\blank]], -- the main texture for all borders/panels
	["buttonhover"] = [[Interface\AddOns\dev\media\textures\button_hover]],

	-- custom textures
	["empath"] = [[Interface\AddOns\dev\media\textures\empath]],
	
	-- colors
	["bordercolor"] = { .1, .1, .1, 1 }, -- border color of tukui panels
	["backdropcolor"] = { 0, 0, 0, 1 }, -- background color of tukui panels
	["altbordercolor"] = { .4,.4,.4 }, -- alternative border color, mainly for unitframes text panels.
	
	-- sound
	["whisper"] = [[Interface\AddOns\dev\media\sounds\whisper.mp3]],
	["warning"] = [[Interface\AddOns\dev\media\sounds\warning.mp3]],
	
	-- custom fonts
	["pixel_font"] = [[Interface\Addons\dev\media\fonts\visitor2.ttf]],
	["caith"] = [[Interface\Addons\dev\media\fonts\caith.ttf]],
}