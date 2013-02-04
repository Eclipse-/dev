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
		G.Panels.LeftDataTextToActionBarLine:Kill()
	end
	if (G.Panels.BottomLeftCube) then
		G.Panels.BottomLeftCube:Kill()
	end
	if (G.Panels.BottomRightCube) then
		G.Panels.BottomRightCube:Kill()
	end
	
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
		G.Panels.DataTextMinimapRight:Kill()
	end
end

-- Modify panels
do
	G.Panels.DataTextLeft:ClearAllPoints()
	G.Panels.DataTextLeft:CreateShadow()
	G.Panels.DataTextLeft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 10)
	G.Panels.DataTextRight:ClearAllPoints()
	G.Panels.DataTextRight:CreateShadow()
	G.Panels.DataTextRight:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 10)
	
	if (G.Panels.LeftChatBackground) then
		G.Panels.LeftChatBackground:ClearAllPoints()
		G.Panels.LeftChatBackground:SetTemplate("Transparent")
		G.Panels.LeftChatBackground:CreateShadow()
		G.Panels.LeftChatBackground:Point("BOTTOMLEFT", G.Panels.DataTextLeft, "TOPLEFT", 0, 3)
		G.Panels.LeftChatBackground:Size(T.InfoLeftRightWidth, 165)
	end
	
	if (G.Panels.RightChatBackground) then
		G.Panels.RightChatBackground:ClearAllPoints()
		G.Panels.RightChatBackground:SetTemplate("Transparent")
		G.Panels.RightChatBackground:CreateShadow()
		G.Panels.RightChatBackground:Point("BOTTOMRIGHT", G.Panels.DataTextRight, "TOPRIGHT", 0, 3)
		G.Panels.RightChatBackground:Size(T.InfoLeftRightWidth, 165)
	end
end


-- actionbars
--G.ActionBars.Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 10)
--G.ActionBars.Bar4:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 10)