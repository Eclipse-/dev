-- import
local T, C, L, G = unpack(Tukui)

-- Kill panels
do
	-- lines & cubes
	G.ActionBars.Pet.BackgroundLink:Kill()
	G.Panels.BottomPanelOverActionBars:Kill()
	G.Panels.BottomLeftVerticalLine:Kill()
	G.Panels.BottomRightVerticalLine:Kill()
	G.Panels.BottomRightLine:Kill()
	G.Panels.BottomLeftLine:Kill()
	if (G.Panels.RightDataTextToActionBarLine) then
		G.Panels.RightDataTextToActionBarLine:Kill()
	end
	if (G.Panels.LeftDataTextToActionBarLine) then
		G.Panels.RightDataTextToActionBarLine:Kill()
	end
	G.Panels.BottomLeftCube:Kill()
	G.Panels.BottomRightCube:Kill()

	-- chat panels
	if (G.Panels.LeftChatTabsBackground) then
		G.Panels.LeftChatTabsBackground:Kill()
	end
	if (G.Panels.RightChatTabsBackground) then
		G.Panels.RightChatTabsBackground:Kill()
	end

	-- datatext panels
	if (G.Panels.DataTextMinimapLeft) then
		G.Panels.DataTextMinimapLeft:Kill()
	end
	if (G.Panels.DataTextMinimapRight) then
		G.Panels.DataTextMinimapLeft:Kill()
	end
end

-- Modify panels
do
	G.Panels.DataTextLeft:ClearAllPoints()
	G.Panels.DataTextLeft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 10)
	G.Panels.DataTextRight:ClearAllPoints()
	G.Panels.DataTextRight:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 10)
end


-- actionbars
--G.ActionBars.Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 10)
--G.ActionBars.Bar4:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 10)