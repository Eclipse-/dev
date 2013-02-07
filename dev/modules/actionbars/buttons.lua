local T, C, L, G = unpack(Tukui) 

-- kill buttons
do
	G.ActionBars.Bar2.ShowHideButton:Kill()
	G.ActionBars.Bar3.ShowHideButton:Kill()
	G.ActionBars.Bar4.ShowHideButton:Kill()
	G.ActionBars.Bar5.ShowHideButtonTop:Kill()
	G.ActionBars.Bar5.ShowHideButtonBottom:Kill()

	-- exit vehicle button, two exist
	-- G.ActionBars.ExitVehicleLeft
	-- G.ActionBars.ExitVehicleRight
end